FROM python:3.11.0-slim-bullseye

LABEL maintainer "bioinformatics@age.mpg.de"

RUN echo "deb http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq build-essential  zlib1g-dev && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip
RUN pip3 install deeptools==3.5.6
