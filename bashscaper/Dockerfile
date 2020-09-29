FROM alpine:3.12.0

WORKDIR /root

RUN apk upgrade --update && \
    apk add bash curl ca-certificates

ENV HELM_VERSION="v3.3.0"
ENV KUBECTL_VERSION="1.18.6"
ENV YQ_VERSION="3.3.2"
ENV JQ_VERSION="1.6"

RUN curl -s https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz | \
    tar -xz -C /tmp && \
    mv /tmp/linux-amd64/helm /usr/bin

RUN curl -s https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/bin/kubectl && \
    chmod +x /usr/bin/kubectl

RUN curl -Ls https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64 -o /usr/bin/yq && \
    chmod +x /usr/bin/yq

RUN curl -Ls https://github.com/stedolan/jq/releases/download/jq-${JQ_VERSION}/jq-linux64 -o /usr/bin/jq && \
    chmod +x /usr/bin/jq

RUN mkdir -v -p /root/.kube && \
    /usr/bin/helm repo add stable https://kubernetes-charts.storage.googleapis.com/ && \
    /usr/bin/helm repo add nais https://nais.io/charts/ && \
    /usr/bin/helm repo add svc-cat https://svc-catalog-charts.storage.googleapis.com && \
    /usr/bin/helm repo add snyk-charts https://snyk.github.io/kubernetes-monitor/

# NAV specific proxy setup. Could be injected during docker run, but we have to add trust to the
# proxy certificate anyway.
COPY webproxy.nav.no.cer /usr/local/share/ca-certificates/
RUN update-ca-certificates 
ENV HTTPS_PROXY=http://webproxy-utvikler.nav.no:8088 
ENV NO_PROXY="localhost,127.0.0.1,.local,.adeo.no,.nav.no,.aetat.no,.devillo.no,.oera.no,.dev-fss.nais.io,.dev-sbs.nais.io,.prod-fss.nais.io,.prod-sbs.nais.io,155.55.190.30,155.55.190.31,knada.nais.io"

COPY bashscaper /usr/bin/

CMD bash
