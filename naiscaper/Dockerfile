FROM alpine:3.7

RUN apk upgrade --update && \
    apk add bash curl ca-certificates

ENV HELM_VERSION="v2.9.1"
ENV LANDSCAPER_VERSION="1.0.14"
ENV KUBECTL_VERSION="1.9.2"
ENV YQ_VERSION="1.14.0"

RUN curl -s https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz | \
    tar -xz -C /tmp && \
    mv /tmp/linux-amd64/helm /usr/bin

RUN curl -s https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl > /usr/bin/kubectl && \
    chmod +x /usr/bin/kubectl

RUN curl -Ls https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64 > /usr/bin/yq && \
    chmod +x /usr/bin/yq

RUN curl -Ls https://github.com/Eneco/landscaper/releases/download/v${LANDSCAPER_VERSION}/landscaper-${LANDSCAPER_VERSION}-linux-amd64.tar.gz | \
    tar xzf - -C /usr/bin landscaper && \
    chmod +x /usr/bin/landscaper

RUN /usr/bin/helm init --client-only && \
    mkdir -v -p /root/.kube && \
    /usr/bin/helm repo add nais https://nais.github.io/charts

# NAV specific proxy setup. Could be injected during docker run, but we have to add trust to the
# proxy certificate anyway.
COPY webproxy.nav.no.cer /usr/local/share/ca-certificates/
RUN update-ca-certificates 
ENV HTTPS_PROXY=http://webproxy-utvikler.nav.no:8088 
ENV NO_PROXY="localhost,127.0.0.1,.local,.adeo.no,.nav.no,.aetat.no,.devillo.no,.oera.no"

COPY naiscaper /usr/bin/

CMD bash

WORKDIR /root
