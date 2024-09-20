### script is created by Huifang Yuan
### to generate motifs logo 



library(motifStack)

library(seqLogo)
library(JASPAR2020)

## DONOT need to LOAD TFBSTools seqLogo LIBRARY 
pfm <- getMatrixByID(JASPAR2020, ID = "MA0712.2")
## the function returns a PFMatrix object
seqLogo(toICM(pfm))
