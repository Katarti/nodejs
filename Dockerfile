FROM registry.fedoraproject.org/fedora-minimal:34

SHELL ["/bin/bash", "-l", "-c"]

ARG NODE_VERSION=12

ENV npm_config_loglevel warn
ENV npm_config_unsafe_perm true

RUN microdnf install -y fedora-repos-modular-34-2.noarch && \
  microdnf module enable -y nodejs:${NODE_VERSION} && \
  microdnf update -y && \
  microdnf --nodocs -y install \
  autoconf \
  automake \
  bash \
  ca-certificates \
  curl \
  bc \
  gcc-c++ \
  git \
  jq \
  libglvnd-glx \
  file \
  make \
  nodejs \
  postgresql \
  which && \
  microdnf reinstall -y tzdata && \
  microdnf clean all && \
  rm -rf /var/cache/* /var/log/dnf* /var/log/yum.*