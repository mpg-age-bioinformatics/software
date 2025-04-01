FROM perl:latest

# Install required dependencies
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    python3 \
    python3-pip \
    samtools \
    bcftools \
    htslib \
    ensembl-vep

# Install mamba to handle conda-based dependencies
RUN curl -sL https://github.com/mamba-org/mamba/releases/download/0.29.0/mamba-linux-64.sh -o /usr/local/bin/mamba && \
    chmod +x /usr/local/bin/mamba

# Install other dependencies via mamba/conda
RUN mamba install -y -c bioconda \
    vcf2maf

# Download the specific version of vcf2maf.pl (v1.6.21)
RUN curl -L -o /opt/vcf2maf.pl https://raw.githubusercontent.com/mskcc/vcf2maf/v1.6.21/vcf2maf.pl

# Set the executable permission for the vcf2maf.pl script
RUN chmod +x /opt/vcf2maf.pl

# Set the working directory to /opt
WORKDIR /opt
