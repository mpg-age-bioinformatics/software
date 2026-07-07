FROM lpryszcz/seqtagger:2.0a

LABEL maintainer="bioinformatics@age.mpg.de"
LABEL org.opencontainers.image.source="https://github.com/novoalab/SeqTagger"
LABEL org.opencontainers.image.revision="c9b2a2221dd2151bbb8b31b011c93f4e040efc15"

ARG SEQTAGGER_COMMIT=c9b2a2221dd2151bbb8b31b011c93f4e040efc15

WORKDIR /opt

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates curl tar && \
    curl -fsSL https://github.com/novoalab/SeqTagger/archive/${SEQTAGGER_COMMIT}.tar.gz | tar -xz && \
    rm -rf SeqTagger && \
    mv SeqTagger-${SEQTAGGER_COMMIT} SeqTagger && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ENV PYTHONPATH="/opt/SeqTagger:${PYTHONPATH}"
ENV PATH="/opt/SeqTagger:/opt/SeqTagger/bonito/cli:${PATH}"
