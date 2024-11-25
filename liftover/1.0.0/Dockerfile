FROM --platform=linux/amd64 ubuntu:22.04

LABEL maintainer="bioinformatics@age.mpg.de"

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
    libcurl4 \
    libcurl4-gnutls-dev \
    libssl-dev \
    zlib1g-dev \
    libgsl-dev \
    libc6 \
    libc6-dev \
    gzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /opt/liftover

# Download LiftOver executable and chain files from UCSC
RUN wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/liftOver && \
    chmod +x liftOver

# Example of downloading a chain file (you can add more as needed)
RUN wget http://hgdownload.soe.ucsc.edu/goldenPath/hg19/liftOver/hg19ToHg38.over.chain.gz && \
    gunzip hg19ToHg38.over.chain.gz

# Add LiftOver to PATH
ENV PATH="/opt/liftover:${PATH}"
