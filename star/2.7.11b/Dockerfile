FROM debian:bullseye-slim

LABEL maintainer "bioinformatics@age.mpg.de"

# Add Debian package repositories
RUN echo "deb http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list

# Update package repositories and install dependencies
RUN apt-get update && \
    apt-get -yq dist-upgrade && \
    apt-get install -yq libz-dev && \
    apt-get install -yq build-essential && \
    apt-get install -yq openjdk-17-jre wget perl xxd gcc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* 

# Download and compile STAR
RUN wget https://github.com/alexdobin/STAR/archive/2.7.11b.tar.gz && \
    tar -xzf 2.7.11b.tar.gz 

ENV PATH /STAR-2.7.11b/bin/Linux_x86_64_static:$PATH
