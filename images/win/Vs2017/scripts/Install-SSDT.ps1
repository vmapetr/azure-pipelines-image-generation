################################################################################
##  File:  Install-SSDT.ps1
##  Team:  CI-Platform
##  Desc:  Install SQL Server Data Tools for Windows
################################################################################

Import-Module -Name ImageHelpers -Force

$InstallerURI = 'https://download.microsoft.com/download/9/B/7/9B73106C-6207-41D2-AA22-BAEE63B9EC63/SSDT-Setup-ENU.exe'
$InstallerName = 'SSDT-Setup-ENU.exe'
$ArgumentList = ('/install', 'INSTALLALL', '/passive', '/norestart' )

$exitCode = Install-EXE -Url $InstallerURI -Name $InstallerName -ArgumentList $ArgumentList

exit $exitCode
