################################################################################
##  File:  Validate-NSIS.ps1
##  Team:  CI-X
##  Desc:  Validate NSIS installation.
################################################################################

$SoftwareName = 'Nullsoft Install System (NSIS)'
$regKey = gci HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | gp | ? { $_.DisplayName -eq 'Nullsoft Install System' }

if ($regKey -eq $null)
{
    Write-Host "The $regKey registry key is not set"
    exit 1
}
else
{
    Write-Host "The $regKey registry key is set"
}

$installDir = $regKey.InstallLocation
if ($installDir -eq $null)
{
    Write-Host "The $SoftwareName installation directory registry value is not set"
    exit 1
}
else
{
    Write-Host "The $SoftwareName installation directory registry value is set to: $installDir"
}

$exeFilePath = Join-Path $installDir 'NSIS.exe'
if (!(Test-Path $exeFilePath))
{
    Write-Host "$SoftwareName is not installed"
    exit 1
}
else
{
    $fileVersion = $regKey.DisplayVersion
    Write-Host "$SoftwareName is successfully installed: $fileVersion"

    $Description = @"
_Version:_ $fileVersion<br/>
_Location:_ $installDir
"@

    Add-SoftwareDetailsToMarkdown -SoftwareName $SoftwareName -DescriptionMarkdown $Description
}
