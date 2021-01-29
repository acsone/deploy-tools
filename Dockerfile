FROM ubuntu:focal

# useful tools
# - bash
# - curl
# - rsync
# - gettext-base, which provides envsubst
RUN apt-get update && apt-get install -y \
    bash \
    gettext-base \
    curl \
    rsync \
  && rm -fr /var/lib/apt/lists/*

COPY ./install /tmp/install

# kubectl
RUN /tmp/install/get-kubectl

# helm 3
RUN /tmp/install/get-helm-3
