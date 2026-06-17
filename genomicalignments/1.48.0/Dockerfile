FROM bioconductor/bioconductor_docker:RELEASE_3_21

LABEL maintainer="bioinformatics@age.mpg.de"

RUN apt-get update && apt-get install -y --no-install-recommends \
    libbz2-dev \
    libcurl4-openssl-dev \
    liblzma-dev \
    libxml2-dev \
    zlib1g-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN Rscript -e 'install.packages("generics", repos = "https://cloud.r-project.org/")' \
    && Rscript -e 'BiocManager::install("GenomicAlignments", ask = FALSE, update = FALSE)' \
    && Rscript -e 'library(GenomicAlignments)'