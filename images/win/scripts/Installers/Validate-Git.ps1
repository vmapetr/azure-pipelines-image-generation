################################################################################
##  File:  Validate-Git.ps1
##  Team:  CI-Platform
##  Desc:  Validate Git for Windows
################################################################################

if((Get-Command -Name 'git') -and (Get-Command -Name 'bash') -and (Get-Command -Name 'awk') -and (Get-Command -Name 'git-lfs'))
{
    Write-Host "$(git version) on path"
    Write-Host "$(git-lfs version) on path"
    exit 0
}
else
{
    Write-Host "git or git-lfs are not on path."
    exit 1
}