# Use the PolyA-miner image as the base
FROM mpgagebioinformatics/polyaminer:ad9dcff

# Debian buster is EOL → use archive mirror so apt works
RUN sed -i 's|deb.debian.org|archive.debian.org|g' /etc/apt/sources.list \
 && sed -i 's|security.debian.org|archive.debian.org|g' /etc/apt/sources.list \
 && apt-get -o Acquire::Check-Valid-Until=false update

RUN apt-get -o Acquire::Check-Valid-Until=false install -y --no-install-recommends \
      fastp \
      bowtie2 \
      samtools \
      pigz \
      subread \
      r-base \
 && rm -rf /var/lib/apt/lists/*
