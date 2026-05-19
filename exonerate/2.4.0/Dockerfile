FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV EXONERATE_VERSION=2.4.0

RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    ca-certificates \
    perl \
    zlib1g-dev \
    pkg-config \
    libglib2.0-dev \
    autoconf \
    automake \
    libtool \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt

RUN wget https://ftp.ebi.ac.uk/pub/software/vertebrategenomics/exonerate/exonerate-${EXONERATE_VERSION}.tar.gz && \
    tar -xzf exonerate-${EXONERATE_VERSION}.tar.gz && \
    cd exonerate-${EXONERATE_VERSION} && \
    ./configure && \
    make && \
    make install && \
    cd /opt && \
    rm -rf exonerate-${EXONERATE_VERSION}*