################################################################################
##  File:  Validate-DotnetSDK.ps1
##  Team:  CI-Build
##  Desc:  Validate dotnet
################################################################################

if(Get-Command -Name 'dotnet')
{
    Write-Host "dotnet $(dotnet --version) on path"
    exit 0
}
else
{
     Write-Host "dotnet is not on path"
    exit 1
}