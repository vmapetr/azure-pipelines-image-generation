################################################################################
##  File:  Install-NET472.ps1
##  Team:  CI-Build
##  Desc:  Install .NET 4.7.2
################################################################################

Import-Module -Name ImageHelpers -Force

# .NET 4.7.2
$InstallerURI = "http://download.microsoft.com/download/5/A/3/5A3607CA-53B1-4717-8845-4389B11931FA/NDP472-KB4054530-x86-x64-AllOS-ENU.exe"
$InstallerName = "NDP472.exe"
$ArgumentList = ('Setup', '/passive', '/norestart' )

Install-EXE -Url $InstallerURI -Name $InstallerName -ArgumentList $ArgumentList