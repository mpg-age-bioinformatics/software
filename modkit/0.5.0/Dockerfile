#as Modkit is rust-based
FROM rust:1.70-slim AS builder

WORKDIR /workspace

RUN apt-get update && \
    apt-get install -y --no-install-recommends git build-essential pkg-config libssl-dev && \
    git clone --branch v0.5.0 https://github.com/nanoporetech/modkit.git . && \
    cargo build --release

# now smaller image in which we can run modkit
FROM debian:bookworm-slim

LABEL maintainer="bioinformatics@age.mpg.de"
LABEL license="MPL-2.0"

COPY --from=builder /workspace/target/release/modkit /usr/local/bin/modkit

