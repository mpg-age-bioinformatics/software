FROM python:3.11.0-slim-bullseye

LABEL maintainer "bioinformatics@age.mpg.de"

RUN echo "deb http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq wget tar pigz curl bzip2 build-essential libncurses-dev zlib1g-dev libbz2-dev liblzma-dev && \
  apt-get clean && rm -rf /var/lib/apt/lists/* 


RUN pip3 install pysam
RUN pip3 install pandas
RUN pip3 install numpy
RUN pip3 install HTSeq

RUN wget https://github.com/dieterich-lab/DCC/archive/refs/tags/v0.5.0.tar.gz && \
  tar -zxvf v0.5.0.tar.gz && \
  cd DCC-0.5.0  && \
  python3 setup.py install

