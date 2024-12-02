FROM ubuntu

RUN apt-get update && apt-get -yq dist-upgrade && \
  apt-get install -yq wget tar pigz curl bzip2 build-essential

RUN curl -o cellranger-9.0.0.tar.gz "https://cf.10xgenomics.com/releases/cell-exp/cellranger-9.0.0.tar.gz?Expires=1733176930&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA&Signature=eYA9BHbgn8a3nPWbLPougYmBAoy4QAQdbA9YZLSSpOh4kI9QqZVTJMHEL6ssQSF0FWWqt-n0nRnDZj7KeZPvc6c22BMe8B4BMLT44uWraK7~Sk3b36hceFifFKxm9lxXLitjJ4D7ThPChictaZUYHPabhv9Fe1oGpZML88VTCvPEwirJvgwPg4zuGKTg~df5XBEBPxkR3pTb8z1DrWfxg9RcMCc3qaoRi8Tm2l0o985SZtOOAjNHGCxe-wbhO~sRju~HWvqRUWNF-6GiiwkeArrjNEwY1DllHnikCzdVTgqfdjSXfDAnyxAciDontffuRt1nmSFdjD75pMKVBwuCyw__"

RUN tar -xzvf cellranger-9.0.0.tar.gz

ENV PATH="cellranger-9.0.0:${PATH}" 
