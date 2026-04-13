FROM ubuntu:22.04

LABEL description="trimAl - a tool for automated alignment trimming"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/inab/trimal.git /opt/trimal \
    && cd /opt/trimal \
    && git checkout v1.5.1 \
    && make -C source \
    && cp source/trimal /usr/local/bin/ \
    && cp source/readal /usr/local/bin/ \
    && cp source/statal /usr/local/bin/

# WORKDIR /data

# CMD ["trimal", "--help"]