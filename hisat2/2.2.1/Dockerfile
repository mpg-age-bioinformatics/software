FROM debian:bullseye-slim

LABEL maintainer "bioinformatics@age.mpg.de"

RUN echo "deb http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq curl pigz bzip2 tar git build-essential wget rsync xxd libz-dev libncurses-dev zlib1g-dev libbz2-dev liblzma-dev bedtools python3 python3-pip && \
  apt-get clean && rm -rf /var/lib/apt/lists/* 

RUN ln -s /usr/bin/python3 /usr/bin/python

RUN wget https://github.com/DaehwanKimLab/hisat2/archive/refs/tags/v2.2.1.tar.gz && \
    tar -xzf v2.2.1.tar.gz && \
    cd hisat2-2.2.1 && \
    make

ENV PATH /hisat2-2.2.1/:$PATH