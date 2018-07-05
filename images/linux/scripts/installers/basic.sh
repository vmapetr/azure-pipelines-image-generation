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
    locales \
    openssh-client \
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
