# as Modkit is rust-based
FROM rust:1.88-slim-bookworm AS builder

WORKDIR /workspace

RUN apt-get update && \
    apt-get install -y --no-install-recommends git build-essential pkg-config libssl-dev clang cmake && \
    git clone --branch v0.6.4 https://github.com/nanoporetech/modkit.git . && \
    cargo build --release

# now smaller image in which we can run modkit
FROM debian:bookworm-slim

LABEL maintainer="bioinformatics@age.mpg.de"
LABEL license="MPL-2.0"

COPY --from=builder /workspace/target/release/modkit /usr/local/bin/modkit
