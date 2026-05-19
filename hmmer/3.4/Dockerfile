FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        hmmer=3.4+dfsg-2 \
        ca-certificates && \
    apt-mark hold hmmer && \
    rm -rf /var/lib/apt/lists/*