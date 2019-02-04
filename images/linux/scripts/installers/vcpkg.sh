#!/bin/bash
################################################################################
##  File:  vcpkg.sh
##  Team:  CI-Platform
##  Desc:  Installs vcpkg
################################################################################

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

VCPKG_BIN=/usr/local/share/vcpkg

# Install GNU C++ compiler
add-apt-repository ppa:ubuntu-toolchain-r/test -y
apt-get update -y
apt-get install g++-7 -y

# Install vcpkg
git clone --depth=1 https://github.com/Microsoft/vcpkg $VCPKG_BIN
chmod 0755 $VCPKG_BIN
$VCPKG_BIN/bootstrap-vcpkg.sh
$VCPKG_BIN/vcpkg integrate install
ln -sf /usr/local/share/vcpkg/vcpkg /usr/local/bin

# Run tests to determine that the software installed as expected
echo "Testing to make sure that script performed as expected, and basic scenarios work"
if ! command -v vcpkg; then
    echo "vcpkg was not installed"
    exit 1
fi

# Document what was added to the image
echo "Lastly, documenting what we added to the metadata file"
DocumentInstalledItem "Vcpkg $(vcpkg version | head -n 1 | cut -d ' ' -f 6)"