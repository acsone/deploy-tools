FROM ubuntu:focal

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    DEBIAN_FRONTEND=noninteractive

# useful tools
# - bash
# - curl
# - rsync
# - gettext-base, which provides envsubst
# - git
# - unzip
# - jq
# - postgresql-client
# - pg-activity
RUN apt-get update && apt-get install -y \
    apache2-utils \
    bash \
    gettext-base \
    gnupg \
    curl \
    rsync \
    openssh-client \
    git \
    zip \
    unzip \
    jq \
    python3-pip \
    python3-psycopg2 \
    && apt -y install --no-install-recommends postgresql-client \
    && apt -y clean \
    && rm -rf /var/lib/apt/lists/* \
    && python3 -m pip install pg-activity

# kubectl
COPY install/get-kubectl /tmp
RUN /tmp/get-kubectl

# kustomize
COPY install/get-kustomize /tmp
RUN /tmp/get-kustomize /usr/local/bin

# helm 3
COPY install/get-helm-3 /tmp
RUN /tmp/get-helm-3

# salt-ssh
COPY install/get-salt /tmp
RUN /tmp/get-salt

COPY config/99-acsone.conf /etc/ssh/ssh_config.d/
RUN chmod og-rw /etc/ssh/ssh_config.d/99-acsone.conf
