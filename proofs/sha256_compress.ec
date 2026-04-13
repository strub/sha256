require import AllCore IntDiv CoreMap List Distr.

from Jasmin require import JModel_x86.

import SLH64.

require import MyArrays.

abbrev sha256__ghimask =
(W128.of_int 14673614098662033479292190307867688959).

abbrev sha256__glomask = (W128.of_int (-17651285859510386432)).

abbrev sha256__gshufmask =
(W128.of_int 16018520953223639909183530438118932995).

abbrev sha256__k256 =
((Array16.of_list witness)
[(W128.of_int (-29627983195058157030934240747838623848));
(W128.of_int (-112837071862315924527959103879550418341));
(W128.of_int 113049237965913743168401935176651221656);
(W128.of_int (-82931660421959298376567368941742170764));
(W128.of_int 47917797045927073096716805172172122561);
(W128.of_int 158144561128526963810356860083937815663);
(W128.of_int (-85935113618712751599284313441364455086));
(W128.of_int 26798283828294316176913778687078304755);
(W128.of_int 110616957474769960923106658406121278085);
(W128.of_int (-145622254690940552670406066070210579628));
(W128.of_int (-75203571849518637932342739077735389023));
(W128.of_int 21821285534185651672145540635128162329);
(W128.of_int 70037527473378178057290190800671785238);
(W128.of_int 138480827845386032857165513538659945651);
(W128.of_int (-153157139196462929619361736855865294098));
(W128.of_int (-76506041089038969744914109243269906438))]).

