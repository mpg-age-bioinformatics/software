FROM rocker/r-ver:4.3

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq git build-essential wget libfontconfig1-dev libcurl4-openssl-dev libssl-dev libxml2-dev libharfbuzz-dev libfribidi-dev libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev pandoc pandoc-citeproc libglpk-dev libxt6 && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

RUN Rscript -e 'install.packages("devtools", repos="http://cloud.r-project.org/" )'  && Rscript -e 'library(devtools)'
RUN Rscript -e 'devtools::install_github("de-Boer-Lab/MAUDE@7aa20cc")' && Rscript -e 'library(MAUDE)'

# docker build --progress plain -t maude . 2>&1 | tee build.log