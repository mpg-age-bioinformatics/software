## FROM https://github.com/pegi3s/dockerfiles/blob/master/repeat_masker/4.0.9/Dockerfile

FROM debian:bullseye-slim

LABEL maintainer "bioinformatics@age.mpg.de"

RUN echo "deb http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev && \
  apt-get clean && rm -rf /var/lib/apt/lists/* 

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq python3 python3-pip perl && \
  apt-get clean && rm -rf /var/lib/apt/lists/* 

RUN pip3 install h5py

RUN wget http://eddylab.org/software/hmmer/hmmer-3.2.1.tar.gz && \
  tar -zxvf hmmer-3.2.1.tar.gz && \
  cd hmmer-3.2.1 && \
  ./configure && \
  make && \
  make check && \
  make install 

RUN wget https://github.com/Benson-Genomics-Lab/TRF/releases/download/v4.09.1/trf409.linux64 && \
  mv trf*.linux64 /bin/trf && \
  chmod +x /bin/trf

RUN wget https://www.repeatmasker.org/RepeatMasker/RepeatMasker-4.1.5.tar.gz && \
  tar -zxvf RepeatMasker-4.1.5.tar.gz && \
  cp RepeatMasker-4.1.5.tar.gz /usr/local && \
  cd /usr/local && \
  tar -zxvf RepeatMasker-4.1.5.tar.gz

# this is an 89 GB file and won't be used by default on the image
# RUN wget https://www.dfam.org/releases/Dfam_3.7/families/Dfam.h5.gz && \
#   gunzip Dfam.h5.gz && \
#   mv Dfam.h5 /usr/local/RepeatMasker/Libraries

RUN cd /usr/local/RepeatMasker && \
  perl ./configure -trf_prgm=/usr/local/bin/trf --hmmer_dir=`which nhmmscan`

RUN cpan Text::Soundex

ENV PATH=/usr/local/RepeatMasker:$PATH
ENV PATH=/usr/local/bin:$PATH
