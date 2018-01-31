################################################################################
##  File:  Validate-Firefox.ps1
##  Team:  Automated Testing
##  Desc:  Validate Mozilla Firefox installation.
################################################################################

if(Test-Path "HKLM:SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\firefox.exe")
{
	$path = (Get-ItemProperty -Path "HKLM:SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\firefox.exe").Path
	Write-Host "Mozilla Firefox installed at " $path
	exit 0
}
else
{
	Write-Host "Mozilla Firefox is not installed."
    exit 1
}