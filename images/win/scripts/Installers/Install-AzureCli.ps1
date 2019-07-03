################################################################################
##  File:  Install-AzureCli.ps1
##  Team:  ReleaseManagement
##  Desc:  Install Azure CLI
################################################################################

choco install azure-cli -y

$AzureCliExtensionPath = Join-Path $Env:HOMEDRIVE 'AzureCliExtensionDirectory'
New-Item -ItemType "directory" -Path $AzureCliExtensionPath

$Env:AZURE_EXTENSION_DIR = $AzureCliExtensionPath
