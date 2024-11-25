#FROM python:2.7
FROM rocker/tidyverse

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq wget tar pigz curl bzip2 build-essential libncurses-dev zlib1g-dev libbz2-dev liblzma-dev \
  libreadline-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev openssl libssl-dev libcurl4-openssl-dev && \
  apt-get clean && rm -rf /var/lib/apt/lists/* 

RUN wget https://github.com/samtools/samtools/releases/download/1.16.1/samtools-1.16.1.tar.bz2 && \
  tar -xvf samtools-1.16.1.tar.bz2 && \
  cd samtools-1.16.1 && \
  ./configure && make && make install

RUN apt-get update && \
  apt-get install -yq --no-install-recommends libreadline-dev xorg-dev apt-utils ca-certificates sudo jed emacs unzip libsm6 pkg-config zlib1g-dev autoconf automake environment-modules gcc && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
  apt-get install -yq --no-install-recommends \
  f2c \   
  git \
  vim \
  texlive-latex-base \
  texlive-latex-extra \
  texlive-fonts-extra \
  texlive-fonts-recommended \
  pandoc \
  texlive-generic-recommended \
  libxrender1 \
  inkscape \
  libxml2-dev \
  libcurl4-gnutls-dev \
  libatlas3-base \
  libopenblas-base \
  libfreetype6-dev \
  libtool \
  libexpat1-dev \
  libxml2-dev \
  libxslt1-dev && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
  apt-get install -yq --no-install-recommends \ 
  ghostscript \
  gfortran \
  libpcre3 \
  libpcre3-dev \
  libssl-dev \
  libsqlite3-dev \
  libssl-dev \
  libfreetype6-dev \
  libpng-dev \
  liblmdb-dev \
  libmariadb-dev \
  libmariadb-client-lgpl-dev-compat \
  libtbb2 \
  libtbb-dev \
  curl \
  libcurl4 \
  libcurl4-openssl-dev \
  libncurses5-dev \
  libcairo2-dev \
  libtool-bin \
  libzmq3-dev \
  zip && \
   apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
  apt-get install -yq --no-install-recommends \ 
  tk \
  tcl \
  openssl \
  libssl-dev \
  libssh2-1-dev \
  libtool \
  libffi-dev \
  ruby \
  ruby-dev \
  make \
  libzmq3-dev \
  libczmq-dev \
  apt-transport-https \
  dirmngr \
  cmake \
  libpam0g-dev \
  lsb-release \
  libedit2 \
  libapparmor1 \
  gnupg \
  liblzma-dev \
  psmisc \
  less \
  libclang-dev && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

RUN wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb && \
  dpkg -i libssl1.1_1.1.1f-1ubuntu2_amd64.deb

RUN wget https://www.python.org/ftp/python/2.7.9/Python-2.7.9.tgz && \
  tar xzf Python-2.7.9.tgz && \
  cd Python-2.7.9 && \
  ./configure --with-ensurepip=upgrade --enable-optimizations --with-ssl-default-suites=openssl  && \
  make install

RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py && \
  python2 get-pip.py

RUN curl -O http://python-distribute.org/distribute_setup.py && \
  python distribute_setup.py && \
  curl -O https://raw.github.com/pypa/pip/master/contrib/get-pip.py && \
  python2 get-pip.py

RUN pip install pysam==0.9.0
RUN pip install PyPDF2==1.26.0
RUN pip install telomerehunter
