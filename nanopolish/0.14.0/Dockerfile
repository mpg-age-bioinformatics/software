FROM centos:7
LABEL maintainer "bioinformatics@age.mpg.de"

WORKDIR /
RUN yum group install "Development Tools" -y
RUN yum install git wget tar zlib-devel -y
RUN yum install bzip2 bzip2-devel -y
RUN git clone --recursive https://github.com/jts/nanopolish.git
WORKDIR /nanopolish
RUN make all
WORKDIR / 
ENV PATH /nanopolish:$PATH