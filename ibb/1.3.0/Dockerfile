FROM mpgagebioinformatics/deseq2:1.38.0
LABEL maintainer "bioinformatics@age.mpg.de"

RUN Rscript -e 'install.packages("amap", repos="https://cloud.r-project.org/", dependencies = TRUE)'
RUN Rscript -e 'library(amap)'

RUN Rscript -e 'install.packages("plyr", repos="https://cloud.r-project.org/", dependencies = TRUE)'
RUN Rscript -e 'library(plyr)'

RUN Rscript -e 'install.packages("countdata", repos="https://cloud.r-project.org/", dependencies = TRUE)'
RUN Rscript -e 'library(countdata)'
