FROM debian:bullseye-slim

LABEL maintainer "bioinformatics@age.mpg.de"

RUN echo "deb http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq wget tar && \
  apt-get clean && rm -rf /var/lib/apt/lists/* 

Run wget https://mmseqs.com/latest/mmseqs-linux-avx2.tar.gz; tar xvfz mmseqs-linux-avx2.tar.gz && \
    export PATH=/mmseqs/bin/:$PATH

Run wget https://mafft.cbrc.jp/alignment/software/mafft-7.511-linux.tgz && \
    tar xfvz mafft-7.511-linux.tgz  && \
    export PATH=/mafft-linux64/:$PATH

Run wget https://github.com/iqtree/iqtree2/releases/download/v2.2.2.3/iqtree-2.2.2.3-Linux.tar.gz && \
    tar xvzf  iqtree-2.2.2.3-Linux.tar.gz  && \
    export PATH=/iqtree-2.2.2.3-Linux/bin:$PATH