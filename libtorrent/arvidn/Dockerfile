FROM ubuntu:latest

RUN apt update && apt upgrade -y

RUN apt-get install -y wget build-essential checkinstall libboost-system-dev \
    libboost-python-dev libboost-chrono-dev libboost-random-dev libssl-dev

ARG RELEASE_ZIP=https://github.com/arvidn/libtorrent/releases/download/libtorrent-1.2.10/libtorrent-rasterbar-1.2.10.tar.gz

RUN mkdir libtorrent && cd libtorrent \
    && wget  ${RELEASE_ZIP}\
    && tar -zxvf libtorrent-rasterbar-1.2.10.tar.gz \
    && cd /libtorrent/libtorrent-rasterbar-1.2.10 \
    && ./configure --enable-python-binding --with-libiconv \
    && make -j$(nproc) \
    && checkinstall -D -y \
    && ldconfig \
    && rm -rf /libtorrent
