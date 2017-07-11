FROM alpine:latest
MAINTAINER Johnny Horvi <johnny.horvi@gmail.com>

RUN apk add --update --no-cache ca-certificates git curl

ENV VERSION 2.5.0

RUN curl http://storage.googleapis.com/kubernetes-helm/helm-v${VERSION}-linux-amd64.tar.gz | \
    tar xzf - -C /tmp && \
    cp /tmp/linux-amd64/helm /bin && \ 
    rm -rf /tmp/linux-amd64

RUN /bin/helm init --client-only && /bin/helm repo update 

ENTRYPOINT ["/bin/helm"]
