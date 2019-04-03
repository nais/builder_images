FROM hashicorp/terraform:0.11.13
ENV CLOUD_SDK_VERSION=240.0.0
ENV KUBECTL_VERSION=v1.14.0

RUN apk --no-cache --update add bash curl python jq

ENV PATH /google-cloud-sdk/bin:$PATH
RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
      tar xzf google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
      rm google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
      ln -s /lib /lib64 && \
      gcloud config set core/disable_usage_reporting true && \
      gcloud config set component_manager/disable_update_check true && \
      gcloud config set metrics/environment github_docker_image && \
      gcloud --version

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl

VOLUME ["/root/.config"]
