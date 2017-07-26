FROM alpine

RUN echo '@edge https://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories && \
    echo '@community https://nl.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories && \
    apk upgrade --update && \
    apk add bash curl ca-certificates

ENV HELM_VERSION="v2.5.0"


RUN curl -s https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz | tar -xz -C /tmp && mv /tmp/linux-amd64/helm /usr/bin
RUN curl -s https://storage.googleapis.com/kubernetes-release/release/v1.6.6/bin/linux/amd64/kubectl > /usr/bin/kubectl && chmod +x /usr/bin/kubectl
RUN curl -Ls https://github.com/Eneco/landscaper/releases/download/1.0.8/landscaper-1.0.8-linux-amd64.tar.gz | tar xzf - -C /usr/bin landscaper && chmod +x /usr/bin/landscaper

RUN /usr/bin/helm init --client-only && \
    mkdir -v -p /root/.kube && \
	/usr/bin/helm repo add nais https://nais.github.io/charts

# NAV specific proxy setup. Could be injected during docker run, but we have to add trust to the
# proxy certificate anyway.
COPY webproxy.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates 
ENV HTTPS_PROXY=http://webproxy-utvikler.nav.no:8088 
ENV NO_PROXY="localhost,127.0.0.1,.local,.adeo.no,.nav.no,.aetat.no,.devillo.no,.oera.no"

CMD bash

WORKDIR /root
