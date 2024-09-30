FROM debian:bullseye-slim

LABEL maintainer "bioinformatics@age.mpg.de"

RUN echo "deb http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq wget tar pigz curl bzip2 build-essential libncurses-dev zlib1g-dev libbz2-dev liblzma-dev libhts-dev cmake git bedtools python3 python3-pip && \
  apt-get clean && rm -rf /var/lib/apt/lists/* 

RUN git clone https://github.com/pritykinlab/guidescan-cli.git --branch v2.2.1 && \
    cd guidescan-cli/ && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=RELEASE .. && \
    make

ENV PATH /guidescan-cli/build/bin:$PATH