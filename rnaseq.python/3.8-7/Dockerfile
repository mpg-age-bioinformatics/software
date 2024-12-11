FROM mpgagebioinformatics/rnaseq.python:3.8-6

LABEL maintainer "bioinformatics@age.mpg.de"

RUN pip3 uninstall AGEpy --yes
RUN pip3 install git+https://github.com/mpg-age-bioinformatics/AGEpy.git@51bf9d0459f995659b94aba34128956b09ea4b7c && python3 -c "import AGEpy"