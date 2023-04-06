FROM python:3.8-slim-bullseye

LABEL maintainer "bioinformatics@age.mpg.de"

RUN echo "deb http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq  git && \ 
  apt-get clean && rm -rf /var/lib/apt/lists/* 

RUN git clone https://github.com/hart-lab/bagel.git && cd bagel && git checkout 53388ad

RUN pip3 install click && python -c "import click"
RUN pip3 install numpy && python -c "import numpy"
RUN pip3 install pandas && python -c "import pandas"
RUN pip3 install scipy && python -c "import scipy"
RUN pip3 install scikit-learn && python -c "from sklearn.linear_model import LinearRegression"
