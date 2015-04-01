sampleInfo <- read.table("../extdata/sampleInfo.txt", stringsAsFactors=FALSE)
library(rtracklayer)
for (i in 1:2) {
  x <- import(paste0("../extdata/",sampleInfo[i,1]), format="bedGraph")
  names(mcols(x)) <- c("name","score","col","signalValue","pValue","qValue","peak")
  assign(sampleInfo[i,2], x)
}
metadata(HepG2) <- list("ENCODE accession: ENCSR000EEW. ESRRA ChIP-seq peaks of HepG2 cell line https://www.encodeproject.org/experiments/ENCSR000EEW/")
metadata(GM12878) <- list("ENCODE accession: ENCSR000DYQ. ESRRA ChIP-seq peaks of GM12878 cell line https://www.encodeproject.org/experiments/ENCSR000DYQ/")
save(HepG2, file="../../data/HepG2.rda")
save(GM12878, file="../../data/GM12878.rda")
