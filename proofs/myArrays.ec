(* -------------------------------------------------------------------- *)
require import AllCore.

from Jasmin require import JWord JArray JWord_array.

clone export PolyArray as Array4  with op size <-  4 proof ge0_size by done.
clone export PolyArray as Array8  with op size <-  8 proof ge0_size by done.
clone export PolyArray as Array16 with op size <- 16 proof ge0_size by done.
clone export PolyArray as Array64 with op size <- 64 proof ge0_size by done.

clone export WArray as WArray32  with op size <-  32 proof ge0_size by done.
clone export WArray as WArray64  with op size <-  64 proof ge0_size by done.
clone export WArray as WArray256 with op size <- 256 proof ge0_size by done.

print JWord_array.ArrayWords.

clone export ArrayWords as ArrayWords8W32 with
      op sizeW   <- 4,
      op sizeA   <- 8,
  theory Word    <= W32,
  theory ArrayN  <= Array8,
  theory WArrayN <= WArray32
  proof gt0_sizeW by done
  proof gt0_sizeA by done.

clone export ArrayWords as ArrayWords16W32 with
     op sizeW    <- 4,
     op sizeA    <- 16,
  theory Word    <= W32,
  theory ArrayN  <= Array16,
  theory WArrayN <= WArray64
  proof gt0_sizeW by done
  proof gt0_sizeA by done.

clone export ArrayWords as ArrayWords16W128 with
     op sizeW    <- 16,
     op sizeA    <- 16,
  theory Word    <= W128,
  theory ArrayN  <= Array16,
  theory WArrayN <= WArray256
  proof gt0_sizeW by done
  proof gt0_sizeA by done.

clone export ArrayWords as ArrayWords64W8 with
      op sizeW   <- 1,
      op sizeA   <- 64,
  theory Word    <= W8,
  theory ArrayN  <= Array64,
  theory WArrayN <= WArray64
  proof gt0_sizeW by done
  proof gt0_sizeA by done.

clone export ArrayAccessCast as ArrayAccessCastW32_16W32 with
      op sizeWS      <- 4,
      op sizeWB      <- 4,
      op sizeB       <- 16,
  theory WordS       <- W32,
  theory WordB       <- W32,
  theory ArrayWordsB <- ArrayWords16W32
  proof gt0_sizeWS by done
  proof gt0_sizeWB by done
  proof gt0_sizeB  by done.

clone export ArrayAccessCast as ArrayAccessCastW128_64W8 with
      op sizeWS      <- 16,
      op sizeWB      <- 1,
      op sizeB       <- 64,
  theory WordS       <- W128,
  theory WordB       <- W8,
  theory ArrayWordsB <- ArrayWords64W8
  proof gt0_sizeWS by done
  proof gt0_sizeWB by done
  proof gt0_sizeB  by done.

clone export ArrayAccessCast as ArrayAccessCastW128_8W32 with
      op sizeWS      <- 16,
      op sizeWB      <- 4,
      op sizeB       <- 8,
  theory WordS       <- W128,
  theory WordB       <- W32,
  theory ArrayWordsB <- ArrayWords8W32
  proof gt0_sizeWS by done
  proof gt0_sizeWB by done
  proof gt0_sizeB  by done.

clone export ArrayAccessCast as ArrayAccessCastW128_16W32 with
  op sizeWS          <- 16,
  op sizeWB          <- 4,
  op sizeB           <- 16,
  theory WordS       <- W128,
  theory WordB       <- W32,
  theory ArrayWordsB <- ArrayWords16W32
  proof gt0_sizeWS by done
  proof gt0_sizeWB by done
  proof gt0_sizeB  by done.

clone export ArrayAccessCast as ArrayAccessCastW128_16W128  with
      op sizeWS      <- 16,
      op sizeWB      <- 16,
      op sizeB       <- 16,
  theory WordS       <- W128,
  theory WordB       <- W128,
  theory ArrayWordsB <= ArrayWords16W128
  proof gt0_sizeWS by done
  proof gt0_sizeWB by done
  proof gt0_sizeB  by done.

