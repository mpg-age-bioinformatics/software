FROM debian:bullseye-slim

LABEL maintainer="bioinformatics@age.mpg.de"

RUN apt-get update && apt-get -yq dist-upgrade && \
    apt-get install -y --no-install-recommends \
        wget \
        ca-certificates \
        perl \
        gzip && \
    wget -q https://sourceforge.net/projects/bowtie-bio/files/bowtie/0.12.9/bowtie-0.12.9-linux-x86_64.zip && \
    apt-get install -y unzip && \
    unzip bowtie-0.12.9-linux-x86_64.zip && \
    mv bowtie-0.12.9/bowtie* /usr/local/bin/ && \
    rm -rf bowtie-0.12.9* && \
    apt-get purge -y unzip wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
