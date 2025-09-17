FROM ubuntu:22.04

LABEL maintainer="bioinformatics@age.mpg.de"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        python3 python3-pip wkhtmltopdf git curl build-essential && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir pycoQC==2.5.2 pdfkit pandas
