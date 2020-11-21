FROM python:3.8-buster

RUN apt update && apt upgrade -y
RUN apt install -y libsodium23 git

# Clone the Tribler repo and install pip packages
RUN git clone --single-branch --depth 1 https://github.com/Tribler/py-ipv8.git ipv8
RUN pip3 install -r /ipv8/requirements.txt

ENV PYTHONPATH=/ipv8
ENTRYPOINT ["python3", "/ipv8/scripts/tracker_plugin.py"]
CMD ["--listen_port=6527"]