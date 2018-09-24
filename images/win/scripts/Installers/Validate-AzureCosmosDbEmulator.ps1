################################################################################
##  File:  Validate-AzureCosmosDbEmulator.ps1
##  Team:  Automated Testing
##  Desc:  Validate Azure CosmosDb Emulator installation.
################################################################################

$SoftwareName = 'Azure CosmosDb Emulator'
$installDir = 'C:\Program Files\Azure Cosmos DB Emulator'

$exeFilePath = Join-Path $installDir 'CosmosDB.Emulator.exe'
if (!(Test-Path $exeFilePath))
{
    Write-Host "$SoftwareName is not installed"
    exit 1
}
else
{
    $fileVersion = (Get-Item $exeFilePath).VersionInfo.FileVersion
    Write-Host "$SoftwareName is successfully installed: $fileVersion"

    $Description = @"
_Version:_ $fileVersion<br/>
_Location:_ $installDir
"@

    Add-SoftwareDetailsToMarkdown -SoftwareName $SoftwareName -DescriptionMarkdown $Description
}

