################################################################################
##  File:  Validate-Go.ps1
##  Team:  CI-X
##  Desc:  Validate Go
################################################################################

if(Get-Command -Name 'go')
{
    Write-Host "$(go version) is on the path."
    exit 0
}
else
{
    Write-Host "Go is not on the path."
    exit 1
}