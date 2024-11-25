# Start with a Debian base image
FROM debian:bullseye-slim

LABEL maintainer "bioinformatics@age.mpg.de"

RUN echo "deb http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list

# Update the package list and install dependencies
RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq wget tar pigz curl bzip2 build-essential libncurses-dev zlib1g-dev libbz2-dev liblzma-dev git && \
  apt-get clean && rm -rf /var/lib/apt/lists/* 


# Install Miniconda
ENV CONDA_DIR /opt/conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh && \
    bash /tmp/miniconda.sh -b -p $CONDA_DIR && \
    rm /tmp/miniconda.sh && \
    $CONDA_DIR/bin/conda init && \
    ln -s $CONDA_DIR/bin/conda /usr/bin/conda

# Set environment variables for Conda
ENV PATH $CONDA_DIR/bin:$PATH

# Install Mamba in the base Conda environment
RUN conda install -n base -c conda-forge mamba

# Create Conda environment with Python 3.10 and pip using Mamba
RUN mamba create --name guidescan python=3.10 pip

# Activate the environment, clone the repository, and install with pip
RUN /bin/bash -c " \
    source activate guidescan && \
    git clone https://github.com/pritykinlab/guidescanpy.git && \
    cd guidescanpy && \
    pip install -e '.[dev]'"

# Install guidescan from conda-forge and bioconda channels
RUN /bin/bash -c "source activate guidescan && \
    mamba install -c conda-forge -c bioconda guidescan"

# Verify Guidescan installation
RUN /bin/bash -c "source activate guidescan && guidescan --version"

# Run Snakemake pipeline with Mamba as the Conda frontend
RUN /bin/bash -c " \
    source activate guidescan && \
    cd guidescanpy/docker/snakemake && \
    snakemake -F guidescan_pytest --cores 1 --use-conda --conda-frontend mamba \
    --config max_kmers=1000 enzymes='[\"cas9\"]' organisms='[\"sacCer3\"]'"

# Specify default shell for Conda compatibility
SHELL ["/bin/bash", "-c"]
