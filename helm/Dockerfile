FROM alpine:3.8

RUN apk upgrade --update && \
    apk add bash curl

ENV HELM_VERSION="v2.10.0"
ENV HELM_PLUGIN_VERSION="v0.7.0"

CMD bash

RUN curl -Ls https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz | \
    tar -xz -C /tmp && \
    mv /tmp/linux-amd64/helm /usr/bin

RUN /usr/bin/helm init --client-only && \
    /usr/bin/helm repo update

RUN curl -Ls https://github.com/app-registry/appr-helm-plugin/releases/download/${HELM_PLUGIN_VERSION}/helm-registry_linux.tar.gz | \
    tar -xz -C /root/.helm/plugins && \
    /usr/bin/helm registry -h

RUN /usr/bin/helm repo add nais https://nais.github.io/charts

ENTRYPOINT ["/usr/bin/helm"]
