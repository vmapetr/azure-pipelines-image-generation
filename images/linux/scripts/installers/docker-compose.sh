#!/bin/bash
################################################################################
##  File:  docker-compose.sh
##  Team:  CI-Platform
##  Desc:  Installs Docker Compose
################################################################################

source $HELPER_SCRIPTS/apt.sh
source $HELPER_SCRIPTS/document.sh

docker_compose_package=docker-compose

LSB_CODENAME=$(lsb_release -cs)

## Check to see if docker-compose is already installed
echo "Determing if Docker (${docker_compose_package}) is installed"
if ! IsInstalled ${docker_compose_package}; then
    echo "Docker (${docker_compose_package}) was not found. Installing..."
    apt-get install -y --no-install-recommends ${docker_compose_package}
else
    echo "Docker (${docker_compose_package}) is already installed"
fi

## Run tests to determine that the software installed as expected
echo "Testing to make sure that script performed as expected, and basic scenarios work"
if ! command -v docker-compose; then
    echo "docker-compose was not installed"
    exit 1
fi

## Add version information to the metadata file
echo "Documenting Docker Compose version"
docker-compose_version=$(docker-compose -v)
DocumentInstalledItem "Docker (${docker-compose_version})"
