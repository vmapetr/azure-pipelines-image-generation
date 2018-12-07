################################################################################
##  File:  Validate-WinAppDriver.ps1
##  Team:  Azure Developer Platform
##  Desc:  Validate WinAppDriver installation 
################################################################################


if(Test-Path "C:\Program Files (x86)\Windows Application Driver" -PathType Any)
{
    Write-Host "WinAppDriver directory found."
	
}
else
{
	Write-Host "WinAppDriver is not installed."
    exit 1
}

#Validate if Developer Mode is enabled
$path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock";
if((Get-ItemProperty -Path $path | Select-Object -ExpandProperty "AllowDevelopmentWithoutDevLicense") -eq 1)
{
    Write-Host "Developer Mode is provisioned."
}
else{
    Write-Host "Developer Mode was not successfully provisioned."
    exit 1
}

# Adding description of the software to Markdown
$SoftwareName = "WinAppDriver"
$version = [System.Diagnostics.FileVersionInfo]::GetVersionInfo("C:\Program Files (x86)\Windows Application Driver\WinAppDriver.exe").FileVersion
$Description = @"
_Version:_ $version<br/>
"@

Add-SoftwareDetailsToMarkdown -SoftwareName $SoftwareName -DescriptionMarkdown $Description