#!/bin/bash
################################################################################
##  File:  java-tools.sh
##  Team:  CI-Platform
##  Desc:  Installs Java and related tooling (Ant, Gradle, Maven)
################################################################################

## Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

# Install JDK(s)
apt-add-repository -y ppa:openjdk-r/ppa
apt-get update
# apt-get install -y --no-install-recommends openjdk-7-jdk
apt-get install -y --no-install-recommends openjdk-8-jdk

echo "JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" | tee -a /etc/environment

# Install Java tools
apt-get install -y --no-install-recommends ant ant-optional
curl -sL https://services.gradle.org/distributions/gradle-4.6-bin.zip -o gradle-4.6.zip \
    && unzip -d /usr/share gradle-4.6.zip \
    && ln -s /usr/share/gradle-4.6/bin/gradle /usr/bin/gradle \
    && rm gradle-4.6.zip
apt-get install -y --no-install-recommends maven

echo "ANT_HOME=/usr/share/ant" | tee -a /etc/environment
echo "GRADLE_HOME=/usr/share/gradle" | tee -a /etc/environment
echo "M2_HOME=/usr/share/maven" | tee -a /etc/environment

## Document what was added to the image
echo "Lastly, documenting what we added to the metadata file"
DocumentInstalledItem "OpenJDK (8)"
DocumentInstalledItem "Ant ($(ant -version))"
DocumentInstalledItem "Gradle 4.6"
DocumentInstalledItem "Maven ($(mvn -version | head -n 1))"
