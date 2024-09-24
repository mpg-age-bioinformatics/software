FROM mpgagebioinformatics/rnaseq.python:3.8-2

LABEL maintainer "bioinformatics@age.mpg.de"

RUN pip3 uninstall openpyxl --yes
RUN pip3 install openpyxl && python3 -c "import openpyxl"