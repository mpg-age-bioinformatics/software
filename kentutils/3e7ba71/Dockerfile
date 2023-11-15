# base Dockerfile to enable Docker Hub autobuilds
FROM debian:bullseye-slim

LABEL maintainer "bioinformatics@age.mpg.de"

RUN echo "deb http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq git build-essential && \
  apt-get clean && rm -rf /var/lib/apt/lists/* 

RUN git clone https://github.com/ENCODE-DCC/kentUtils.git && \
    cd kentUtils && \
    git checkout 3e7ba71

WORKDIR /kentUtils    

RUN apt-get update && \
  apt-get install -yq libz-dev

RUN apt-get update && \
  apt-get install -yq libssl-dev 
  
RUN apt-get update && \
  apt-get install -yq libpng-dev 

RUN apt-get update && \
  apt-get install -yq mysql-server 
#libmysqlclient-dev libmariadbclient-dev

#libmysqlclient-dev

RUN make

ENV PATH /kentUtils/bin/linux.x86_64/:${PATH}

