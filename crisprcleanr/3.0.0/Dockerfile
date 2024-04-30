FROM rocker/r-ver:4.2.3
LABEL maintainer "bioinformatics@age.mpg.de"

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq wget build-essential zlib1g-dev libbz2-dev liblzma-dev git libmagickwand-dev libcurl4-gnutls-dev libxml2-dev libssl-dev libharfbuzz-dev libfribidi-dev && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

RUN Rscript -e 'install.packages("devtools", repos="https://cloud.r-project.org/", dependencies = TRUE)'
RUN Rscript -e 'library(devtools)'

RUN Rscript -e 'install.packages("BiocManager", repos="http://cloud.r-project.org/" )'
RUN Rscript -e 'library(BiocManager)'

RUN Rscript -e 'BiocManager::install(version="3.16", INSTALL_opts = "--no-lock") '

RUN Rscript -e 'BiocManager::install("Rqc", version = "3.16", dependencies=TRUE) '
RUN Rscript -e 'library(Rqc)'


RUN Rscript -e 'devtools::install_github("francescojm/CRISPRcleanR", dependencies=TRUE)' 
RUN Rscript -e 'library(CRISPRcleanR)'
