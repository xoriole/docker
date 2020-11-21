FROM ubuntu:18.04

RUN apt update && apt upgrade -y

RUN apt-get install -y wget libssl-dev libsodium23 software-properties-common
RUN add-apt-repository -y ppa:deadsnakes/ppa
RUN apt install -y build-essential python3.8 python3.8-venv python3.8-dev virtualenv
RUN apt install -y curl && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3.8 get-pip.py
RUN python3.8 -m pip install pyinstaller
RUN apt install -y unzip

RUN useradd -ms /bin/bash jenkins
USER jenkins
WORKDIR /home/jenkins

RUN virtualenv --python=/usr/bin/python3.8 venv
RUN mkdir /home/jenkins/venv/src
#RUN cd /venv/src && wget https://dl.bintray.com/boostorg/release/1.73.0/source/boost_1_73_0.tar.gz && tar -xzvf boost_1_73_0.tar.gz
#RUN /bin/bash -c "source /venv/bin/activate" && cd /venv/src/boost_1_73_0 && ./bootstrap.sh && ./b2 -j8 --prefix=/venv && ./b2 install && ./b2 -j8 --prefix=/venv install

RUN cd /home/jenkins/venv/src && wget https://dl.bintray.com/boostorg/release/1.68.0/source/boost_1_68_0.tar.gz && tar -xzvf boost_1_68_0.tar.gz
RUN /bin/bash -c "source /home/jenkins/venv/bin/activate" && cd /home/jenkins/venv/src/boost_1_68_0 && ./bootstrap.sh && ./b2 -j8 --prefix=/home/jenkins/venv install

ENV LD_LIBRARY_PATH=/home/jenkins/venv/lib
#RUN cd /venv/src && wget https://github.com/arvidn/libtorrent/releases/download/libtorrent_1_2_7/libtorrent-rasterbar-1.2.7.tar.gz && tar -xzvf libtorrent-rasterbar-1.2.7.tar.gz
RUN cd /home/jenkins/venv/src && wget https://github.com/xoriole/libtorrent/releases/download/1.2.7-x/libtorrent-rasterbar-1.2.7.zip && unzip libtorrent-rasterbar-1.2.7.zip
RUN /bin/bash -c "source /home/jenkins/venv/bin/activate" && cd /home/jenkins/venv/src/libtorrent-rasterbar-1.2.7 && ./configure --enable-python-binding --prefix=/home/jenkins/venv --with-boost=/home/jenkins/venv && make install -j8





# Required for building from repo source
#RUN apt install -y git autoconf libtool-bin
#ARG BOOST_ZIP=https://sourceforge.net/projects/boost/files/boost/1.73.0/boost_1_73_0.tar.gz
#RUN wget ${BOOST_ZIP} && tar -xf boost_1_73_0.tar.gz
#RUN cd /boost_1_73_0/tools/build && ./bootstrap.sh && cp b2 /usr/bin
#
#ENV BOOST_ROOT=/boost_1_73_0
#ENV BOOST_BUILD_PATH=/boost_1_73_0/tools/build
#
#ARG RELEASE_ZIP=https://github.com/xoriole/libtorrent/releases/download/1.2.7-x/libtorrent-rasterbar-1.2.7.zip
#RUN apt install -y unzip
#RUN mkdir /libtorrent && cd /libtorrent \
#    && wget  ${RELEASE_ZIP}\
#    && unzip libtorrent-rasterbar-1.2.7.zip
#
#RUN cd /libtorrent/libtorrent-rasterbar-1.2.7 \
#    && ./configure --enable-python-binding --with-libiconv \
#    && make -j$(nproc)
#
#RUN cd /libtorrent/libtorrent-rasterbar-1.2.7 && make install && ldconfig
#RUN cd /libtorrent/libtorrent-rasterbar-1.2.7/bindings/python && python3 setup.py build && python3 setup.py install