#!/bin/bash
################################################################################
##  File:  powershellcore.sh
##  Team:  CI-Platform
##  Desc:  Installs powershellcore
################################################################################

## Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

LSB_RELEASE=$(lsb_release -rs)

# Install Powershell Core
# Not yet in bionic packages
# apt-get install -y --no-install-recommends powershell

curl -L -o /tmp/powershell.tar.gz https://github.com/PowerShell/PowerShell/releases/download/v6.0.2/powershell-6.0.2-linux-x64.tar.gz
mkdir -p /usr/local/powershell/6.0.2
tar zxf /tmp/powershell.tar.gz -C /usr/local/powershell/6.0.2/
chmod +x /usr/local/powershell/6.0.2/pwsh
ln -s /usr/local/powershell/6.0.2/pwsh /usr/bin/pwsh

## Document what was added to the image
echo "Lastly, documenting what we added to the metadata file"
DocumentInstalledItem "Powershell core"
