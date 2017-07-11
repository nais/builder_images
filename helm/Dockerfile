FROM centos:latest
MAINTAINER Johnny Horvi <johnny.horvi@gmail.com>

ENV VERSION 2.5.0

RUN yum install -y wget

RUN curl http://storage.googleapis.com/kubernetes-helm/helm-v${VERSION}-linux-amd64.tar.gz | \
    tar xzf - -C /tmp && \
    cp /tmp/linux-amd64/helm /bin && \ 
    rm -rf /tmp/linux-amd64

RUN /bin/helm init --client-only && /bin/helm repo update 

RUN curl -L https://github.com/app-registry/appr-helm-plugin/releases/download/v0.5.1/registry-helm-plugin.tar.gz | \
    tar xzf - -C /root/.helm/plugins && \
    /bin/helm registry -h 

ENTRYPOINT ["/bin/helm"]
