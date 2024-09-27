FROM mpgagebioinformatics/rnaseq.python:3.8-2

LABEL maintainer "bioinformatics@age.mpg.de"

RUN pip3 uninstall openpyxl --yes
RUN pip3 install openpyxl && python3 -c "import openpyxl"
RUN pip3 uninstall AGEpy --yes
RUN pip3 install git+https://github.com/mpg-age-bioinformatics/AGEpy.git@67757a613de8ae7f32d2c9ea734346491d13a37b && python3 -c "import AGEpy"