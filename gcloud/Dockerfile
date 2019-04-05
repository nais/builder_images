FROM google/cloud-sdk:241.0.0-slim
ENV KUBECTL_VERSION=v1.14.0
RUN curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl
