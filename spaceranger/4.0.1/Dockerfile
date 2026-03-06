FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ARG SPACERANGER_VERSION=4.0.1
ARG SPACERANGER_TARBALL=spaceranger-${SPACERANGER_VERSION}.tar.gz
ARG SPACERANGER_LINK="https://cf.10xgenomics.com/releases/spatial-exp/spaceranger-4.0.1.tar.gz?Expires=1772835097&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA&Signature=TZi7vtL-~oK21x77L4FDYTKJGm4XQAe8C~~q8i4rz2c1pja-B8Cn2fzH6H37JS8K4mNzS8TxmfyDhv8UlIr4cy~0-x84JegS6-mo-LS9IvTTrFOmZyZ53buD47vPcH2tUcsXL~DTYu~K4-D1lUN5tV7YwvmYL6-BWfeGMwQ-bj92xXsjPc4lsjYFY4HO0xk4ezBlNLRoxhtk2Z4qAGwCgLoaO4vrYDentnSmFu56zfD5Mnsf5cS2UG-Ln5XQslKFheIxxiKpjrmC3KmM5cbYZ0pywAJ3Qe8hLLDbZ1aTYFWr9l1vjhVdPVAIUiC4CSi7aVnwuEIjx3i-z8sE2zvbsw__"

# Optional: pass the expected md5 from the 10x downloads page at build time
ARG SPACERANGER_MD5="b0beb100947717cee8c7ad0d7a9f0247"

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    wget \
    bash \
    coreutils \
    tar \
    gzip \
    bzip2 \
    xz-utils \
    procps \
    file \
    perl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt

RUN wget -O ${SPACERANGER_TARBALL} "https://cf.10xgenomics.com/releases/spatial-exp/spaceranger-4.0.1.tar.gz?Expires=1772835097&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA&Signature=TZi7vtL-~oK21x77L4FDYTKJGm4XQAe8C~~q8i4rz2c1pja-B8Cn2fzH6H37JS8K4mNzS8TxmfyDhv8UlIr4cy~0-x84JegS6-mo-LS9IvTTrFOmZyZ53buD47vPcH2tUcsXL~DTYu~K4-D1lUN5tV7YwvmYL6-BWfeGMwQ-bj92xXsjPc4lsjYFY4HO0xk4ezBlNLRoxhtk2Z4qAGwCgLoaO4vrYDentnSmFu56zfD5Mnsf5cS2UG-Ln5XQslKFheIxxiKpjrmC3KmM5cbYZ0pywAJ3Qe8hLLDbZ1aTYFWr9l1vjhVdPVAIUiC4CSi7aVnwuEIjx3i-z8sE2zvbsw__"

# Copy the tarball you downloaded manually from 10x into the build context
#COPY ${SPACERANGER_TARBALL} /opt/${SPACERANGER_TARBALL}

# Verify checksum if provided, then unpack
RUN if [ -n "${SPACERANGER_MD5}" ]; then \
      echo "${SPACERANGER_MD5}  /opt/${SPACERANGER_TARBALL}" | md5sum -c - ; \
    fi \
    && tar -xzf /opt/${SPACERANGER_TARBALL} \
    && rm /opt/${SPACERANGER_TARBALL}

ENV PATH="/opt/spaceranger-${SPACERANGER_VERSION}:$PATH"

# WORKDIR /data

# # Good default: show version/help when container starts
# ENTRYPOINT ["spaceranger"]
# CMD ["--help"]