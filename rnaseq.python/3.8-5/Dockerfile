FROM mpgagebioinformatics/rnaseq.python:3.8-2

LABEL maintainer "bioinformatics@age.mpg.de"

RUN pip3 uninstall openpyxl --yes
RUN pip3 install openpyxl && python3 -c "import openpyxl"
RUN pip3 uninstall AGEpy --yes
RUN pip3 install git+https://github.com/mpg-age-bioinformatics/AGEpy.git@1871ef300c0a4abd5339b3c86bd0b57c41dbba65 && python3 -c "import AGEpy"