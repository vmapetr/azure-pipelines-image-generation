#!/bin/bash
################################################################################
##  File:  leiningen.sh
##  Team:  CI-Platform
##  Desc:  Installs Leiningen
################################################################################

## Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

echo "LEIN_HOME=/usr/local/.lein" | tee -a /etc/environment
curl -s https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > /usr/local/bin/lein \
  && chmod 0755 /usr/local/bin/lein
LEIN_HOME=/usr/local/.lein lein

## Run tests to determine that the software installed as expected
echo "Testing to make sure that script performed as expected, and basic scenarios work"
if ! command -v lein; then
    echo "lein was not installed"
    exit 1
fi

## Document what was added to the image
echo "Lastly, documenting what we added to the metadata file"
DocumentInstalledItem "Leiningen version ($(lein -v))"
