################################################################################
##  File:  Validate-Python.ps1
##  Team:  CI-X
##  Desc:  Configure python on path based on what VS installs
##         Must run after VS is installed
################################################################################

if(Get-Command -Name 'python')
{
    Write-Host "Python $(python --version) on path"
    exit 0
}
else
{
     Write-Host "Python is not on path"
    exit 1
}