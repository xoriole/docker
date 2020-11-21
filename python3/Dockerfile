FROM ubuntu:18.04

RUN apt update

RUN apt-get install -y build-essential zlib1g-dev libncurses5-dev \
    libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev

RUN wget https://www.python.org/ftp/python/3.8.6/Python-3.8.6.tgz && tar -xf Python-3.8.6.tgz

RUN cd Python-3.8.6 && ./configure --enable-optimizations && make -j$(nproc) && make install

RUN apt install -y curl && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py