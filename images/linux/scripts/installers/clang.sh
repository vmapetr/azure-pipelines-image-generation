 #!/bin/bash
################################################################################
##  File:  example.sh
##  Team:  CI-Platform
##  Desc:  This is an example script that can be copied to add a new software
##         installer to the image
################################################################################

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh
source $HELPER_SCRIPTS/apt.sh

wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
apt-add-repository "deb http://apt.llvm.org/$(lsb_release -cs)/ llvm-toolchain-$(lsb_release -cs)-6.0 main"
apt-get update

# LLVM
apt-get install libllvm-6.0-ocaml-dev libllvm6.0 llvm-6.0 llvm-6.0-dev llvm-6.0-doc llvm-6.0-examples llvm-6.0-runtime
# Clang and co
apt-get install clang-6.0 clang-tools-6.0 clang-6.0-doc libclang-common-6.0-dev libclang-6.0-dev libclang1-6.0 clang-format-6.0 python-clang-6.0
# libfuzzer
apt-get install libfuzzer-6.0-dev
# lldb
apt-get install lldb-6.0
# lld
apt-get install lld-6.0

update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-6.0 100
update-alternatives --install /usr/bin/clang clang /usr/bin/clang-6.0 100

# Run tests to determine that the software installed as expected
echo "Testing to make sure that script performed as expected, and basic scenarios work"
for cmd in clang clang++ clang-6.0 clang++-6.0; do
    if ! command -v $cmd; then
        echo "$cmd was not installed"
        exit 1
    fi
done

# Document what was added to the image
echo "Lastly, documenting what we added to the metadata file"
DocumentInstalledItem "Clang 6.0 ($(clang-6.0 --version))"
