FROM debian:bullseye-slim


LABEL maintainer "bioinformatics@age.mpg.de"

RUN echo "deb http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list


RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq wget \
  build-essential \
  zlib1g-dev \
  libbz2-dev \
  liblzma-dev git \
  libmagickwand-dev \
  libcurl4-openssl-dev \
  libncurses5-dev \
  git \
  default-jdk


RUN wget https://github.com/mckennalab/FlashFry/releases/download/1.15/FlashFry-assembly-1.15.jar



















# FROM python:3.8-slim-bullseye

# LABEL maintainer "bioinformatics@age.mpg.de"

# RUN echo "deb http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
# echo "deb-src http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
# echo "deb http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
# echo "deb-src http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
# echo "deb http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list && \
# echo "deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list


# RUN apt-get update && apt-get -yq dist-upgrade && \
#   apt-get install -yq wget \
#   build-essential \
#   zlib1g-dev \
#   libbz2-dev \
#   liblzma-dev git \
#   libmagickwand-dev \
#   libcurl4-openssl-dev \
#   libncurses5-dev \
#   coreutils \
#   rename \
#   git

# RUN apt-get clean && rm -rf /var/lib/apt/lists/* 

# RUN pip3 install git+https://github.com/Biomatters/Azimuth.git
