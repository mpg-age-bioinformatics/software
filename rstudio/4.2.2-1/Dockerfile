FROM rocker/rstudio:4.2.2

LABEL maintainer "bioinformatics@age.mpg.de"

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq  libz-dev && \
  apt-get clean 

