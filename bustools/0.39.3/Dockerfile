FROM ubuntu

RUN apt-get update && \
	apt-get install -yq wget git build-essential && \
	apt-get clean && rm -rf /var/lib/apt/lists/* && \
	wget https://github.com/Kitware/CMake/releases/download/v3.24.1/cmake-3.24.1-Linux-x86_64.sh -q -O /tmp/cmake-install.sh && \
      	chmod u+x /tmp/cmake-install.sh && \
       	mkdir /opt/cmake-3.24.1 && \
       	/tmp/cmake-install.sh --skip-license --prefix=/opt/cmake-3.24.1 && \
       	rm /tmp/cmake-install.sh && \
	ln -s /opt/cmake-3.24.1/bin/* /usr/local/bin


RUN git clone https://github.com/BUStools/bustools.git
RUN cd bustools
RUN mkdir build
RUN cd build
RUN cmake ..
RUN make
RUN make install
