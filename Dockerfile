## Base on Ubuntu 20.04
FROM ubuntu:20.04

## Maintainer
MAINTAINER Marco Scholl <develop@marco-scholl.de>

## Arguments
ARG HKKNX_PORT=8080
ARG HKKNX_VERSION=1.1.0

## Environments
ENV HKKNX_PORT=${HKKNX_PORT}
ENV HKKNX_VERSION=${HKKNX_VERSION}
ENV HKKNX_DOWNLOAD=https://github.com/brutella/hkknx-public/releases/download/${HKKNX_VERSION}/hkknx-${HKKNX_VERSION}_linux_amd64.tar.gz

## Download updates & additional packsges
RUN apt-get update && apt-get dist-upgrade -y && apt-get install -y libnss-mdns nano wget

## Instal hkknx
RUN cd /var/tmp && wget ${HKKNX_DOWNLOAD} && tar -xvzf hkknx-${HKKNX_VERSION}_linux_amd64.tar.gz && cp hkknx /usr/bin && mkdir /var/lib/hkknx

## Clenup
RUN apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

## Runtime
VOLUME /var/lib/hkknx
EXPOSE ${HKKNX_PORT}
ENTRYPOINT /usr/bin/hkknx -port $HKKNX_PORT -db /data -autoupdate false
