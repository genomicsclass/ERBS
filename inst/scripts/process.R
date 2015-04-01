sampleInfo <- read.table("../extdata/sampleInfo.txt", stringsAsFactors=FALSE)
library(rtracklayer)
for (i in 1:2) {
  x <- import(paste0("../extdata/",sampleInfo[i,1]), format="bedGraph")
  names(mcols(x)) <- c("name","score","col","signalValue","pValue","qValue","peak")
  assign(sampleInfo[i,2], x)
}

# add metadata
metadata(HepG2) <- list("ENCODE accession: ENCSR000EEW. ESRRA ChIP-seq peaks of HepG2 cell line https://www.encodeproject.org/experiments/ENCSR000EEW/")
metadata(GM12878) <- list("ENCODE accession: ENCSR000DYQ. ESRRA ChIP-seq peaks of GM12878 cell line https://www.encodeproject.org/experiments/ENCSR000DYQ/")

# add simple text descriptor for genome
genome(HepG2) <- "hg19" 
genome(GM12878) <- "hg19" 

# import chromosomal length information as well (also UCSC)
library(BSgenome.Hsapiens.UCSC.hg19)
stopifnot(all(c(seqlevelsStyle(HepG2), seqlevelsStyle(GM12878)) == seqlevelsStyle(Hsapiens)))
stopifnot(all(c(seqlevels(HepG2),seqlevels(GM12878)) %in% seqlevels(Hsapiens)))
seqlevels(HepG2) <- seqlevels(Hsapiens)
seqinfo(HepG2) <- seqinfo(Hsapiens)
seqlevels(GM12878) <- seqlevels(Hsapiens)
seqinfo(GM12878) <- seqinfo(Hsapiens)

save(HepG2, file="../../data/HepG2.rda")
save(GM12878, file="../../data/GM12878.rda")
