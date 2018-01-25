################################################################################
##  File:  Validate-Svn.ps1
##  Team:  CI-X
##  Desc:  Validate Subversion
################################################################################

if(Get-Command -Name 'svn')
{
    Write-Host "Subversion $(svn --version --quiet) is on the path."
    exit 0
}
else
{
    Write-Host "Subversion is not on the path."
    exit 1
}