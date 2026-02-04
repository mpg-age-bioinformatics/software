FROM python:3.12-slim-bullseye

RUN apt-get update && apt-get install -y --no-install-recommends \
    git ca-certificates \
    build-essential python3-dev pkg-config \
 && rm -rf /var/lib/apt/lists/*

RUN pip install uv

RUN git clone https://github.com/tleonardi/nanocompore.git

RUN cd nanocompore && git checkout a58bb77 && uv sync && uv run pytest tests && pip3 install .
