#!/bin/bash

function usage() {
    echo "Usage: build.sh REGISTRY"
}

registry="$1"

if [ -z "$registry" ]; then
    usage
    exit 1
fi

docker build -t base/stretch base/stretch

docker build -t "$registry"/dotnetcore/stretch/x86_64:2.1 dotnetcore/2.1/stretch/x86_64
docker build -t "$registry"/node8-typescript/stretch/x86_64 node8-typescript/stretch/x86_64

docker push "$registry"/node8-typescript/stretch/x86_64
docker push "$registry"/dotnetcore/stretch/x86_64:2.1
