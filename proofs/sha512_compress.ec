require import AllCore IntDiv CoreMap List Distr.

from Jasmin require import JModel_x86.

import SLH64.

require import MyArrays.

abbrev sha512__gshufmask =
(W128.of_int 10680758337341567148842519922299176455).

abbrev sha512__k512 =
((Array40.of_list witness)
[(W128.of_int 150489730553972911399644130396273684002);
(W128.of_int (-29627983211218019922999898209111950545));
(W128.of_int 119552999119048133297128862918721975608);
(W128.of_int (-112837071839977400533973334947927601253));
(W128.of_int 24608140612589036020476157852171567682);
(W128.of_int 113049238020941851242202110211324686988);
(W128.of_int (-168984883429134451453541584994413344401));
(W128.of_int (-82931660406004953567928989597350555083));
(W128.of_int (-21608888840139471788734061127798797614));
(W128.of_int 47917797078088120148084165279226844597);
(W128.of_int 98967868904774235931018390170392789621);
(W128.of_int 158144561140404253146444012151634000852);
(W128.of_int (-116713616515888484662246782567867555925));
(W128.of_int (-85935113614094772510446329199369445057));
(W128.of_int (-56286743623276823281923160706091806782));
(W128.of_int 26798283829305030665085865652396458607);
(W128.of_int 61285353606100101787682545158260404220);
(W128.of_int 110616957499656028952810677600369519341);
(W128.of_int 157399504628100997864791393919094973406);
(W128.of_int (-145622254724752488663002193844650529050));
(W128.of_int (-116834989104595732602711958268039593116));
(W128.of_int (-75203571907690699784392744140462844015));
(W128.of_int (-55033029830510039878475727306463686120));
(W128.of_int 21821285474355441565675858464569630762);
(W128.of_int 40164607359977061232603920498758439112);
(W128.of_int 70037527531042510473617463523886951321);
(W128.of_int 104804773735515940536891733460675811939);
(W128.of_int 138480827883479201981072184802422285171);
(W128.of_int 160366105249488476588270280604598121212);
(W128.of_int (-153157139229389526766102912472244507790));
(W128.of_int (-121871382675810359491667495229765509592));
(W128.of_int (-76506041077751610917705610006103688939));
(W128.of_int (-61774200282629931514032696040812551780));
(W128.of_int (-13970858400190489972076278330957960418));
(W128.of_int 13808868306371656050485842004573384634);
(W128.of_int 36476112742719818411691311416324197806);
(W128.of_int 67513721811823832102787768681234726276);
(W128.of_int 89210956991694969545974921668122492604);
(W128.of_int 118961557342391457522218436998522094262);
(W128.of_int 143910217906322266300519611654328482540)]).

