#!/bin/bash
################################################################################
##  File:  openjdk.sh
##  Team:  CI-Platform
##  Desc:  Installs openjdk
################################################################################

## Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

apt-add-repository -y ppa:openjdk-r/ppa
apt-get update
# apt-get install -y --no-install-recommends openjdk-7-jdk
apt-get install -y --no-install-recommends openjdk-8-jdk

echo "JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" | tee -a /etc/environment

## Document what was added to the image
echo "Lastly, documenting what we added to the metadata file"
DocumentInstalledItem "OpenJDK (8)"
