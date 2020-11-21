FROM triblercore/libtorrent:1.2.7-x

# Update the base system and install required system dependencies
RUN apt update && apt upgrade -y
RUN apt install -y libsodium23 python3-pip git

# Install any external dependencies
RUN mkdir /tribler

# Clone the Tribler repo and install pip packages
RUN git clone --recursive https://github.com/tribler/tribler.git /tribler
RUN pip3 install -r /tribler/src/requirements.txt && pip3 install -r /tribler/src/pyipv8/requirements.txt

ENV BUILD_TRIBLER_SNAP=false
RUN pip3 install PyInstaller
RUN cd tribler && ./build/debian/makedist_debian.sh
RUN mkdir /data && cp tribler/*.deb /data