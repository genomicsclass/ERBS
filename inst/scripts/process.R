sampleInfo <- read.table("../extdata/sampleInfo.txt", stringsAsFactors=FALSE)
library(rtracklayer)
for (i in 1:2) {
  x <- import(paste0("../extdata/",sampleInfo[i,1]), format="bedGraph")
  names(mcols(x)) <- c("name","score","col","signalValue","pValue","qValue","peak")
  assign(sampleInfo[i,2], x)
}
save(HepG2, file="../../data/HepG2.rda")
save(GM12878, file="../../data/GM12878.rda")
