#!/bin/bash
################################################################################
##  File:  mysql.sh
##  Team:  CI-Platform
##  Desc:  Installs MySQL Client
################################################################################

## Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

# Install MySQL Client
apt-get install mysql-client -y

## Run tests to determine that the software installed as expected
echo "Testing to make sure that script performed as expected, and basic scenarios work"
if ! command -v mysql; then
    echo "mysql was not installed"
    return -1
fi

## Document what was added to the image
echo "Lastly, documenting what we added to the metadata file"
DocumentInstalledItem "MySQL ($(mysql --version))"
