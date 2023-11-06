## FROM https://github.com/pegi3s/dockerfiles/blob/master/repeat_masker/4.0.9/Dockerfile

##FROM debian:bullseye-slim
FROM debian:bookworm-slim

LABEL maintainer "bioinformatics@age.mpg.de"

RUN echo "deb http://deb.debian.org/debian/ bookworm main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bookworm main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://deb.debian.org/debian/ bookworm-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bookworm-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://security.debian.org/debian-security bookworm-security main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://security.debian.org/debian-security bookworm-security main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev && \
  apt-get clean && rm -rf /var/lib/apt/lists/* 

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq python3 python3-pip perl && \
  apt-get clean && rm -rf /var/lib/apt/lists/* 

RUN pip3 install h5py --break-system-packages

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

RUN cd /usr/local/bin && \
  wget https://www.repeatmasker.org/rmblast/rmblast-2.14.1+-x64-linux.tar.gz && \
  tar -zxvf rmblast-2.14.1+-x64-linux.tar.gz && \
  rm rmblast-2.14.1+-x64-linux.tar.gz && \
  cp /usr/local/bin/rmblast-2.14.1/bin/* /usr/local/bin && \
  rm -R /usr/local/bin/rmblast-2.14.1

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
  perl ./configure -trf_prgm=/bin/trf -hmmer_dir=/usr/local/bin -rmblast_dir=/usr/local/bin -default_search_engine rmblast

RUN cpan Text::Soundex

ENV PATH=/usr/local/RepeatMasker:$PATH
ENV PATH=/usr/local/bin:$PATH


