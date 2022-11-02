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

RUN wget https://github.com/pachterlab/kallisto/releases/download/v0.48.0/kallisto_linux-v0.48.0.tar.gz && \
  tar -zxvf kallisto_linux-v0.48.0.tar.gz

RUN wget https://downloads.sourceforge.net/project/subread/subread-2.0.3/subread-2.0.3-Linux-x86_64.tar.gz && \
  tar -zxvf subread-2.0.3-Linux-x86_64.tar.gz

ENV PATH /subread-2.0.3-Linux-x86_64/bin/utilities:/subread-2.0.3-Linux-x86_64/bin:$PATH