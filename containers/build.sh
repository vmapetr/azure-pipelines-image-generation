#!/bin/bash

# Build Windows containers
echo "Switching to Windows container daemon"
"$PROGRAMFILES/Docker/Docker/DockerCli.exe" -SwitchWindowsEngine

docker build -t base/servercore-1803 base/servercore-1803
docker build -t azdev.azurecr.io/node8-typescript/servercore-1803/x86_64 node8-typescript/servercore-1803/x86_64

docker push azdev.azurecr.io/node8-typescript/servercore-1803/x86_64

# Linux containers (works on Docker for Windows edge build)
echo "Switching to Linux container daemon"
"$PROGRAMFILES/Docker/Docker/DockerCli.exe" -SwitchLinuxEngine

# --platform might not be required for build
docker build --platform linux -t base/stretch base/stretch
docker build --platform linux -t azdev.azurecr.io/node8-typescript/stretch/x86_64 node8-typescript/stretch/x86_64

docker push azdev.azurecr.io/node8-typescript/stretch/x86_64

# $ docker manifest create --help
# Usage:  docker manifest create MANIFEST_LIST MANIFEST [MANIFEST...]
# Create a local manifest list for annotating and pushing to a registry

# MANIFEST(s) must be pushed to azdev before creating the manifest list

docker manifest create azdev.azurecr.io/node8-typescript azdev.azurecr.io/node8-typescript/stretch/x86_64 azdev.azurecr.io/node8-typescript/servercore-1803/x86_64

docker manifest push azdev.azurecr.io/node8-typescript
