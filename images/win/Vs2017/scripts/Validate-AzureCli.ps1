################################################################################
##  File:  Validate-AzureCli.ps1
##  Team:  ReleaseManagement
##  Desc:  Validate Azure CLI
################################################################################

if(Get-Command -Name 'az')
{
    Write-Host "Azure Cli $(az --version) on path"
    exit 0
}
else
{
    Write-Error "Azure Cli not on path"
    exit 1
}
