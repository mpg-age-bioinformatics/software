FROM continuumio/miniconda3

# Install git
RUN apt-get update && apt-get install -y git

# Install C++ compiler and build tools
RUN apt-get update && apt-get install -y build-essential

# Clone the repository
RUN git clone https://github.com/BlencoweLab/CHyMErA-Net.git

# Copy modified environment file
COPY env.yml /CHyMErA-Net/env.yml

# Create environment
RUN cd /CHyMErA-Net && conda env create -n cas12a -f env.yml

RUN echo "cd /CHyMErA-Net && source activate cas12a" >> ~/.bashrc
RUN sed -i 's/import os/#import os/' /opt/conda/envs/cas12a/lib/python3.7/site-packages/distutils-precedence.pth

# Activate and python setup
RUN /bin/bash -c "source activate cas12a && cd /CHyMErA-Net && python setup.py install"