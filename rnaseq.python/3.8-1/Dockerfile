FROM python:3.8-slim-bullseye

LABEL maintainer "bioinformatics@age.mpg.de"

RUN echo "deb http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq wget build-essential zlib1g-dev libbz2-dev liblzma-dev git && \
  apt-get clean && rm -rf /var/lib/apt/lists/* 

RUN pip3 install pandas
RUN pip3 install xlrd
RUN pip3 install openpyxl
RUN pip3 install biomart
RUN pip3 install git+https://github.com/mpg-age-bioinformatics/AGEpy.git
RUN pip3 install numpy
RUN pip3 install -U scikit-learn scipy matplotlib
RUN pip3 install seaborn
RUN pip3 install git+https://github.com/cytoscape/py2cytoscape.git
RUN pip3 install multiqc --ignore-installed
RUN pip3 install RSeQC