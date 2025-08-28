FROM continuumio/miniconda3

LABEL maintainer="bioinformatics@age.mpg.de"
LABEL license="MPL-2.0"


RUN conda install -y -c conda-forge -c bioconda python=3.10 isoquant

WORKDIR /data
