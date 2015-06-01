FROM ubuntu:14.04.2
MAINTAINER Pushkar Modi <pushkar@motorcred.com>

WORKDIR /opt/go/src/github.com/oysterbooks/halfshell
ENV GOPATH /opt/go

RUN apt-get update && apt-get install -qy software-properties-common python-software-properties

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y -q --no-install-recommends \
    build-essential \
    pkg-config \
    git \
    wget \
    libmagickcore-dev \
    libmagickwand-dev \
    imagemagick \
    golang

ADD . /opt/go/src/github.com/oysterbooks/halfshell
RUN cd /opt/go/src/github.com/oysterbooks/halfshell && make deps && make build

ENTRYPOINT ["/opt/go/src/github.com/oysterbooks/halfshell/bin/halfshell", "/opt/go/src/github.com/oysterbooks/halfshell/config.json"]

EXPOSE 8080
