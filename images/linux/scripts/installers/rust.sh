#!/bin/bash
################################################################################
##  File:  rust.sh
##  Team:  CI-Platform
##  Desc:  Installs Rust and its common tools
################################################################################

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh
source $HELPER_SCRIPTS/apt.sh

# Install the latest 'stable' toolchain of Rust
# See https://rustup.rs/# and https://github.com/rust-lang/rustup.rs
curl https://sh.rustup.rs -sSf | sh -s -- -y

# Add Rust to the path of this shell instance
source $HOME/.cargo/env

# Install common tools
rustup component add rustfmt
rustup component add clippy
cargo install bindgen
cargo install cbindgen

# Test that the software installed as expected
echo "Test installation of the Rust toochain"
for cmd in bindgen cargo cargo-clippy cargo-fmt cbindgen rustc rustdoc rustfmt rustup; do
    if ! command -v $cmd --version; then
        echo "$cmd was not installed or is not found on the path"
        exit 1
    fi
done

# Document what was added to the image
echo "Lastly, document what was added to the metadata file"
DocumentInstalledItem "Rust ($(rustc --version 2>&1 | cut -d ' ' -f 2))"
DocumentInstalledItem "bindgen ($(bindgen --version 2>&1 | cut -d ' ' -f 2))"
DocumentInstalledItem "cargo ($(cargo --version 2>&1 | cut -d ' ' -f 2))"
DocumentInstalledItem "cbindgen ($(cbindgen --version 2>&1 | cut -d ' ' -f 2))"
DocumentInstalledItem "clippy ($(cargo-clippy --version 2>&1 | cut -d ' ' -f 2))"
DocumentInstalledItem "rustdoc ($(rustdoc --version 2>&1 | cut -d ' ' -f 2))"
DocumentInstalledItem "rustfmt ($(rustfmt --version 2>&1 | cut -d ' ' -f 2))"
DocumentInstalledItem "rustup ($(rustup --version 2>&1 | cut -d ' ' -f 2))"
