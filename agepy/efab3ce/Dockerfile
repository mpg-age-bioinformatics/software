FROM mpgagebioinformatics/agepy:efab3ce

LABEL maintainer "bioinformatics@age.mpg.de"

RUN pip3 uninstall -y AGEpy && pip3 install git+https://github.com/mpg-age-bioinformatics/AGEpy.git@efab3ce && python3 -c "import AGEpy"