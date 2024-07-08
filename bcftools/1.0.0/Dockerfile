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

# Clone htslib and bcftools repositories
RUN git clone --recurse-submodules https://github.com/samtools/htslib.git /opt/htslib && \
    git clone https://github.com/samtools/bcftools.git /opt/bcftools

# Build htslib
WORKDIR /opt/htslib
RUN make && make install

# Build bcftools
WORKDIR /opt/bcftools
RUN autoreconf -i

# Build and install bcftools
RUN make && make install

# Add bcftools to PATH
ENV PATH="/opt/bcftools:${PATH}"

# Set the working directory
WORKDIR /data

# Set the entrypoint to bcftools
ENTRYPOINT ["bcftools"]