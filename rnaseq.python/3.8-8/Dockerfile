FROM mpgagebioinformatics/rnaseq.python:3.8-7

LABEL maintainer "bioinformatics@age.mpg.de"

RUN pip3 uninstall AGEpy --yes
RUN pip3 install git+https://github.com/mpg-age-bioinformatics/AGEpy.git@8c02d47baf03523b31c03d0fe9c4bddc91ccb096 && python3 -c "import AGEpy"