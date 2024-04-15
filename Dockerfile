# Minimal Docker image for Minimap2 + samtools using Minimap2 image base
FROM niemasd/minimap2:2.22
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install samtools
RUN apk update && \
    apk add bash bzip2-dev xz-dev && \
    wget -qO- "https://github.com/samtools/samtools/releases/download/1.20/samtools-1.20.tar.bz2" | tar -xj && \
    cd samtools-* && \
    ./configure --without-curses && \
    make && \
    make install && \
    cd .. && \
    rm -rf samtools-*
