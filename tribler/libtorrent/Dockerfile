FROM triblercore/libtorrent:1.2.10-x

# Update the base system and install required system dependencies
RUN apt update && apt upgrade -y
RUN apt install -y libsodium23 python3-pip git

# Install any external dependencies
RUN mkdir /tribler
COPY ./requirements.txt /tribler/requirements.txt
RUN pip3 install -r /tribler/requirements.txt

# Clone the Tribler repo and install pip packages
RUN git clone --recursive --single-branch --depth 1 https://github.com/tribler/tribler.git /tribler/tribler
RUN pip3 install -r /tribler/tribler/src/requirements.txt && pip3 install -r /tribler/tribler/src/pyipv8/requirements.txt

# Expose ports
EXPOSE 7759
EXPOSE 8085

RUN echo "PYTHONPATH=$PYTHONPATH:
# Define the entry point to run
COPY ./run.sh /tribler/tribler/
RUN chmod +x /tribler/tribler/run.sh

ENTRYPOINT /tribler/tribler/run.sh