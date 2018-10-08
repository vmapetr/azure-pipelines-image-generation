FROM debian:stretch-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install apt-utils -y

RUN apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    curl \
#   39 MB
#   dnsutils \
    file \
    ftp \
    git \
    gnupg \
    iproute2 \
    iputils-ping \
    locales \
    lsb-release \
    sudo \
    time \
    unzip \
    wget \
    zip \
&& rm -rf /var/lib/apt/lists/*

# 205 MB

# Setup the locale
# https://superuser.com/questions/885170/locales-broken-on-beaglebone-black-running-debian
# ENV LANG en_US.UTF-8
# ENV LC_ALL $LANG
# ENV LANGUAGE $LANG
# RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
# RUN ln -s /etc/locale.alias /usr/share/locale/locale.alias
# RUN locale-gen
# RUN dpkg-reconfigure locales

# ENV LANG en_US.UTF-8
# ENV LC_ALL $LANG
# ENV LANGUAGE $LANG
# RUN locale-gen $LANG \
#  && update-locale

# Install essential build tools
# RUN apt-get update \
#  && apt-get install -y --no-install-recommends \
#     build-essential \
#  && rm -rf /var/lib/apt/lists/*

# # install docker cli
# #  169 MB (374)
ENV DOCKER_VERSION 18.03.1-ce
RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_VERSION.tgz \
    && tar --strip-components=1 -xvzf docker-18.03.1-ce.tgz -C /usr/local/bin
RUN rm docker-$DOCKER_VERSION.tgz

# Install kubectl
# Note: Latest version may be found on:
# https://aur.archlinux.org/packages/kubectl-bin/
ENV KUBE_VERSION 1.6.4
RUN curl -fsSLO https://storage.googleapis.com/kubernetes-release/release/v$KUBE_VERSION/bin/linux/amd64/kubectl
RUN cp kubectl /usr/local/bin
RUN rm kubectl

# RUN curl -L https://packages.microsoft.com/keys/microsoft.asc

# ~300MB
# # Install Azure CLI (instructions taken from https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
# RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" \
#   | sudo tee /etc/apt/sources.list.d/azure-cli.list

# RUN cat /etc/apt/sources.list.d/azure-cli.list
# RUN curl -L https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add - \
#  && apt-get update \
#  && apt-get install -y --no-install-recommends \
#     apt-transport-https \
#     azure-cli \
#  && rm -rf /var/lib/apt/lists/*
