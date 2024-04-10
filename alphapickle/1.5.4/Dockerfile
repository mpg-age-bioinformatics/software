FROM continuumio/anaconda3:main@sha256:bf82cf604132b6e42ecd3d92abd49a2ef4648824dd346b8c5a6cff5f46537950

LABEL maintainer="bioinformatics@age.mpg.de"
LABEL org.jupyter.service="jupyterhub"

RUN apt-get update \
 && apt-get install -yq --no-install-recommends \
	git && \
    apt-get purge && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/mattarnoldbio/alphapickle.git && cd alphapickle && git checkout 0d08bc4

RUN cd alphapickle && cp linux64requirements.txt linux64requirements.txt_

RUN sed -i '/intel-openmp/d' alphapickle/linux64requirements.txt_
RUN sed -i '/numpy-base/d' alphapickle/linux64requirements.txt_
RUN sed -i '/fonttools/d' alphapickle/linux64requirements.txt_
RUN sed -i '/mkl_random/d' alphapickle/linux64requirements.txt_
RUN sed -i '/ca-certificates/d' alphapickle/linux64requirements.txt_
RUN sed -i '/setuptools/d' alphapickle/linux64requirements.txt_
RUN echo 'intel-openmp' >> alphapickle/linux64requirements.txt_
RUN echo 'numpy-base' >> alphapickle/linux64requirements.txt_
RUN echo 'fonttools' >> alphapickle/linux64requirements.txt_
RUN echo 'mkl_random' >> alphapickle/linux64requirements.txt_
RUN echo 'ca-certificates' >> alphapickle/linux64requirements.txt_
RUN echo 'setuptools' >> alphapickle/linux64requirements.txt_
  
RUN cd alphapickle && conda create -y -c conda-forge -c bioconda -c default  --name alphapickle --file linux64requirements.txt_
RUN pip install biopython