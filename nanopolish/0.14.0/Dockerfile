FROM centos:7
LABEL maintainer "bioinformatics@age.mpg.de"

# WORKDIR /
RUN yum group install "Development Tools" -y
RUN yum install git wget tar zlib-devel -y
RUN yum install bzip2 bzip2-devel -y
RUN git clone --recursive https://github.com/jts/nanopolish.git
WORKDIR /nanopolish
RUN make all
WORKDIR / 
ENV PATH /nanopolish:$PATH

# Install Miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -b -p /miniconda && \
    rm Miniconda3-latest-Linux-x86_64.sh

# Add Miniconda to the PATH
ENV PATH="/miniconda/bin:${PATH}"

# Create a new Conda environment and activate it
RUN conda create -n nanopolish-env python=3.7 && \
    echo "source activate nanopolish-env" > ~/.bashrc
SHELL ["/bin/bash", "--rcfile", "/root/.bashrc", "-l", "-c"]

# Install Nanopolish and its dependencies
#RUN conda install -c bioconda nanopolish
RUN conda install -c bioconda ont_vbz_hdf_plugin
RUN export HDF5_PLUGIN_PATH=/miniconda/envs/nanopolish-env/hdf5/lib/plugin