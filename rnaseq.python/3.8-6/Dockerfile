FROM mpgagebioinformatics/rnaseq.python:3.8-2

LABEL maintainer "bioinformatics@age.mpg.de"

RUN pip3 uninstall openpyxl --yes
RUN pip3 install openpyxl && python3 -c "import openpyxl"
RUN pip3 uninstall AGEpy --yes
RUN pip3 install git+https://github.com/mpg-age-bioinformatics/AGEpy.git@270ee555260d0672b44dc3bcb5bb84f777b7233a && python3 -c "import AGEpy"