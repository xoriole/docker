FROM triblercore/python3:18.04

RUN apt update

RUN apt install -y wget

RUN wget https://dl.bintray.com/boostorg/release/1.73.0/source/boost_1_73_0.tar.gz

RUN tar -xf boost_1_73_0.tar.gz

RUN cd boost_1_73_0 && ./bootstrap.sh

RUN cd /boost_1_73_0 && ./b2 install
