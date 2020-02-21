FROM hashicorp/terraform:0.12.19
ENV CLOUD_SDK_VERSION=278.0.0
ENV KUBECTL_VERSION=v1.15.4
ENV YQ_VERSION="2.2.1"

RUN apk --no-cache --update add bash curl python jq python3

RUN curl -Ls https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64 -o /usr/bin/yq && \
    chmod +x /usr/bin/yq

ENV PATH /google-cloud-sdk/bin:$PATH
RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
      tar xzf google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
      rm google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
      ln -s /lib /lib64 && \
      gcloud config set core/disable_usage_reporting true && \
      gcloud config set component_manager/disable_update_check true && \
      gcloud config set metrics/environment github_docker_image && \
      gcloud components install beta && \
      gcloud --version

RUN curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl

VOLUME ["/root/.config"]
