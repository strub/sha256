(* -------------------------------------------------------------------- *)
require import AllCore List.
require (*--*) Bigop.

require export MyArrays.

from Jasmin require export JWord JArray.

(* -------------------------------------------------------------------- *)
abbrev "_.[_]" ['a] (s : 'a list) (i : int) =
  nth witness s i.

(* -------------------------------------------------------------------- *)
type state    = W32.t Array8.t.
type schedule = W32.t Array64.t.
type block    =  W8.t Array64.t.

(* -------------------------------------------------------------------- *)
op block_u32 (b : block) : W32.t Array16.t =
  Array16.init (fun i => W4u8.pack4 (Array64.sub b (4 * i) 4)).

(* -------------------------------------------------------------------- *)
(* Section 4.1.2. of FIPS 180-4                                         *)

op Ch (x y z : W32.t) : W32.t =
  (x `&` y) `^` (invw x `&` z). (* FIXME: invw?? *)

op Maj (x y z : W32.t) : W32.t =
  (x `&` y) `^` (x `&` z) `^` (y `&` z).

(* -------------------------------------------------------------------- *)
(* Section 4.1.3. of FIPS 180-4                                         *)

op Sigma0 (x : W32.t) : W32.t =
  (x `|>>>|` 2) `^` (x `|>>>|` 13) `^` (x `|>>>|` 22).

op Sigma1 (x : W32.t) : W32.t =
  (x `|>>>|` 6) `^` (x `|>>>|` 11) `^` (x `|>>>|` 25).

op sigma0 (x : W32.t) : W32.t =
  (x `|>>>|` 7) `^` (x `|>>>|` 18) `^` (x `>>>` 3).

op sigma1 (x : W32.t) : W32.t =
  (x `|>>>|` 17) `^` (x `|>>>|` 19) `^` (x `>>>` 10).
  

(* -------------------------------------------------------------------- *)
(* Section 4.2.2. of FIPS 180-4                                         *)

op Kint : int list = [
  0x428a2f98; 0x71374491; 0xb5c0fbcf; 0xe9b5dba5;
  0x3956c25b; 0x59f111f1; 0x923f82a4; 0xab1c5ed5;
  0xd807aa98; 0x12835b01; 0x243185be; 0x550c7dc3;
  0x72be5d74; 0x80deb1fe; 0x9bdc06a7; 0xc19bf174;
  0xe49b69c1; 0xefbe4786; 0x0fc19dc6; 0x240ca1cc;
  0x2de92c6f; 0x4a7484aa; 0x5cb0a9dc; 0x76f988da;
  0x983e5152; 0xa831c66d; 0xb00327c8; 0xbf597fc7;
  0xc6e00bf3; 0xd5a79147; 0x06ca6351; 0x14292967;
  0x27b70a85; 0x2e1b2138; 0x4d2c6dfc; 0x53380d13;
  0x650a7354; 0x766a0abb; 0x81c2c92e; 0x92722c85;
  0xa2bfe8a1; 0xa81a664b; 0xc24b8b70; 0xc76c51a3;
  0xd192e819; 0xd6990624; 0xf40e3585; 0x106aa070;
  0x19a4c116; 0x1e376c08; 0x2748774c; 0x34b0bcb5;
  0x391c0cb3; 0x4ed8aa4a; 0x5b9cca4f; 0x682e6ff3;
  0x748f82ee; 0x78a5636f; 0x84c87814; 0x8cc70208;
  0x90befffa; 0xa4506ceb; 0xbef9a3f7; 0xc67178f2
].

op K : W32.t list = map W32.of_int Kint.

(* -------------------------------------------------------------------- *)
(* Section 5.3.3. of FIPS 180-4                                         *)

op Hint : int Array8.t = Array8.of_list 0 [
  0x6a09e667; 0xbb67ae85; 0x3c6ef372; 0xa54ff53a;
  0x510e527f; 0x9b05688c; 0x1f83d9ab; 0x5be0cd19
].

op H : state =
  Array8.map W32.of_int Hint.

(* -------------------------------------------------------------------- *)
(* Section 6.2.2. of FIPS 180-4                                         *)

module Compress = {
  proc compress(st : state, m : block) : state = {
    var w : schedule <- witness;
    var i : int;
    var a, b, c, d, e, f, g, h : W32.t;
    var t : int;
    var t1, t2 : W32.t;

    i <- 0;
    while (i < 64) {
      if (i < 16) {
        w.[i] <- (block_u32 m).[i];
      } else {
        w.[i] <-
            sigma1 w.[i - 2]
          + w.[i - 7]
          + sigma0 w.[i - 15]
          + w.[i - 16];
      }
      i <- i + 1;
    }

    (a, b, c, d, e, f, g, h) <-
      (st.[0], st.[1], st.[2], st.[3], st.[4], st.[5], st.[6], st.[7]);

    t <- 0;
    while (t < 64) {
      t1 <- h + Sigma1 e + Ch e f g + K.[t] + w.[t];
      t2 <- Sigma0 a + Maj a b c;
      h  <- g;
      g  <- f;
      f  <- e;
      e  <- d + t1;
      d  <- c;
      c  <- b;
      b  <- a;
      a  <- t1 + t2;
      t  <- t + 1;
    }

    st <- Array8.of_list W32.zero [
      a + st.[0]; b + st.[1]; c + st.[2]; d + st.[3];
      e + st.[4]; f + st.[5]; g + st.[6]; h + st.[7]
    ];

    return st;
  }
}.
