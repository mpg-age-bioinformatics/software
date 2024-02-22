FROM debian:bullseye-slim

LABEL maintainer "bioinformatics@age.mpg.de"

RUN echo "deb http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq curl pigz bzip2 tar git build-essential wget rsync xxd libz-dev libncurses-dev zlib1g-dev libbz2-dev liblzma-dev bedtools && \
  apt-get clean && rm -rf /var/lib/apt/lists/* 
 
RUN wget https://github.com/williamritchie/IRFinder/archive/refs/tags/v1.3.1.tar.gz && \
    tar -xvf v1.3.1.tar.gz 


ENV PATH /IRFinder-1.3.1/bin:$PATH


RUN wget https://github.com/alexdobin/STAR/archive/2.7.11b.tar.gz && \
    tar -xzf 2.7.11b.tar.gz && \
    cd STAR-2.7.11b/source && \
    make STAR

RUN cp /STAR-2.7.11b/bin/Linux_x86_64_static/STAR /usr/local/bin

RUN wget https://github.com/samtools/samtools/releases/download/1.16.1/samtools-1.16.1.tar.bz2 && \
  tar -xvf samtools-1.16.1.tar.bz2 && \
  cd samtools-1.16.1 && \
  ./configure && make && make install