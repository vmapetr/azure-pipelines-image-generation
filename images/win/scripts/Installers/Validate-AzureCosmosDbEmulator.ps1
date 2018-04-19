################################################################################
##  File:  Validate-AzureCosmosDbEmulator.ps1
##  Team:  Automated Testing
##  Desc:  Validate Azure CosmosDb Emulator installation.
################################################################################

$SoftwareName = 'Azure CosmosDb Emulator'
$regKey = 'HKCU:\SOFTWARE\Microsoft\CosmosDBEmulator'

if(Test-Path $regKey)
{
    $installDir = (Get-ItemProperty $regKey).'InstallDir'
    $fileVersion = (Get-Item (Join-Path $installDir 'CosmosDB.Emulator.exe')).VersionInfo.FileVersion
    $Description = @"
_Version:_ $fileVersion<br/>
_Location:_ $installDir
"@

    Add-SoftwareDetailsToMarkdown -SoftwareName $SoftwareName -DescriptionMarkdown $Description

    exit 0
}
else
{
    Write-Host "$SoftwareName is not installed."
    exit 1
}
