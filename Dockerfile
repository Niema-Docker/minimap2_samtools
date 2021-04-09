# Minimal Docker image for Minimap2 v2.17 + samtools v1.12 using Minimap2 image base
FROM niemasd/minimap2:latest
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install samtools
RUN apk update && \
    apk add bzip2-dev xz-dev && \
    wget -qO- "https://github.com/samtools/samtools/releases/download/1.12/samtools-1.12.tar.bz2" | tar -xj && \
    cd samtools-1.12 && \
    ./configure --without-curses && \
    make && \
    make install && \
    cd .. && \
    rm -rf samtools-1.12
