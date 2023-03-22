FROM mpgagebioinformatics/rnaseq.python:3.8-1

LABEL maintainer "bioinformatics@age.mpg.de"

RUN pip3 uninstall AGEpy
RUN pip3 install git+https://github.com/mpg-age-bioinformatics/AGEpy.git && python3 -c "import AGEpy"
