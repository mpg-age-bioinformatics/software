FROM debian:bullseye-slim

LABEL maintainer "bioinformatics@age.mpg.de"

RUN echo "deb http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq curl libgomp1 && \
  apt-get clean && rm -rf /var/lib/apt/lists/*


RUN curl -o /usr/bin/FastTree http://www.microbesonline.org/fasttree/FastTree && \
    curl -o /usr/bin/FastTreeMP http://www.microbesonline.org/fasttree/FastTreeMP  && \
    chmod ug+x /usr/bin/FastTree && \
    chmod ug+x /usr/bin/FastTreeMP