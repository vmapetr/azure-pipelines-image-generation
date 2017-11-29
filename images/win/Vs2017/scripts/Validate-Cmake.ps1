################################################################################
##  File:  Validate-Cmake.ps1
##  Team:  CI-Build
##  Desc:  Validate Cmake
################################################################################

if(Get-Command -Name 'cmake')
{
    Write-Host "Cmake $(cmake -version) on path"
    exit 0
}
else
{
    Write-Host 'cmake not on path'
    exit 1
}