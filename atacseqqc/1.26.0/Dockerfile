
FROM r-base:4.2.2
LABEL maintainer "bioinformatics@age.mpg.de"

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq wget build-essential zlib1g-dev libbz2-dev liblzma-dev git libmagickwand-dev libcurl4-gnutls-dev libxml2-dev libssl-dev libharfbuzz-dev libfribidi-dev libgsl-dev && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

RUN Rscript -e 'install.packages("openxlsx", repos="http://cloud.r-project.org/", dependencies = TRUE)'
RUN Rscript -e 'library(openxlsx)'
RUN Rscript -e 'install.packages("BiocManager", repos="http://cloud.r-project.org/" )' 
RUN Rscript -e 'library(BiocManager)'

RUN Rscript -e 'BiocManager::install("TFBSTools")'
RUN Rscript -e 'library(TFBSTools)'
RUN Rscript -e 'BiocManager::install("ATACseqQC")'
RUN Rscript -e 'library(ATACseqQC)'
RUN Rscript -e 'BiocManager::install("Rsamtools")'
RUN Rscript -e 'library(Rsamtools)'
RUN Rscript -e 'BiocManager::install("ChIPpeakAnno")'
RUN Rscript -e 'library(ChIPpeakAnno)'

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

RUN Rscript -e 'BiocManager::install("BSgenome.Celegans.UCSC.ce11")'
RUN Rscript -e 'library(BSgenome.Celegans.UCSC.ce11)'
RUN Rscript -e 'BiocManager::install("BSgenome.Dmelanogaster.UCSC.dm6")'
RUN Rscript -e 'library(BSgenome.Dmelanogaster.UCSC.dm6)'
RUN Rscript -e 'BiocManager::install("BSgenome.Hsapiens.NCBI.GRCh38")'
RUN Rscript -e 'library(BSgenome.Hsapiens.NCBI.GRCh38)'
RUN Rscript -e 'BiocManager::install("BSgenome.Mmusculus.UCSC.mm10")'
RUN Rscript -e 'library(BSgenome.Mmusculus.UCSC.mm10)'
RUN Rscript -e 'BiocManager::install("BSgenome.Scerevisiae.UCSC.sacCer3")'
RUN Rscript -e 'library(BSgenome.Scerevisiae.UCSC.sacCer3)'
