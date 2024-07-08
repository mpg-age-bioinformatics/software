# Use Debian Bullseye Slim as the parent image
FROM debian:bullseye-slim

LABEL maintainer="bioinformatics@age.mpg.de"

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
    apt-get install -yq \
    libz-dev \
    build-essential \
    openjdk-17-jre \
    git \
    wget \
    perl \
    xxd \
    gcc \
    autoconf \
    automake \
    libtool \
    libbz2-dev \
    liblzma-dev \
    libcurl4-gnutls-dev \
    libssl-dev \
    zlib1g-dev \
    libgsl-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /opt/liftover

# Download LiftOver executable and chain files from UCSC
RUN wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/liftOver && \
    chmod +x liftOver

# Example of downloading a chain file (you can add more as needed)
RUN wget http://hgdownload.soe.ucsc.edu/goldenPath/hg19/liftOver/hg19ToHg38.over.chain.gz

# Add LiftOver to PATH
ENV PATH="/opt/liftover:${PATH}"
