################################################################################
##  File:  Validate-Docker.ps1
##  Team:  CI-Platform
##  Desc:  Validate Docker.
################################################################################


if((Get-Command -Name 'docker') -and (Get-Command -Name 'docker-compose'))
{
    Write-Host "docker $(docker version) on path"
    Write-Host "docker-compose $(docker-compose version) on path"
    exit 0
}
else
{
     Write-Host "docker or docker-compose are not on path"
    exit 1
}