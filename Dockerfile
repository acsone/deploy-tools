FROM ubuntu:jammy

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
RUN apt-get update && apt-get -y install --no-install-recommends \
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
    python3-jinja2 \
    python3-psycopg2 \
    postgresql-client \
    skopeo \
    awscli \
    && apt -y clean \
    && rm -rf /var/lib/apt/lists/* \
    && python3 -m pip install pg-activity

# kubectl
COPY install/get-kubectl /tmp
RUN /tmp/get-kubectl

# buildctl
COPY install/get-buildctl /tmp
RUN /tmp/get-buildctl

# kustomize
COPY install/get-kustomize /tmp
RUN /tmp/get-kustomize /usr/local/bin

# helm 3
COPY install/get-helm-3 /tmp
RUN /tmp/get-helm-3

# salt-ssh
COPY install/get-salt /tmp
RUN /tmp/get-salt

# unison
COPY install/get-unison /tmp
RUN /tmp/get-unison

# rclone
COPY install/get-rclone /tmp
RUN /tmp/get-rclone

COPY config/99-acsone.conf /etc/ssh/ssh_config.d/
RUN chmod og-rw /etc/ssh/ssh_config.d/99-acsone.conf
