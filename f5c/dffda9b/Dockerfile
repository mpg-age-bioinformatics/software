# Docker file provided by developers

FROM ubuntu:16.04
WORKDIR /
RUN apt-get update && apt-get install libhdf5-dev zlib1g-dev libzstd1-dev git wget tar gcc g++ make autoconf bash bzip2 -y
RUN git clone https://github.com/hasindu2008/f5c.git
WORKDIR /f5c
RUN git checkout dffda9b && autoreconf && ./scripts/install-hts.sh && ./configure && make zstd=1 && make test && make install
RUN /bin/bash scripts/install-vbz.sh
CMD ./f5c