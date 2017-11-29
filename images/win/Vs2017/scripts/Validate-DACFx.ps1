####################################################################################
##  File:  Validate-DACFx.ps1
##  Team:  CI-Platform
##  Desc:  Validate SQL Server® Data-Tier Application Framework (DACFx) for Windows
####################################################################################

$env:PATH = $env:Path + ';C:\Program Files\Microsoft SQL Server\130\DAC\bin'

if(Get-Command -Name 'SqlPackage')
{
    Write-Host "DACFx is installed!"
}
else
{
    throw "DACFx is not installed!"
}


