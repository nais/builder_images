FROM alpine:3.8

WORKDIR /root

RUN apk upgrade --update && apk add bash curl

ENV YQ_VERSION="2.2.1"

RUN curl -Ls https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64 -o /usr/bin/yq && \
    chmod +x /usr/bin/yq

COPY naiscaper /usr/bin/

CMD bash
