#!/bin/bash
################################################################################
##  File:  zeit-now.sh
##  Team:  CI-Platform
##  Desc:  Installs the Zeit Now CLI
################################################################################

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

# Install the Zeit Now CLI
curl -sfLS https://zeit.co/download.sh > download.sh
chmod +x ./download.sh
./download.sh --force
rm ./download.sh

# Validate the installation
echo "Validate the installation"
if ! command -v now; then
    echo "Zeit Now CLI was not installed"
    exit 1
fi

# Document the installed version
echo "Document the installed version"
DocumentInstalledItem "Zeit Now CLI ($(now --version))"
