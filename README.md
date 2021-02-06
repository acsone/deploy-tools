# ACSONE deploy-tools

[![Docker Repository on Quay](https://quay.io/repository/acsone/deploy-tools/status "Docker Repository on Quay")](https://quay.io/repository/acsone/deploy-tools)

A container image with useful tools to automate deployments.

- [bash](https://linux.die.net/man/1/bash)
- [python3](https://www.python.org/doc/), >3.8, when bash is not enough
- [curl](https://linux.die.net/man/1/curl)
- [envsubst](https://linux.die.net/man/1/envsubst)
- [helm](https://helm.sh/)
- [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/)
- [rsync](https://linux.die.net/man/1/rsync)
- openssh-client: [ssh](https://linux.die.net/man/1/ssh), [ssh-agent](https://linux.die.net/man/1/ssh-agent), [sftp](https://linux.die.net/man/1/sftp), ...
- gnupg: [gpg](https://linux.die.net/man/1/gpg), ...
- [salt-ssh](https://docs.saltproject.io/en/latest/topics/ssh/)

It is based on Ubuntu 20.04 as base, but don't rely on it and if you do, be
extra sure to pin a tag.

It starts as user 0.
