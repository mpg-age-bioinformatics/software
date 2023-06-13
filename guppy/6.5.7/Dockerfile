FROM ubuntu:20.04

LABEL maintainer "bioinformatics@age.mpg.de"

RUN apt-get update && apt-get -yq dist-upgrade
RUN apt-get install -yq wget lsb-release 
RUN apt-get install -yq gnupg2

#ENV DEBIAN_FRONTEND='noninteractive apt-get install lightdm -y'

RUN export PLATFORM=$(lsb_release -cs) && \
  wget -O- https://cdn.oxfordnanoportal.com/apt/ont-repo.pub |  apt-key add - && \
  echo "deb http://cdn.oxfordnanoportal.com/apt ${PLATFORM}-stable non-free" | tee /etc/apt/sources.list.d/nanoporetech.sources.list

RUN apt-get update
RUN apt-get install -y ont-guppy
RUN apt-get clean && rm -rf /var/lib/apt/lists/* 