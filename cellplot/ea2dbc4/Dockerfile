
FROM r-base:4.2.2
LABEL maintainer "bioinformatics@age.mpg.de"

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq wget build-essential zlib1g-dev libbz2-dev liblzma-dev git libmagickwand-dev libcurl4-gnutls-dev libxml2-dev libssl-dev libharfbuzz-dev libfribidi-dev && \
  apt-get clean && rm -rf /var/lib/apt/lists/*
  
RUN Rscript -e 'install.packages("devtools", repos="https://cloud.r-project.org/", dependencies = TRUE)'
RUN Rscript -e 'library(devtools)'
RUN Rscript -e 'install.packages("BiocManager", repos="http://cloud.r-project.org/", dependencies = TRUE )' 
RUN Rscript -e 'library(BiocManager)'
RUN Rscript -e 'install.packages("stringr", repos="http://cloud.r-project.org/", dependencies = TRUE )' 
RUN Rscript -e 'library(stringr)'
RUN Rscript -e 'install.packages("dplyr", repos="http://cloud.r-project.org/", dependencies = TRUE )' 
RUN Rscript -e 'library(dplyr)'
RUN Rscript -e 'install.packages("knitr", repos="http://cloud.r-project.org/", dependencies = TRUE )' 
RUN Rscript -e 'library(knitr)'
RUN Rscript -e 'install.packages("rmarkdown", repos="http://cloud.r-project.org/", dependencies = TRUE )' 
RUN Rscript -e 'library(rmarkdown)'
RUN Rscript -e 'install.packages("gplots", repos="https://cloud.r-project.org/", dependencies = TRUE)'
RUN Rscript -e 'library(gplots)'
RUN Rscript -e 'install.packages("gplots", repos="https://cloud.r-project.org/", dependencies = TRUE)'
RUN Rscript -e 'library(gplots)'
RUN Rscript -e 'install.packages("readxl", repos="http://cloud.r-project.org/", dependencies = TRUE)'
RUN Rscript -e 'library(readxl)'
RUN Rscript -e 'install.packages("openxlsx", repos="http://cloud.r-project.org/", dependencies = TRUE)'
RUN Rscript -e 'library(openxlsx)'
RUN Rscript -e 'devtools::install_github("dieterich-lab/CellPlot", ref="ea2dbc4")'
RUN Rscript -e 'library(CellPlot)'
RUN Rscript -e 'BiocManager::install("BiocParallel")'
RUN Rscript -e 'library(BiocParallel)'
RUN Rscript -e 'BiocManager::install("annotate")'
RUN Rscript -e 'library(annotate)'