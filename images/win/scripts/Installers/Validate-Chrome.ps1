################################################################################
##  File:  Validate-Chrome.ps1
##  Team:  Automated Testing
##  Desc:  Validate Google Chrome installation.
################################################################################

if(Test-Path "HKLM:SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe")
{
	$path = Get-ChildItem "HKLM:SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe" | Get-ItemProperty -Name Path
	Write-Host "Google Chrome installed at " $path
	exit 0
}
else
{
	Write-Host "Google Chrome is not isntalled."
    exit 1
}