FROM r-base:4.2.2

LABEL maintainer "bioinformatics@age.mpg.de"

# Install dependencies
RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
        build-essential \
        zlib1g-dev \
        libbz2-dev \
        liblzma-dev \
        git \
        libmagickwand-dev \
        libcurl4-gnutls-dev \
        libxml2-dev \
        libssl-dev \
        libharfbuzz-dev \
        libfribidi-dev \
        perl \
        openjdk-8-jre \
        openjdk-8-jdk \
        wget \
        tar \
        bedtools \
        bzip2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY sajr_code /sajr_code

# Add a directory to the PATH environment variable
ENV PATH /sajr_code/:$PATH
