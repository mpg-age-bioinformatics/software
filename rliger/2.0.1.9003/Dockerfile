FROM mpgagebioinformatics/posit:2024.07.05

LABEL maintainer "bioinformatics@age.mpg.de"

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq wget build-essential zlib1g-dev libbz2-dev liblzma-dev git libmagickwand-dev libcurl4-gnutls-dev libxml2-dev libssl-dev libharfbuzz-dev libfribidi-dev libhdf5-dev && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

RUN Rscript -e 'install.packages("devtools", repos="https://cloud.r-project.org/", dependencies = TRUE)'
RUN Rscript -e 'library(devtools)'

RUN Rscript -e 'devtools::install_github("mvfki/liger")'
RUN Rscript -e 'library(rliger)'
