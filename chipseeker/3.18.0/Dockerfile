
FROM r-base:4.3.2
LABEL maintainer "bioinformatics@age.mpg.de"

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq build-essential  libcurl4-openssl-dev libxml2-dev  libgsl-dev libssl-dev libfontconfig1-dev libharfbuzz-dev libfribidi-dev libudunits2-dev && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

# RUN apt-get update && apt-get -yq dist-upgrade && \
#   apt-get install -yq zlib1g-dev libbz2-dev liblzma-dev libmagickwand-dev libcurl4-gnutls-dev   && \
#   apt-get clean && rm -rf /var/lib/apt/lists/*

RUN Rscript -e 'install.packages("openxlsx", repos="http://cloud.r-project.org/", dependencies = TRUE)'
RUN Rscript -e 'library(openxlsx)'
RUN Rscript -e 'install.packages("BiocManager", repos="http://cloud.r-project.org/" )' 
RUN Rscript -e 'library(BiocManager)'
RUN Rscript -e 'install.packages("ggplot2", repos="http://cloud.r-project.org/", dependencies = TRUE )' 
RUN Rscript -e 'library(ggplot2)'
RUN Rscript -e 'BiocManager::install("ChIPseeker")'
RUN Rscript -e 'library(ChIPseeker)'
RUN Rscript -e 'BiocManager::install("AnnotationDbi")'
RUN Rscript -e 'library(AnnotationDbi)'
RUN Rscript -e 'BiocManager::install("ReactomePA")'
RUN Rscript -e 'library(ReactomePA)'
RUN Rscript -e 'BiocManager::install("GenomicRanges")'
RUN Rscript -e 'library(GenomicRanges)'
RUN Rscript -e 'BiocManager::install("TxDb.Celegans.UCSC.ce11.ensGene")'
RUN Rscript -e 'library(TxDb.Celegans.UCSC.ce11.ensGene)'
RUN Rscript -e 'BiocManager::install("TxDb.Dmelanogaster.UCSC.dm6.ensGene")'
RUN Rscript -e 'library(TxDb.Dmelanogaster.UCSC.dm6.ensGene)'
RUN Rscript -e 'BiocManager::install("TxDb.Hsapiens.UCSC.hg38.knownGene")'
RUN Rscript -e 'library(TxDb.Hsapiens.UCSC.hg38.knownGene)'
RUN Rscript -e 'BiocManager::install("TxDb.Mmusculus.UCSC.mm10.knownGene")'
RUN Rscript -e 'library(TxDb.Mmusculus.UCSC.mm10.knownGene)'
RUN Rscript -e 'BiocManager::install("TxDb.Scerevisiae.UCSC.sacCer3.sgdGene")'
RUN Rscript -e 'library(TxDb.Scerevisiae.UCSC.sacCer3.sgdGene)'

RUN Rscript -e 'BiocManager::install("org.Hs.eg.db")'
RUN Rscript -e 'library(org.Hs.eg.db)'
RUN Rscript -e 'BiocManager::install("org.Ce.eg.db")'
RUN Rscript -e 'library(org.Ce.eg.db)'
RUN Rscript -e 'BiocManager::install("org.Dm.eg.db")'
RUN Rscript -e 'library(org.Dm.eg.db)'
RUN Rscript -e 'BiocManager::install("org.Mm.eg.db")'
RUN Rscript -e 'library(org.Mm.eg.db)'
RUN Rscript -e 'BiocManager::install("org.Sc.eg.db")'
RUN Rscript -e 'library(org.Sc.eg.db)'