################################################################################
##  File:  Validate-Chrome.ps1
##  Team:  Automated Testing
##  Desc:  Validate Google Chrome installation.
################################################################################

if(Test-Path "HKLM:SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe")
{
	(Get-Item (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe').'(Default)').VersionInfo
	exit 0
}
else
{
	Write-Host "Google Chrome is not isntalled."
    exit 1
}