FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install IQ-TREE2 from the official GitHub release
ARG IQTREE_VERSION=2.3.6
RUN wget -q https://github.com/iqtree/iqtree2/releases/download/v${IQTREE_VERSION}/iqtree-${IQTREE_VERSION}-Linux-intel.tar.gz \
    && tar -xzf iqtree-${IQTREE_VERSION}-Linux-intel.tar.gz \
    && cp iqtree-${IQTREE_VERSION}-Linux-intel/bin/iqtree2 /usr/local/bin/iqtree2 \
    && rm -rf iqtree-${IQTREE_VERSION}-Linux-intel* \
    && chmod +x /usr/local/bin/iqtree2

# WORKDIR /data

# ENTRYPOINT ["iqtree2"]
# CMD ["--help"]