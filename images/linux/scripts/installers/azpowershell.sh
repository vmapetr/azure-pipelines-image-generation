#!/bin/bash
################################################################################
##  File:  azpowershell.sh
##  Team:  CI-Platform
##  Desc:  Installed Azure PowerShell
################################################################################

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

# Install Azure CLI (instructions taken from https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
apt-get install-module -name azpowershell -allowClobber

# Run tests to determine that the software installed as expected
echo "Testing to make sure that script performed as expected, and basic scenarios work"
if ! command -v azpowershell; then
    echo "azpowershell was not installed"
    exit 1
fi

# Document what was added to the image
echo "Lastly, documenting what we added to the metadata file"
DocumentInstalledItem "AzPowershell ($(azpowershell -v | head -n 1))"