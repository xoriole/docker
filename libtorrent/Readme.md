**About**

This docker image is based on Ubuntu 20.04 (latest) image and includes Python3.8 and Libtorrent 1.2.10. 
This image is used as a base for running Tribler core from the source.

**Build Libtorrent Image**
```
docker build -t triblercore/libtorrent:1.2.10 .
```

**Push Libtorrent image**
```
docker push triblercore/libtorrent:1.2.10
```

**Usage**

To use as base image
```
FROM triblercore/libtorrent:1.2.10
```
To run an interactive console
```
docker run -it triblercore/libtorrent:1.2.10 /bin/bash
```
Libtorrent version
```
docker run -it triblercore/libtorrent:1.2.10 python3 -c 'import libtorrent; print(libtorrent.version)'
```