FROM mpgagebioinformatics/agepy:1790ea2

LABEL maintainer "bioinformatics@age.mpg.de"

RUN pip3 uninstall -y AGEpy && pip3 install git+https://github.com/mpg-age-bioinformatics/AGEpy.git@7c412ae && python3 -c "import AGEpy"
