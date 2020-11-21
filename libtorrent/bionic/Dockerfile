FROM triblercore/python3:18.04

RUN apt update && apt upgrade -y

RUN apt-get install -y wget build-essential checkinstall libboost-system-dev \
    libboost-python-dev libboost-chrono-dev libboost-random-dev libssl-dev

# Required for building from repo source
RUN apt install -y git autoconf libtool-bin

ARG GIT_REPO=https://github.com/xoriole/libtorrent
ARG GIT_BRANCH=1.2.7-x
RUN mkdir libtorrent && cd libtorrent \
    && git clone -b ${GIT_BRANCH} --single-branch --depth 1 ${GIT_REPO}\
    && echo `ls` \
    && cd /libtorrent/libtorrent \
    && ./autotool.sh \
    && ./configure --enable-python-binding --with-libiconv \
    && make -j$(nproc)

RUN cd /libtorrent/libtorrent && make install && ldconfig

RUN cd /libtorrent/libtorrent/bindings/python && python3 setup.py build && python3 setup.py install