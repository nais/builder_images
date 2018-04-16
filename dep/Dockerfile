FROM golang:1.10.1-alpine

RUN apk upgrade --update && \
    apk add bash curl git mercurial subversion bzr ca-certificates

RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

CMD bash

WORKDIR /root