module M = {
  proc sha256__rotate (in_0:W128.t Array4.t) : W128.t Array4.t = {
    var tmp:W128.t;
    tmp <- in_0.[0];
    in_0.[0] <- in_0.[1];
    in_0.[1] <- in_0.[2];
    in_0.[2] <- in_0.[3];
    in_0.[3] <- tmp;
    return in_0;
  }
  proc sha256__update (x:W128.t Array4.t, k:W128.t, lomask:W128.t,
                       himask:W128.t) : W128.t Array4.t * W128.t = {
    var tmp:W128.t;
    var t:W128.t Array4.t;
    t <- witness;
    t.[0] <- (VPALIGNR_128 x.[1] x.[0] (W8.of_int 4));
    t.[3] <- (VPALIGNR_128 x.[3] x.[2] (W8.of_int 4));
    t.[2] <- (VPSRL_4u32 t.[0] (W128.of_int 7));
    x.[0] <- (VPADD_4u32 x.[0] t.[3]);
    t.[3] <- (VPSRL_4u32 t.[0] (W128.of_int 3));
    t.[1] <- (VPSLL_4u32 t.[0] (W128.of_int (32 - 18)));
    t.[0] <- (t.[3] `^` t.[2]);
    t.[3] <- (VPSHUFD_128 x.[3] (W8.of_int 250));
    t.[2] <- (VPSRL_4u32 t.[2] (W128.of_int (18 - 7)));
    t.[0] <- (t.[0] `^` t.[1]);
    t.[0] <- (t.[0] `^` t.[2]);
    t.[1] <- (VPSLL_4u32 t.[1] (W128.of_int (18 - 7)));
    t.[2] <- (VPSRL_4u32 t.[3] (W128.of_int 10));
    t.[3] <- (VPSRL_2u64 t.[3] (W128.of_int 17));
    tmp <- (t.[0] `^` t.[1]);
    x.[0] <- (VPADD_4u32 x.[0] tmp);
    t.[2] <- (t.[2] `^` t.[3]);
    t.[3] <- (VPSRL_2u64 t.[3] (W128.of_int (19 - 17)));
    t.[2] <- (t.[2] `^` t.[3]);
    t.[2] <- (VPSHUFB_128 t.[2] lomask);
    x.[0] <- (VPADD_4u32 x.[0] t.[2]);
    t.[3] <- (VPSHUFD_128 x.[0] (W8.of_int 80));
    t.[2] <- (VPSRL_4u32 t.[3] (W128.of_int 10));
    t.[3] <- (VPSRL_2u64 t.[3] (W128.of_int 17));
    t.[2] <- (t.[2] `^` t.[3]);
    t.[3] <- (VPSRL_2u64 t.[3] (W128.of_int (19 - 17)));
    tmp <- (t.[2] `^` t.[3]);
    tmp <- (VPSHUFB_128 tmp himask);
    x.[0] <- (VPADD_4u32 x.[0] tmp);
    x <@ sha256__rotate (x);
    tmp <- (VPADD_4u32 x.[3] k);
    return (x, tmp);
  }
  proc sha256__load_data (data:W8.t Array64.t, sch:W32.t Array16.t) : 
  W128.t Array4.t * W32.t Array16.t = {
    var inc:int;
    var x:W128.t Array4.t;
    var i:int;
    var k:W128.t;
    x <- witness;
    inc <- (64 %/ 16);
    i <- 0;
    while ((i < inc)) {
      x.[i] <- (ArrayAccessCastW128_64W8.get_cast data i);
      x.[i] <- (VPSHUFB_128 x.[i] sha256__gshufmask);
      k <- sha256__k256.[i];
      k <- (VPADD_4u32 x.[i] k);
      sch <- (ArrayAccessCastW128_16W32.set_cast sch i k);
      i <- (i + 1);
    }
    return (x, sch);
  }
  proc sha256__Ch (x:W32.t, y:W32.t, z:W32.t) : W32.t = {
    var r:W32.t;
    var t:W32.t;
    r <- x;
    r <- (r `&` y);
    t <- (invw x);
    t <- (t `&` z);
    r <- (r `^` t);
    return r;
  }
  proc sha256__Maj (x:W32.t, y:W32.t, z:W32.t) : W32.t = {
    var r:W32.t;
    var t:W32.t;
    r <- x;
    r <- (r `&` y);
    t <- x;
    t <- (t `&` z);
    r <- (r `^` t);
    t <- y;
    t <- (t `&` z);
    r <- (r `^` t);
    return r;
  }
  proc sha256__Sigma0 (x:W32.t) : W32.t = {
    var r:W32.t;
    var t:W32.t;
    r <- x;
    r <- (r `|>>|` (W8.of_int 2));
    t <- x;
    t <- (t `|>>|` (W8.of_int 13));
    r <- (r `^` t);
    t <- x;
    t <- (t `|>>|` (W8.of_int 22));
    r <- (r `^` t);
    return r;
  }
  proc sha256__Sigma1 (x:W32.t) : W32.t = {
    var r:W32.t;
    var t:W32.t;
    r <- x;
    r <- (r `|>>|` (W8.of_int 6));
    t <- x;
    t <- (t `|>>|` (W8.of_int 11));
    r <- (r `^` t);
    t <- x;
    t <- (t `|>>|` (W8.of_int 25));
    r <- (r `^` t);
    return r;
  }
  proc sha256__rotate_state (state:W32.t Array8.t) : W32.t Array8.t = {
    var w7:W32.t;
    var i:int;
    var tmp:W32.t;
    w7 <- state.[7];
    i <- 7;
    while ((0 < i)) {
      tmp <- state.[(i - 1)];
      state.[i] <- tmp;
      i <- (i - 1);
    }
    state.[0] <- w7;
    return state;
  }
  proc sha256__sha_round (state:W32.t Array8.t, x:W32.t, k:int) : W32.t Array8.t = {
    var t:W32.t;
    var w0:W32.t;
    var w1:W32.t;
    var w2:W32.t;
    var tmp:W32.t;
    t <- state.[4];
    t <@ sha256__Sigma1 (t);
    t <- (t + state.[7]);
    t <- (t + x);
    w0 <- state.[4];
    w1 <- state.[5];
    w2 <- state.[6];
    tmp <@ sha256__Ch (w0, w1, w2);
    t <- (t + tmp);
    t <- (t + (W32.of_int k));
    state.[3] <- (state.[3] + t);
    w0 <- state.[0];
    w1 <- state.[1];
    w2 <- state.[2];
    tmp <@ sha256__Maj (w0, w1, w2);
    t <- (t + tmp);
    w0 <@ sha256__Sigma0 (w0);
    t <- (t + w0);
    state.[7] <- t;
    state <@ sha256__rotate_state (state);
    return state;
  }
  proc sha256__accumulate_state (out:W32.t Array8.t, in_0:W32.t Array8.t) : 
  W32.t Array8.t = {
    var inc:int;
    var i:int;
    var tmp:W128.t;
    inc <- (8 %/ 4);
    i <- 0;
    while ((i < inc)) {
      tmp <- (ArrayAccessCastW128_8W32.get_cast in_0 i);
      tmp <- (VPADD_4u32 tmp (ArrayAccessCastW128_8W32.get_cast out i));
      out <- (ArrayAccessCastW128_8W32.set_cast out i tmp);
      i <- (i + 1);
    }
    return out;
  }
  proc sha256__round_0_47 (state:W32.t Array8.t, x:W128.t Array4.t,
                           sch:W32.t Array16.t) : W32.t Array8.t *
                                                  W32.t Array16.t = {
    var lomask:W128.t;
    var himask:W128.t;
    var k256p:W128.t Array16.t;
    var j:W64.t;
    var i:int;
    var k:W128.t;
    var y:W128.t;
    k256p <- witness;
    lomask <- sha256__glomask;
    himask <- sha256__ghimask;
    k256p <- sha256__k256;
    i <- 0;
    while ((i < 3)) {
      j <- (W64.of_int 0);
      while ((j \ult (W64.of_int (16 * (64 %/ 16))))) {
        k <-
        (ArrayAccessCastW128_16W128.get_cast_direct k256p
        (W64.to_uint (j + (W64.of_int ((16 * (64 %/ 16)) * (i + 1))))));
        (x, y) <@ sha256__update (x, k, lomask, himask);
        state <@ sha256__sha_round (state,
        (ArrayAccessCastW32_16W32.get_cast_direct sch (W64.to_uint j)), 0);
        state <@ sha256__sha_round (state,
        (ArrayAccessCastW32_16W32.get_cast_direct sch
        (W64.to_uint (j + (W64.of_int 4)))), 0);
        state <@ sha256__sha_round (state,
        (ArrayAccessCastW32_16W32.get_cast_direct sch
        (W64.to_uint (j + (W64.of_int 8)))), 0);
        state <@ sha256__sha_round (state,
        (ArrayAccessCastW32_16W32.get_cast_direct sch
        (W64.to_uint (j + (W64.of_int 12)))), 0);
        sch <-
        (ArrayAccessCastW128_16W32.set_cast_direct sch (W64.to_uint j) y);
        j <- (j + (W64.of_int 16));
      }
      i <- (i + 1);
    }
    return (state, sch);
  }
  proc sha256__round_48_63 (state:W32.t Array8.t, sch:W32.t Array16.t) : 
  W32.t Array8.t = {
    var i:int;
    var x:W32.t;
    i <- 48;
    while ((i < 64)) {
      x <- sch.[(W256.to_uint ((W256.of_int i) `&` (W256.of_int 15)))];
      state <@ sha256__sha_round (state, x, 0);
      i <- (i + 1);
    }
    return state;
  }
  proc sha256__copy_state (out:W32.t Array8.t, in_0:W32.t Array8.t) : 
  W32.t Array8.t = {
    var inc:int;
    var i:int;
    var tmp:W128.t;
    inc <- (8 %/ 4);
    i <- 0;
    while ((i < inc)) {
      tmp <- (ArrayAccessCastW128_8W32.get_cast in_0 i);
      out <- (ArrayAccessCastW128_8W32.set_cast out i tmp);
      i <- (i + 1);
    }
    return out;
  }
  proc sha256__compress (state:W32.t Array8.t, data:W8.t Array64.t) : 
  W32.t Array8.t = {
    var cstate:W32.t Array8.t;
    var sch:W32.t Array16.t;
    var x:W128.t Array4.t;
    cstate <- witness;
    sch <- witness;
    x <- witness;
    cstate <@ sha256__copy_state (cstate, state);
    (x, sch) <@ sha256__load_data (data, sch);
    (cstate, sch) <@ sha256__round_0_47 (cstate, x, sch);
    cstate <@ sha256__round_48_63 (cstate, sch);
    state <@ sha256__accumulate_state (state, cstate);
    return state;
  }
}.
