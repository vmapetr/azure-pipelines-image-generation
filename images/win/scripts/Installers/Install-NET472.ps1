################################################################################
##  File:  Install-NET472.ps1
##  Team:  CI-Build
##  Desc:  Install .NET 4.7.2
################################################################################

Import-Module -Name ImageHelpers -Force

# .NET 4.7.2 Dev pack
$InstallerURI = "https://download.microsoft.com/download/5/F/E/5FE505D0-E753-4F1A-B8D6-D9E73C0C28C7/NDP472-DevPack-ENU.exe"
$InstallerName = "NDP472-DevPack-ENU.exe"
$ArgumentList = ('Setup', '/passive', '/norestart' )

Install-EXE -Url $InstallerURI -Name $InstallerName -ArgumentList $ArgumentList