FROM debian:bullseye-slim

LABEL maintainer "bioinformatics@age.mpg.de"

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq --no-install-recommends wget ca-certificates make g++ zlib1g-dev libbz2-dev liblzma-dev python-is-python3 && \
  wget -q https://github.com/arq5x/bedtools2/releases/download/v2.29.1/bedtools-2.29.1.tar.gz && \
  tar -xzf bedtools-2.29.1.tar.gz && \
  cd bedtools2 && \
  make && \
  cp bin/* /usr/local/bin/ && \
  cd / && \
  rm -rf bedtools2 bedtools-2.29.1.tar.gz && \
  apt-get purge -yq --auto-remove wget make g++ zlib1g-dev libbz2-dev liblzma-dev python-is-python3 && \
  apt-get clean && rm -rf /var/lib/apt/lists/*