module M = {
  proc sha512__rotate (in_0:W128.t Array8.t) : W128.t Array8.t = {
    var tmp:W128.t;
    tmp <- in_0.[0];
    in_0.[0] <- in_0.[1];
    in_0.[1] <- in_0.[2];
    in_0.[2] <- in_0.[3];
    in_0.[3] <- in_0.[4];
    in_0.[4] <- in_0.[5];
    in_0.[5] <- in_0.[6];
    in_0.[6] <- in_0.[7];
    in_0.[7] <- tmp;
    return in_0;
  }
  proc sha512__update (x:W128.t Array8.t, k:W128.t) : W128.t Array8.t *
                                                      W128.t = {
    var tmp:W128.t;
    var t:W128.t Array4.t;
    t <- witness;
    t.[0] <- (VPALIGNR_128 x.[1] x.[0] (W8.of_int 8));
    t.[3] <- (VPALIGNR_128 x.[5] x.[4] (W8.of_int 8));
    t.[2] <- (VPSRL_2u64 t.[0] (W128.of_int 1));
    x.[0] <- (VPADD_2u64 x.[0] t.[3]);
    t.[3] <- (VPSRL_2u64 t.[0] (W128.of_int 7));
    t.[1] <- (VPSLL_2u64 t.[0] (W128.of_int (64 - 8)));
    t.[0] <- (t.[3] `^` t.[2]);
    t.[2] <- (VPSRL_2u64 t.[2] (W128.of_int (8 - 1)));
    t.[0] <- (t.[0] `^` t.[1]);
    t.[0] <- (t.[0] `^` t.[2]);
    t.[1] <- (VPSLL_2u64 t.[1] (W128.of_int (8 - 1)));
    t.[2] <- (VPSRL_2u64 x.[7] (W128.of_int 6));
    t.[3] <- (VPSLL_2u64 x.[7] (W128.of_int (64 - 61)));
    tmp <- (t.[0] `^` t.[1]);
    x.[0] <- (VPADD_2u64 x.[0] tmp);
    t.[2] <- (t.[2] `^` t.[3]);
    t.[1] <- (VPSRL_2u64 x.[7] (W128.of_int 19));
    t.[3] <- (VPSLL_2u64 t.[3] (W128.of_int (61 - 19)));
    t.[2] <- (t.[2] `^` t.[1]);
    t.[1] <- (VPSRL_2u64 t.[1] (W128.of_int (61 - 19)));
    t.[2] <- (t.[2] `^` t.[3]);
    tmp <- (t.[2] `^` t.[1]);
    x.[0] <- (VPADD_2u64 x.[0] tmp);
    x <@ sha512__rotate (x);
    tmp <- (VPADD_2u64 x.[7] k);
    return (x, tmp);
  }
  proc sha512__load_data (data:W8.t Array128.t, sch:W64.t Array16.t) : 
  W128.t Array8.t * W64.t Array16.t = {
    var inc:int;
    var x:W128.t Array8.t;
    var i:int;
    var k:W128.t;
    x <- witness;
    inc <- (128 %/ 16);
    i <- 0;
    while ((i < inc)) {
      x.[i] <- (ArrayAccessCastW128_128W8.get_cast data i);
      x.[i] <- (VPSHUFB_128 x.[i] sha512__gshufmask);
      k <- sha512__k512.[i];
      k <- (VPADD_2u64 x.[i] k);
      sch <- (ArrayAccessCastW128_16W64.set_cast sch i k);
      i <- (i + 1);
    }
    return (x, sch);
  }
  proc sha512__Ch (x:W64.t, y:W64.t, z:W64.t) : W64.t = {
    var r:W64.t;
    var t:W64.t;
    r <- x;
    r <- (r `&` y);
    t <- (invw x);
    t <- (t `&` z);
    r <- (r `^` t);
    return r;
  }
  proc sha512__Maj (x:W64.t, y:W64.t, z:W64.t) : W64.t = {
    var r:W64.t;
    var t:W64.t;
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
  proc sha512__Sigma0 (x:W64.t) : W64.t = {
    var r:W64.t;
    var t:W64.t;
    r <- x;
    r <- (r `|>>|` (W8.of_int 28));
    t <- x;
    t <- (t `|>>|` (W8.of_int 34));
    r <- (r `^` t);
    t <- x;
    t <- (t `|>>|` (W8.of_int 39));
    r <- (r `^` t);
    return r;
  }
  proc sha512__Sigma1 (x:W64.t) : W64.t = {
    var r:W64.t;
    var t:W64.t;
    r <- x;
    r <- (r `|>>|` (W8.of_int 14));
    t <- x;
    t <- (t `|>>|` (W8.of_int 18));
    r <- (r `^` t);
    t <- x;
    t <- (t `|>>|` (W8.of_int 41));
    r <- (r `^` t);
    return r;
  }
  proc sha512__rotate_state (state:W64.t Array8.t) : W64.t Array8.t = {
    var w7:W64.t;
    var i:int;
    var tmp:W64.t;
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
  proc sha512__sha_round (state:W64.t Array8.t, x:W64.t, k:int) : W64.t Array8.t = {
    var t:W64.t;
    var w0:W64.t;
    var w1:W64.t;
    var w2:W64.t;
    var tmp:W64.t;
    t <- state.[4];
    t <@ sha512__Sigma1 (t);
    t <- (t + state.[7]);
    t <- (t + x);
    w0 <- state.[4];
    w1 <- state.[5];
    w2 <- state.[6];
    tmp <@ sha512__Ch (w0, w1, w2);
    t <- (t + tmp);
    t <- (t + (W64.of_int k));
    state.[3] <- (state.[3] + t);
    w0 <- state.[0];
    w1 <- state.[1];
    w2 <- state.[2];
    tmp <@ sha512__Maj (w0, w1, w2);
    t <- (t + tmp);
    w0 <@ sha512__Sigma0 (w0);
    t <- (t + w0);
    state.[7] <- t;
    state <@ sha512__rotate_state (state);
    return state;
  }
  proc sha512__accumulate_state (out:W64.t Array8.t, in_0:W64.t Array8.t) : 
  W64.t Array8.t = {
    var inc:int;
    var i:int;
    var tmp:W128.t;
    inc <- (8 %/ 2);
    i <- 0;
    while ((i < inc)) {
      tmp <- (ArrayAccessCastW128_8W64.get_cast in_0 i);
      tmp <- (VPADD_2u64 tmp (ArrayAccessCastW128_8W64.get_cast out i));
      out <- (ArrayAccessCastW128_8W64.set_cast out i tmp);
      i <- (i + 1);
    }
    return out;
  }
  proc sha512__round_0_63 (state:W64.t Array8.t, x:W128.t Array8.t,
                           sch:W64.t Array16.t) : W64.t Array8.t *
                                                  W64.t Array16.t = {
    var k512p:W128.t Array40.t;
    var j:W64.t;
    var i:int;
    var k:W128.t;
    var y:W128.t;
    k512p <- witness;
    k512p <- sha512__k512;
    i <- 0;
    while ((i < 4)) {
      j <- (W64.of_int 0);
      while ((j \ult (W64.of_int (16 * (128 %/ 16))))) {
        k <-
        (ArrayAccessCastW128_40W128.get_cast_direct k512p
        (W64.to_uint (j + (W64.of_int ((16 * (128 %/ 16)) * (i + 1))))));
        (x, y) <@ sha512__update (x, k);
        state <@ sha512__sha_round (state,
        (ArrayAccessCastW64_16W64.get_cast_direct sch (W64.to_uint j)), 0);
        state <@ sha512__sha_round (state,
        (ArrayAccessCastW64_16W64.get_cast_direct sch
        (W64.to_uint (j + (W64.of_int 8)))), 0);
        sch <-
        (ArrayAccessCastW128_16W64.set_cast_direct sch (W64.to_uint j) y);
        j <- (j + (W64.of_int 16));
      }
      i <- (i + 1);
    }
    return (state, sch);
  }
  proc sha512__round_64_79 (state:W64.t Array8.t, sch:W64.t Array16.t) : 
  W64.t Array8.t = {
    var i:int;
    var x:W64.t;
    i <- 64;
    while ((i < 80)) {
      x <- sch.[(W256.to_uint ((W256.of_int i) `&` (W256.of_int 15)))];
      state <@ sha512__sha_round (state, x, 0);
      i <- (i + 1);
    }
    return state;
  }
  proc sha512__copy_state (out:W64.t Array8.t, in_0:W64.t Array8.t) : 
  W64.t Array8.t = {
    var inc:int;
    var i:int;
    var tmp:W128.t;
    inc <- (8 %/ 2);
    i <- 0;
    while ((i < inc)) {
      tmp <- (ArrayAccessCastW128_8W64.get_cast in_0 i);
      out <- (ArrayAccessCastW128_8W64.set_cast out i tmp);
      i <- (i + 1);
    }
    return out;
  }
  proc sha512__compress (state:W64.t Array8.t, data:W8.t Array128.t) : 
  W64.t Array8.t = {
    var cstate:W64.t Array8.t;
    var sch:W64.t Array16.t;
    var x:W128.t Array8.t;
    cstate <- witness;
    sch <- witness;
    x <- witness;
    cstate <@ sha512__copy_state (cstate, state);
    (x, sch) <@ sha512__load_data (data, sch);
    (cstate, sch) <@ sha512__round_0_63 (cstate, x, sch);
    cstate <@ sha512__round_64_79 (cstate, sch);
    state <@ sha512__accumulate_state (state, cstate);
    return state;
  }
}.
