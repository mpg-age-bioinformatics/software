FROM rocker/r-ver:latest

RUN apt-get update && apt-get install -y \
    libcurl4-gnutls-dev \
    libxml2-dev \
    libssl-dev \
    libgit2-dev \
    libbz2-dev \
    liblzma-dev \
    libz-dev \
    libncurses5-dev \
    libncursesw5-dev \
    libhts-dev \
    && apt-get clean

ENV R_LIBS_USER=/usr/local/lib/R/site-library

RUN R -e "if (!requireNamespace('BiocManager', quietly = TRUE)) install.packages('BiocManager')"
RUN R -e "BiocManager::install(c('Rhtslib', 'Rsamtools', 'GenomicAlignments', 'rtracklayer', 'BSgenome', 'Biostrings', 'GenomicRanges'))"

