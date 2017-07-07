FROM golang:1.8-alpine

RUN echo '@edge https://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories && \
    echo '@community https://nl.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories && \
    apk upgrade --update && \
    apk add bash curl git mercurial subversion bzr ca-certificates


RUN curl https://glide.sh/get | sh

CMD bash

WORKDIR /root
