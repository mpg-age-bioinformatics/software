FROM condaforge/miniforge3:23.3.1-1

LABEL maintainer="bioinformatics@age.mpg.de"
LABEL org.jupyter.service="jupyterhub"

RUN apt-get update \
 && apt-get install -yq --no-install-recommends \
	wget \
	unzip \
    git \
    gcc \ 
    g++ \
    libtiff5 \
    python3-pip && \
    apt-get purge && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/ZarnackGroup/racoon_clip/archive/refs/tags/v1.0.7.zip
RUN unzip v1.0.7.zip

WORKDIR /racoon_clip-1.0.7/ 

RUN mamba create -n racoon_clip python=3.9.2 pip -y && \
    mamba init  && \
    echo "mamba activate racoon_clip" >> ~/.bashrc

SHELL ["conda", "run", "--no-capture-output", "-n", "racoon_clip", "/bin/bash", "-c"]
ENV PATH /opt/conda/envs/racoon_clip/bin:$PATH

RUN pip install -e .
RUN racoon_clip -h


WORKDIR /racoon_clip-1.0.7/racoon_clip/workflow/envs
RUN sed -i '$i\  - pandoc' racoon_R_v0.1.yml
RUN sed -i '$i\  - r-cairo' racoon_R_v0.1.yml

WORKDIR /racoon_clip-1.0.7/racoon_clip/workflow/rules
RUN sed -i '622,646 s/^# //'  Report.rmd
RUN sed -i '614i\umitools_out = map(umitools_out, ~mutate(.x, measure=modify_if(measure, .p = is_empty, .f = ~NA_character_)))' Report.rmd
RUN sed -i '72i\print(dir)' Report.rmd
RUN sed -i '189i\head(fastqc_report_raw)' Report.rmd

WORKDIR /racoon_clip-1.0.7/ 

ENTRYPOINT [ "bash", "-c", "source /root/.bashrc && exec \"$@\"", "--" ]
