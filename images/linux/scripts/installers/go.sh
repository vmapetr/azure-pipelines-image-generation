#!/bin/bash
################################################################################
##  File:  go.sh
##  Team:  CI-Platform
##  Desc:  Installs go and configures GOROOT
################################################################################

## Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

VERSION=1.10

# Install Go
curl -sL https://dl.google.com/go/go$VERSION.linux-amd64.tar.gz -o go$VERSION.linux-amd64.tar.gz
mkdir -p /usr/local/go$VERSION
tar -C /usr/local/go$VERSION -xzf go$VERSION.linux-amd64.tar.gz --strip-components=1 go
rm go$VERSION.linux-amd64.tar.gz

echo "GOROOT=/usr/local/go$VERSION" | tee -a /etc/environment

ln -s /usr/local/go$VERSION/bin/* /usr/bin/

## Document what was added to the image
DocumentInstalledItem "Go $VERSION ($(go version))"