(* -------------------------------------------------------------------- *)
(* SHA-512 arrays                                                       *)

clone export PolyArray as Array40  with op size <-  40 proof ge0_size by done.
clone export PolyArray as Array80  with op size <-  80 proof ge0_size by done.
clone export PolyArray as Array128 with op size <- 128 proof ge0_size by done.

clone export WArray as WArray128 with op size <- 128 proof ge0_size by done.
clone export WArray as WArray320 with op size <- 320 proof ge0_size by done.
clone export WArray as WArray640 with op size <- 640 proof ge0_size by done.

clone export ArrayWords as ArrayWords128W8 with
      op sizeW   <- 1,
      op sizeA   <- 128,
  theory Word    <= W8,
  theory ArrayN  <= Array128,
  theory WArrayN <= WArray128
  proof gt0_sizeW by done
  proof gt0_sizeA by done.

clone export ArrayWords as ArrayWords8W64 with
      op sizeW   <- 8,
      op sizeA   <- 8,
  theory Word    <= W64,
  theory ArrayN  <= Array8,
  theory WArrayN <= WArray64
  proof gt0_sizeW by done
  proof gt0_sizeA by done.

clone export ArrayWords as ArrayWords16W64 with
      op sizeW   <- 8,
      op sizeA   <- 16,
  theory Word    <= W64,
  theory ArrayN  <= Array16,
  theory WArrayN <= WArray128
  proof gt0_sizeW by done
  proof gt0_sizeA by done.

clone export ArrayWords as ArrayWords40W128 with
      op sizeW   <- 16,
      op sizeA   <- 40,
  theory Word    <= W128,
  theory ArrayN  <= Array40,
  theory WArrayN <= WArray640
  proof gt0_sizeW by done
  proof gt0_sizeA by done.

clone export ArrayAccessCast as ArrayAccessCastW64_16W64 with
      op sizeWS      <- 8,
      op sizeWB      <- 8,
      op sizeB       <- 16,
  theory WordS       <- W64,
  theory WordB       <- W64,
  theory ArrayWordsB <- ArrayWords16W64
  proof gt0_sizeWS by done
  proof gt0_sizeWB by done
  proof gt0_sizeB  by done.

clone export ArrayAccessCast as ArrayAccessCastW128_128W8 with
      op sizeWS      <- 16,
      op sizeWB      <- 1,
      op sizeB       <- 128,
  theory WordS       <- W128,
  theory WordB       <- W8,
  theory ArrayWordsB <- ArrayWords128W8
  proof gt0_sizeWS by done
  proof gt0_sizeWB by done
  proof gt0_sizeB  by done.

clone export ArrayAccessCast as ArrayAccessCastW128_8W64 with
      op sizeWS      <- 16,
      op sizeWB      <- 8,
      op sizeB       <- 8,
  theory WordS       <- W128,
  theory WordB       <- W64,
  theory ArrayWordsB <- ArrayWords8W64
  proof gt0_sizeWS by done
  proof gt0_sizeWB by done
  proof gt0_sizeB  by done.

clone export ArrayAccessCast as ArrayAccessCastW128_16W64 with
      op sizeWS      <- 16,
      op sizeWB      <- 8,
      op sizeB       <- 16,
  theory WordS       <- W128,
  theory WordB       <- W64,
  theory ArrayWordsB <- ArrayWords16W64
  proof gt0_sizeWS by done
  proof gt0_sizeWB by done
  proof gt0_sizeB  by done.

clone export ArrayAccessCast as ArrayAccessCastW128_40W128 with
      op sizeWS      <- 16,
      op sizeWB      <- 16,
      op sizeB       <- 40,
  theory WordS       <- W128,
  theory WordB       <- W128,
  theory ArrayWordsB <= ArrayWords40W128
  proof gt0_sizeWS by done
  proof gt0_sizeWB by done
  proof gt0_sizeB  by done.
