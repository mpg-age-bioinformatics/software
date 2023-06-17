FROM r-base:4.2.2
LABEL maintainer "bioinformatics@age.mpg.de"

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq wget build-essential && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

# RUN apt-get update && apt-get install -yq openjdk-8-jre openjdk-8-jdk
# ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre/
# RUN R CMD javareconf
# # RUN Rscript -e 'install.packages("xlsx", repos="https://cloud.r-project.org/", dependencies = TRUE)'
# # RUN Rscript -e 'library(xlsx)'
  
RUN Rscript -e 'install.packages("data.table", repos="https://cloud.r-project.org/", dependencies = TRUE)'
RUN Rscript -e 'library(data.table)'
RUN Rscript -e 'install.packages("futile.logger", repos="https://cloud.r-project.org/", dependencies = TRUE)'
RUN Rscript -e 'library(futile.logger)'
RUN Rscript -e 'install.packages("ggplot2", repos="https://cloud.r-project.org/", dependencies = TRUE)'
RUN Rscript -e 'library(ggplot2)'
RUN Rscript -e 'install.packages("optparse", repos="https://cloud.r-project.org/", dependencies = TRUE)'
RUN Rscript -e 'library(optparse)'
RUN Rscript -e 'install.packages("plyr", repos="https://cloud.r-project.org/", dependencies = TRUE)'
RUN Rscript -e 'library(plyr)'
RUN Rscript -e 'install.packages("readr", repos="https://cloud.r-project.org/", dependencies = TRUE)'
RUN Rscript -e 'library(readr)'
RUN Rscript -e 'install.packages("reshape2", repos="https://cloud.r-project.org/", dependencies = TRUE)'
RUN Rscript -e 'library(reshape2)'
RUN Rscript -e 'install.packages("scales", repos="https://cloud.r-project.org/", dependencies = TRUE)'
RUN Rscript -e 'library(scales)'
RUN Rscript -e 'install.packages("viridis", repos="https://cloud.r-project.org/", dependencies = TRUE)'
RUN Rscript -e 'library(viridis)'
RUN Rscript -e 'install.packages("yaml", repos="https://cloud.r-project.org/", dependencies = TRUE)'
RUN Rscript -e 'library(yaml)'

RUN wget https://raw.githubusercontent.com/roblanf/minion_qc/master/MinIONQC.R -O MinIONQC.R
RUN chmod u+x MinIONQC.R