# FROM continuumio/anaconda3

# RUN conda config --add channels conda-forge
# RUN conda config --add channels bioconda
# RUN conda config --add channels r
# RUN conda install -c anaconda libxml2

# RUN Rscript -e 'install.packages(c("devtools", "BiocManager"), repos = "https://cloud.r-project.org")'
# RUN Rscript -e 'BiocManager::install(c("pathview", "biomaRt", "msigdbr", "dendextend", "pheatmap", "sva", "ggrepel", "knitr", "clusterProfiler", "depmap"))'
# RUN Rscript -e 'BiocManager::install("MAGeCKFlute")'

# RUN Rscript -e 'devtools::install_github("liulab-dfci/MAGeCKFlute")'

FROM rocker/r-ver:4.3

RUN Rscript -e 'install.packages("BiocManager", repos="http://cloud.r-project.org/" )' && Rscript -e 'library(BiocManager)'

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq git build-essential wget libfontconfig1-dev libcurl4-openssl-dev libssl-dev libxml2-dev libharfbuzz-dev libfribidi-dev libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev pandoc pandoc-citeproc libglpk-dev libxt6 && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

RUN Rscript -e 'BiocManager::install(c("pathview", "biomaRt", "msigdbr", "dendextend", "pheatmap", "sva", "ggrepel", "knitr", "clusterProfiler", "depmap"))'
RUN Rscript -e 'BiocManager::install("MAGeCKFlute")' && Rscript -e 'library(MAGeCKFlute)'

# RUN Rscript -e 'install.packages("devtools", repos="http://cloud.r-project.org/" )'  && Rscript -e 'library(devtools)'
# RUN Rscript -e 'devtools::install_github("nathanthorpe/MAGeCKFlute@130ec59")' && Rscript -e 'library(MAGeCKFlute)'

# RUN mkdir /flute_out/

# COPY ./AJ02_Lib1_Lib2.gene_summary.txt /AJ02_Lib1_Lib2.gene_summary.txt
# COPY ./AJ02_Lib1_Lib2.sgrna_summary.txt /AJ02_Lib1_Lib2.sgrna_summary.txt
# COPY ./.command.sh /.command.sh

# RUN /.command.sh


# 4.0.5 :: 3.12
# 4.1 :: 3.14
# 4.2 :: 3.16
