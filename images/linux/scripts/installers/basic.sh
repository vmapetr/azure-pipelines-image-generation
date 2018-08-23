#!/bin/bash
################################################################################
##  File:  basic.sh
##  Team:  CI-Platform
##  Desc:  Installs basic command line utilities
################################################################################

## Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh
source $HELPER_SCRIPTS/apt.sh

# Install basic command-line utilities
apt-get install -y --no-install-recommends \
    curl \
    dnsutils \
    file \
    ftp \
    iproute2 \
    iputils-ping \
    jq \
    libcurl3 \
    libicu55 \
    libunwind8 \
    locales \
    netcat \
    openssh-client \
    rsync \
    shellcheck \
    sudo \
    telnet \
    time \
    unzip \
    wget \
    zip \
    tzdata

## Document what was added to the image
echo "Lastly, documenting what we added to the metadata file"
DocumentInstalledItem "Basic CLI"
