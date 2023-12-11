#!/usr/local/bin/Rscript
library(MAGeCKFlute)
library(ggplot2)
FluteRRA("/AJ02_Lib1_Lib2.gene_summary.txt", "/AJ02_Lib1_Lib2.sgrna_summary.txt", proj="AJ02_Lib1_Lib2", organism="hsa", outdir="/flute_out" )
