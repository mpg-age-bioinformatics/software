FROM python:3.8-slim-bullseye

LABEL maintainer "bioinformatics@age.mpg.de"

RUN echo "deb http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq wget build-essential zlib1g-dev libbz2-dev liblzma-dev git libmagickwand-dev bedtools pigz && \
  apt-get clean && rm -rf /var/lib/apt/lists/* 

RUN pip3 install pandas && python3 -c "import pandas"
RUN pip3 install xlrd && python3 -c "import xlrd"
RUN pip3 install openpyxl && python3 -c "import openpyxl"
RUN pip3 install biomart && python3 -c "import biomart"
RUN pip3 install numpy && python3 -c "import numpy"
RUN pip3 install -U scikit-learn scipy matplotlib && python3 -c "import sklearn, scipy, matplotlib"
RUN pip3 install seaborn && python3 -c "import seaborn"
RUN pip3 install git+https://github.com/mpg-age-bioinformatics/AGEpy.git@932dfe2 && python3 -c "import AGEpy"