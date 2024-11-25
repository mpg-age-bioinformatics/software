FROM python:2.7

RUN pip install telomerehunter

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq wget tar pigz curl bzip2 build-essential libncurses-dev zlib1g-dev libbz2-dev liblzma-dev && \
  apt-get clean && rm -rf /var/lib/apt/lists/* 

RUN wget https://github.com/samtools/samtools/releases/download/1.16.1/samtools-1.16.1.tar.bz2 && \
  tar -xvf samtools-1.16.1.tar.bz2 && \
  cd samtools-1.16.1 && \
  ./configure && make && make install
