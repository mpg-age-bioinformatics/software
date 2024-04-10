FROM python:3.8-slim-bullseye

LABEL maintainer "bioinformatics@age.mpg.de"

RUN echo "deb http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list && \
echo "deb http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list && \
echo "deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq  git && \ 
  apt-get clean && rm -rf /var/lib/apt/lists/* 

RUN git clone https://github.com/mattarnoldbio/alphapickle.git && cd alphapickle && git checkout 0d08bc4

RUN pip3 install altgraph=0.17.2
RUN pip3 install argcomplete=1.12.3
RUN pip3 install argh=0.26.2
RUN pip3 install backcall=0.2.0
RUN pip3 install biopython=1.79
RUN pip3 install blas=1.0
RUN pip3 install brotli=1.0.9
RUN pip3 install ca-certificates=2021.10.26
RUN pip3 install certifi=2021.10.8
RUN pip3 install cycler=0.10.0
RUN pip3 install decorator=5.0.9
RUN pip3 install fonttools=4.25.0
RUN pip3 install freetype=2.10.4
RUN pip3 install gffutils=0.10.1
RUN pip3 install intel-openmp=2021.2.0
RUN pip3 install ipykernel=5.3.4
RUN pip3 install ipython=7.22.0
RUN pip3 install ipython_genutils=0.2.0
RUN pip3 install jedi=0.17.2
RUN pip3 install jpeg=9d
RUN pip3 install jupyter_client=6.1.12
RUN pip3 install jupyter_core=4.7.1
RUN pip3 install kiwisolver=1.3.1
RUN pip3 install lcms2=2.12
RUN pip3 install libcxx=10.0.0
RUN pip3 install libffi=3.3
RUN pip3 install libgfortran5=11.2.0
RUN pip3 install libpng=1.6.37
RUN pip3 install libsodium=1.0.18
RUN pip3 install libtiff=4.2.0
RUN pip3 install libwebp-base=1.2.0
RUN pip3 install lz4-c=1.9.3
RUN pip3 install macholib=1.14
RUN pip3 install matplotlib=3.4.2
RUN pip3 install matplotlib-base=3.4.2
RUN pip3 install mkl=2021.2.0
RUN pip3 install mkl-service=2.3.0
RUN pip3 install mkl_fft=1.3.0
RUN pip3 install mkl_random=1.2.1
RUN pip3 install munkres=1.1.4
RUN pip3 install ncurses=6.2
RUN pip3 install numpy=1.20.2
RUN pip3 install numpy-base=1.20.2
RUN pip3 install olefile=0.46
RUN pip3 install openjpeg=2.4.0
RUN pip3 install openssl=1.1.1l
RUN pip3 install pandas=1.2.4
RUN pip3 install parso=0.7.0
RUN pip3 install pexpect=4.8.0
RUN pip3 install pickleshare=0.7.5
RUN pip3 install pillow=8.3.1
RUN pip3 install pip=21.1.2
RUN pip3 install prompt-toolkit=3.0.17
RUN pip3 install ptyprocess=0.7.0
RUN pip3 install pyfaidx=0.6.3.1
RUN pip3 install pygments=2.9.0
RUN pip3 install pyinstaller=4.5.1
RUN pip3 install pyinstaller-hooks-contrib=2021.3
RUN pip3 install pyparsing=2.4.7
RUN pip3 install python=3.9.5
RUN pip3 install python-dateutil=2.8.1
RUN pip3 install python_abi=3.9
RUN pip3 install pytz=2021.1
RUN pip3 install pyzmq=20.0.0
RUN pip3 install readline=8.1
RUN pip3 install scipy=1.6.2
RUN pip3 install seaborn=0.11.2
RUN pip3 install setuptools=52.0.0
RUN pip3 install simplejson=3.17.5
RUN pip3 install six=1.16.0
RUN pip3 install sqlite=3.35.4
RUN pip3 install tk=8.6.10
RUN pip3 install tornado=6.1
RUN pip3 install traitlets=5.0.5
RUN pip3 install tzdata=2020f
RUN pip3 install wcwidth=0.2.5
RUN pip3 install wheel=0.36.2
RUN pip3 install xz=5.2.5
RUN pip3 install zeromq=4.3.4
RUN pip3 install zlib=1.2.11
RUN pip3 install zstd=1.4.9