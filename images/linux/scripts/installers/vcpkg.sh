#!/bin/bash
################################################################################
##  File:  vcpkg.sh
##  Team:  CI-Platform
##  Desc:  Installs VCPKG
################################################################################

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

git clone --depth=1 https://github.com/Microsoft/vcpkg
vcpkg/bootstrap-vcpkg.sh
vcpkg/vcpkg integrate install

echo "export PATH=$PATH:$(pwd)/vcpkg" >> ~/.bashrc
source ~/.bashrc

# Document what was added to the image
echo "Lastly, documenting what we added to the metadata file"
DocumentInstalledItem "$(vcpkg version | head -n 1)"