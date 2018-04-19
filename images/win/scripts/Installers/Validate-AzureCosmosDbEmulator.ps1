################################################################################
##  File:  Validate-AzureCosmosDbEmulator.ps1
##  Team:  Automated Testing
##  Desc:  Validate Azure CosmosDb Emulator installation.
################################################################################

$SoftwareName = 'Azure CosmosDb Emulator'
$regKey = 'HKCU:\SOFTWARE\Microsoft\CosmosDBEmulator'

if(Test-Path $regKey)
{
    $fileVersion = (Get-Item (Join-Path (Get-ItemProperty $regKey).'InstallDir' 'CosmosDB.Emulator.exe')).VersionInfo.FileVersion
    $Description = @"
_version:_
$fileVersion
"@

    Add-SoftwareDetailsToMarkdown -SoftwareName $SoftwareName -DescriptionMarkdown $Description

    exit 0
}
else
{
    Write-Host "$SoftwareName is not installed."
    exit 1
}
