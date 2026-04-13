FROM ubuntu:24.04
 
ARG MAFFT_VERSION=7.526
 
RUN apt-get update && apt-get install -y \
    wget \
    && rm -rf /var/lib/apt/lists/* \
    && wget https://mafft.cbrc.jp/alignment/software/mafft_${MAFFT_VERSION}-1_amd64.deb \
    && dpkg -i mafft_${MAFFT_VERSION}-1_amd64.deb \
    && rm mafft_${MAFFT_VERSION}-1_amd64.deb