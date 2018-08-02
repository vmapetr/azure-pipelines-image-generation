#/bin/bash

set -e

CURRENT_TAG=$(cat current.tag)
DOCKER_ORG=bryanmacfarlane
PRODUCT_PREFIX="poc"

BUILD_DIRS=(
    "debian-base" \
    "node8-typescript"
)

function build() {
    echo
    echo "---------------------------------"
    echo "building $1"
    echo "---------------------------------"
    pushd $1 > /dev/null
    echo `pwd`
    echo "docker build -t $DOCKER_ORG/poc-$1:$CURRENT_TAG ."
    popd > /dev/null
}

BUILD_DIR=$1

if [ -n "${BUILD_DIR}" ]; then
    echo "building $BUILD_DIR"
    exit 0;
fi

echo "${BUILD_DIRS[@]}"
for i in "${BUILD_DIRS[@]}"
do
    build $i
done