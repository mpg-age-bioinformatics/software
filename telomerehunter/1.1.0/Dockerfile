FROM rocker/tidyverse

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq wget tar pigz curl bzip2 build-essential libncurses-dev zlib1g-dev libbz2-dev liblzma-dev \
  libreadline-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev openssl libcurl4-openssl-dev \
  xorg-dev apt-utils ca-certificates sudo jed emacs unzip libsm6 pkg-config autoconf automake environment-modules gcc && \
  apt-get clean && rm -rf /var/lib/apt/lists/* 

RUN wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb && \
  dpkg -i libssl1.1_1.1.1f-1ubuntu2_amd64.deb

RUN wget https://www.python.org/ftp/python/2.7.16/Python-2.7.16.tgz && \
  tar xzf Python-2.7.16.tgz && \
  cd Python-2.7.16 && \
  ./configure --with-ensurepip=yes && \
  make && make install

RUN wget https://github.com/samtools/samtools/releases/download/1.16.1/samtools-1.16.1.tar.bz2 && \
  tar -xvf samtools-1.16.1.tar.bz2 && \
  cd samtools-1.16.1 && \
  ./configure && make && make install

RUN pip install pysam==0.9.0
RUN pip install PyPDF2==1.26.0
RUN pip install telomerehunter

RUN Rscript /usr/local/lib/python2.7/site-packages/telomerehunter/check_R_libraries.R