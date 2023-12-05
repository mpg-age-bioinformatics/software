FROM python:3.8-slim-bullseye

LABEL maintainer "bioinformatics@age.mpg.de"

RUN echo "deb http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq git build-essential wget libfontconfig1-dev libcurl4-openssl-dev libssl-dev libxml2-dev libharfbuzz-dev libfribidi-dev libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install numpy==1.19.5 scipy pandas openpyxl

RUN git clone https://bitbucket.org/liulab/mageck.git && \
    cd mageck && \
    python setup.py install

RUN wget https://downloads.sourceforge.net/project/spacerscoringcrispr/SSC0.1/SSC0.1.tar.gz && \
  tar -zxvf SSC0.1.tar.gz

ENV PATH /SSC0.1/bin:${PATH}

RUN echo "deb http://cloud.r-project.org/bin/linux/debian bullseye-cran40/" >> /etc/apt/sources.list && \
  gpg --keyserver keyserver.ubuntu.com --recv-key '95C0FAF38DB3CCAD0C080A7BDC78B2DDEABC47B7' && \
  gpg --armor --export '95C0FAF38DB3CCAD0C080A7BDC78B2DDEABC47B7' | tee /etc/apt/trusted.gpg.d/cran_debian_key.asc

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq r-base r-base-dev r-recommended  && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

RUN Rscript -e 'install.packages("BiocManager", repos="http://cloud.r-project.org/" )' && Rscript -e 'library(BiocManager)'
RUN Rscript -e 'BiocManager::install("fgsea")' && Rscript -e 'library(fgsea)'
RUN Rscript -e 'install.packages("data.table", repos="http://cloud.r-project.org/" )'  && Rscript -e 'library(data.table)'
# RUN Rscript -e 'install.packages("devtools", repos="http://cloud.r-project.org/" )'  && Rscript -e 'library(devtools)'
# RUN Rscript -e 'devtools::install_version("ggplot2", "3.3.3")' && Rscript -e 'library(ggplot2)'
RUN Rscript -e 'install.packages("ggplot2", repos="http://cloud.r-project.org/" )' && Rscript -e 'library(ggplot2)'
RUN Rscript -e 'install.packages("openxlsx", repos="http://cloud.r-project.org/" )' && Rscript -e 'library(openxlsx)'
RUN Rscript -e 'BiocManager::install("MAGeCKFlute")' && Rscript -e 'library(MAGeCKFlute)'

# ENTRYPOINT echo "Welcome to MAGeCK Docker" && mageck --version && /bin/bash 

# docker build --progress plain -t mageck . 2>&1 | tee build.log