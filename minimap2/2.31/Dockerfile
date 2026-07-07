FROM debian:bullseye-slim

LABEL maintainer "bioinformatics@age.mpg.de"

ARG MINIMAP2_VERSION=2.31
ARG K8_VERSION=0.2.4

RUN echo "deb http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq curl tar bzip2 build-essential zlib1g-dev && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -L https://github.com/lh3/minimap2/releases/download/v${MINIMAP2_VERSION}/minimap2-${MINIMAP2_VERSION}.tar.bz2 | tar -jxf - && \
  cd minimap2-${MINIMAP2_VERSION} && \
  make && \
  cp minimap2 /usr/local/bin/minimap2 && \
  cp misc/paftools.js /usr/local/bin/paftools.js

RUN curl -L https://github.com/attractivechaos/k8/releases/download/v${K8_VERSION}/k8-${K8_VERSION}.tar.bz2 | tar -jxf - && \
  cp k8-${K8_VERSION}/k8-`uname -s` /usr/local/bin/k8
