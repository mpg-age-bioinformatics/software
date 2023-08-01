FROM debian:bullseye-slim

LABEL maintainer "bioinformatics@age.mpg.de"

RUN echo "deb http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq curl tar git build-essential  libz-dev && \
  apt-get clean && rm -rf /var/lib/apt/lists/* 
 
RUN git clone https://github.com/lh3/minimap2
RUN cd minimap2 && make
# install the k8 javascript shell
RUN curl -L https://github.com/attractivechaos/k8/releases/download/v0.2.4/k8-0.2.4.tar.bz2 | tar -jxf -
RUN cp k8-0.2.4/k8-`uname -s` /usr/bin/k8 

ENV PATH /minimap2:$PATH
RUN curl -L  https://raw.githubusercontent.com/lh3/minimap2/master/misc/paftools.js -o /minimap2/paftools.js