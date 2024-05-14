FROM r-base:4.2.2

LABEL maintainer "bioinformatics@age.mpg.de"

# Install dependencies
RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
        build-essential \
        zlib1g-dev \
        libbz2-dev \
        liblzma-dev \
        git \
        libmagickwand-dev \
        libcurl4-gnutls-dev \
        libxml2-dev \
        libssl-dev \
        libharfbuzz-dev \
        libfribidi-dev \
        perl \
        openjdk-8-jre \
        openjdk-8-jdk \
        wget \
        tar \
        bedtools \
        bzip2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY sajr_code /sajr_code

RUN Rscript -e 'install.packages("BiocManager", repos="http://cloud.r-project.org/" )' 
RUN Rscript -e 'library(BiocManager)'
RUN Rscript -e 'install.packages("openxlsx", repos="http://cloud.r-project.org/", dependencies = TRUE)'
RUN Rscript -e 'library(openxlsx)'
RUN Rscript -e 'install.packages("tidyverse", repos="https://cloud.r-project.org/", dependencies = TRUE)'
RUN Rscript -e 'library(tidyverse)'
RUN Rscript -e 'BiocManager::install("biomaRt")'
RUN Rscript -e 'library(biomaRt)'
RUN Rscript -e 'BiocManager::install("plyr")'
RUN Rscript -e 'library(plyr)'
RUN Rscript -e 'BiocManager::install("GenomicRanges")'
RUN Rscript -e 'library(GenomicRanges)'
RUN Rscript -e 'install.packages("/sajr_code/SAJR.tar.gz", repos=NULL, dependencies=TRUE, type="source")'
RUN Rscript -e 'library(SAJR)'



# Add a directory to the PATH environment variable
ENV PATH /sajr_code/:$PATH
