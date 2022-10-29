FROM debian:bullseye

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        wget \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN wget -P /tmp/ https://musl.cc/armv7l-linux-musleabihf-cross.tgz \
 && tar -xvf /tmp/armv7l-linux-musleabihf-cross.tgz -C /tmp/ \
 && mkdir /opt/cross \
 && mv /tmp/armv7l-linux-musleabihf-cross /opt/cross/ \
 && rm /tmp/armv7l-linux-musleabihf-cross.tgz

ENV PATH="/opt/cross/armv7l-linux-musleabihf-cross/bin/:$PATH"
