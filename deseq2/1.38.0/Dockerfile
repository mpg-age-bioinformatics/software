
FROM r-base:4.2.2
LABEL maintainer "bioinformatics@age.mpg.de"

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq wget build-essential zlib1g-dev libbz2-dev liblzma-dev git libmagickwand-dev libcurl4-gnutls-dev libxml2-dev libssl-dev libharfbuzz-dev libfribidi-dev && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

# RUN apt-get update && apt-get install -yq openjdk-8-jre openjdk-8-jdk
# ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre/
# RUN R CMD javareconf
# # RUN Rscript -e 'install.packages("xlsx", repos="https://cloud.r-project.org/", dependencies = TRUE)'
# # RUN Rscript -e 'library(xlsx)'
  
RUN Rscript -e 'install.packages("devtools", repos="https://cloud.r-project.org/", dependencies = TRUE)'
RUN Rscript -e 'library(devtools)'
RUN Rscript -e 'install.packages("BiocManager", repos="http://cloud.r-project.org/" )' 
RUN Rscript -e 'library(BiocManager)'
RUN Rscript -e 'install.packages("readxl", repos="http://cloud.r-project.org/", dependencies = TRUE)'
RUN Rscript -e 'library(readxl)'
RUN Rscript -e 'install.packages("WriteXLS", repos="http://cloud.r-project.org/", dependencies = TRUE)'
RUN Rscript -e 'library(WriteXLS)'
RUN Rscript -e 'install.packages("tidyverse", repos="https://cloud.r-project.org/", dependencies = TRUE)'
RUN Rscript -e 'library(tidyverse)'
RUN Rscript -e 'install.packages("gridExtra", repos="https://cloud.r-project.org/", dependencies = TRUE)'
RUN Rscript -e 'library(gridExtra)'
RUN Rscript -e 'install.packages("gplots", repos="https://cloud.r-project.org/", dependencies = TRUE)'
RUN Rscript -e 'library(gplots)'
RUN Rscript -e 'install.packages("openxlsx", repos="http://cloud.r-project.org/", dependencies = TRUE)'
RUN Rscript -e 'library(openxlsx)'
RUN Rscript -e 'install.packages("zoo", repos="http://cloud.r-project.org/", dependencies = TRUE)'
RUN Rscript -e 'library(zoo)'
RUN Rscript -e 'install.packages("locfit", repos="http://cloud.r-project.org/", dependencies = TRUE)'
RUN Rscript -e 'library(locfit)'
RUN Rscript -e 'install.packages("XML", repos="http://cloud.r-project.org/", dependencies = TRUE)'
RUN Rscript -e 'library(XML)'

RUN Rscript -e 'BiocManager::install("tximportData")'
RUN Rscript -e 'library(tximportData)'
RUN Rscript -e 'BiocManager::install("tximport")'
RUN Rscript -e 'library(tximport)'
RUN Rscript -e 'BiocManager::install("readr")' 
RUN Rscript -e 'library(readr)'
RUN Rscript -e 'BiocManager::install("rhdf5")'
RUN Rscript -e 'library(rhdf5)'
RUN Rscript -e 'BiocManager::install("apeglm")' 
RUN Rscript -e 'library(apeglm)'
RUN Rscript -e 'BiocManager::install("DESeq2")'
RUN Rscript -e 'library(DESeq2)'