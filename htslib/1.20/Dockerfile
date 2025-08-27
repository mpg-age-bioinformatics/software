FROM ubuntu:22.04

LABEL maintainer="bioinformatics@age.mpg.de"
LABEL license="MPL-2.0"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        wget \
        build-essential \
        zlib1g-dev \
        libbz2-dev \
        liblzma-dev \
        ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Install htslib (includes tabix + bgzip)
ENV HTSLIB_VERSION=1.20
RUN wget https://github.com/samtools/htslib/releases/download/${HTSLIB_VERSION}/htslib-${HTSLIB_VERSION}.tar.bz2 && \
    tar -xjf htslib-${HTSLIB_VERSION}.tar.bz2 && \
    cd htslib-${HTSLIB_VERSION} && \
    ./configure && make && make install && \
    cd .. && rm -rf htslib-${HTSLIB_VERSION}*
