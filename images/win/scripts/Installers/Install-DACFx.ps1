####################################################################################
##  File:  Install-DACFx.ps1
##  Team:  CI-Platform
##  Desc:  Install SQL Server® Data-Tier Application Framework (DACFx) for Windows
####################################################################################

Import-Module -Name ImageHelpers -Force

$exitcode = Install-MSI -MsiUrl "https://download.microsoft.com/download/3/7/F/37F3C5CE-E96B-41AC-B361-27735365AA16/EN/x64/DacFramework.msi" -MsiName "DacFramework.msi"

exit $exitcode