FROM python:3.8-slim-bullseye

LABEL maintainer "bioinformatics@age.mpg.de"

RUN echo "deb http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq git build-essential wget && \
  apt-get clean && rm -rf /var/lib/apt/lists/* 

RUN pip install numpy==1.19.5 scipy

RUN git clone https://bitbucket.org/liulab/mageck.git && \
    cd mageck && \
    python setup.py install

RUN wget https://downloads.sourceforge.net/project/spacerscoringcrispr/SSC0.1/SSC0.1.tar.gz && \
  tar -zxvf SSC0.1.tar.gz

ENV PATH /SSC0.1/bin:${PATH}

ENTRYPOINT echo "Welcome to MAGeCK Docker" & mageck --version & /bin/bash 
