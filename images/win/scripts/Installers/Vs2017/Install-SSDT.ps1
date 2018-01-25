################################################################################
##  File:  Install-SSDT.ps1
##  Team:  CI-Platform
##  Desc:  Install SQL Server Data Tools for Windows
################################################################################

Import-Module -Name ImageHelpers -Force

#SSDT for Visual Studio 2017 (15.5.1)
$InstallerURI = 'https://download.microsoft.com/download/1/6/A/16A8DF2A-D76C-4241-AEF9-2CDEC850B28E/SSDT-Setup-ENU.exe'
$InstallerName = 'SSDT-Setup-ENU.exe'
$ArgumentList = ('/install', 'INSTALLALL', '/passive', '/norestart' )

$exitCode = Install-EXE -Url $InstallerURI -Name $InstallerName -ArgumentList $ArgumentList

exit $exitCode
