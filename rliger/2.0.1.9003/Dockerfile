FROM r-base:4.4.0
LABEL maintainer "bioinformatics@age.mpg.de"

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq wget build-essential zlib1g-dev libbz2-dev liblzma-dev git libmagickwand-dev libcurl4-gnutls-dev libxml2-dev libssl-dev libharfbuzz-dev libfribidi-dev && \
  apt-get clean && rm -rf /var/lib/apt/lists/*


RUN Rscript -e 'install.packages("devtools", repos="https://cloud.r-project.org/", dependencies = TRUE)'
RUN Rscript -e 'library(devtools)'

RUN Rscript -e 'devtools::install_github("mvfki/liger")'
#RUN Rscript -e 'library(rliger)'

# RUN Rscript -e 'install.packages("readxl", repos="http://cloud.r-project.org/", dependencies = TRUE)'
# RUN Rscript -e 'library(readxl)'
# RUN Rscript -e 'install.packages("WriteXLS", repos="http://cloud.r-project.org/", dependencies = TRUE)'
# RUN Rscript -e 'library(WriteXLS)'
# RUN Rscript -e 'install.packages("tidyverse", repos="https://cloud.r-project.org/", dependencies = TRUE)'
# RUN Rscript -e 'library(tidyverse)'
# RUN Rscript -e 'install.packages("gridExtra", repos="https://cloud.r-project.org/", dependencies = TRUE)'
# RUN Rscript -e 'library(gridExtra)'
# RUN Rscript -e 'install.packages("gplots", repos="https://cloud.r-project.org/", dependencies = TRUE)'
# RUN Rscript -e 'library(gplots)'
# RUN Rscript -e 'install.packages("openxlsx", repos="http://cloud.r-project.org/", dependencies = TRUE)'
# RUN Rscript -e 'library(openxlsx)'