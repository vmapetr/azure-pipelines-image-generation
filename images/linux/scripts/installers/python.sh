#!/bin/bash
################################################################################
##  File:  python.sh
##  Team:  CI-Platform
##  Desc:  Installs Python
################################################################################

## Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

# Install Python
apt-get install -y --no-install-recommends python python-pip python3 python3-pip

## Document what was added to the image
echo "Lastly, documenting what we added to the metadata file"
DocumentInstalledItem "Python ($(python --version 2>&1))"
DocumentInstalledItem "pip ($(pip --version))"
DocumentInstalledItem "Python3 ($(python3 --version))"
DocumentInstalledItem "pip3 ($(pip3 --version))"
