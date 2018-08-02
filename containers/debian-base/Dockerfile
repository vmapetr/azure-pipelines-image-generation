#-----------------------------------------------------------------------
# In VSTS:
# - build product
# - build container
# - deploy container
#-----------------------------------------------------------------------
# docker build -t bryanmacfarlane/poc-debian-dev:1806 .
# docker run -it bryanmacfarlane/poc-debian-dev bash

# Follow 1801,4,7,10 tag pattern
FROM debian:stretch-slim
# 75 MB

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
ENV LANG en_US.UTF-8
ENV LC_ALL $LANG
ENV LANGUAGE $LANG
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
RUN ln -s /etc/locale.alias /usr/share/locale/locale.alias
RUN locale-gen
RUN dpkg-reconfigure locales

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

#--------------------------
# 75 MB
# Node - use nvm, n needs gmake and other build-essentials
#
# Replace shell with bash so we can source files
# RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# ENV NVM_DIR /usr/local/nvm

# # apt-get updates critical OS security updates

# # put at the end since it's what's going to change alot
# # docker build arg
# ENV NODE_VERSION 8.11.2
# RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash \
#     && source $NVM_DIR/nvm.sh \
#     && nvm install $NODE_VERSION \
#     # && nvm alias default $NODE_VERSION \
#     && nvm use $NODE_VERSION

# # RUN source $NVM_DIR/nvm.sh && nvm current
# # RUN source $NVM_DIR/nvm.sh \
# #     && export NODE_CURR=$(nvm current) > /.nodever \
# #     && echo "ver:${NODE_CURR}"

# # RUN echo "ver2" && cat /.nodever

# ENV NODE_PATH $NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules
# ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# # RUN which npm

# # 45 MB (277)
# RUN npm install typescript -g \
#     # 26 MB (303)
#     && npm install bower -g

# gulp-cli, grunt-cli?

#     # Only 8 MB - include in devdep(311)
#     && npm install gulp -g \
#     # Only 7 MB - include in devdep(318)
#     && npm install grunt -g