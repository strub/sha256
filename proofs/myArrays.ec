(* -------------------------------------------------------------------- *)
require import AllCore.

from Jasmin require import JArray.

clone export PolyArray as Array8  with op size <-  8 proof ge0_size by done.
clone export PolyArray as Array16 with op size <- 16 proof ge0_size by done.
clone export PolyArray as Array64 with op size <- 64 proof ge0_size by done.
