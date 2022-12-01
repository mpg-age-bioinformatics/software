FROM debian:bullseye-slim

LABEL maintainer "bioinformatics@age.mpg.de"

RUN echo "deb http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq wget tar pigz curl openjdk-11-jdk git make build-essential libz-dev cmake autotools-dev automake && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/lh3/minimap2 && \
  cd minimap2 && \
  make

RUN git clone https://github.com/lbcb-sci/racon && \
  cd racon && \
  mkdir build && \
  cd build && \
  cmake -DCMAKE_BUILD_TYPE=Release .. && \
  make

RUN git clone https://github.com/bcgsc/ntCard.git && \
  cd ntCard && \
  ./autogen.sh

RUN wget https://github.com/bcgsc/RNA-Bloom/releases/download/v2.0.0/rnabloom_v2.0.0.tar.gz && \
  tar -zxf rnabloom_v2.0.0.tar.gz
  
ENV PATH /minimap2:/racon/build/bin:/ntCard:$PATH

ENV RNABLOOM /RNA-Bloom_v2.0.0/RNA-Bloom.jar

