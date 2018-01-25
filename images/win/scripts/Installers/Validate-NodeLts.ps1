################################################################################
##  File:  Validate-NodeLts.ps1
##  Team:  CI-X
##  Desc:  Validate nodejs-lts and other common node tools.
################################################################################

if((Get-Command -Name 'node') -and (Get-Command -Name 'npm'))
{
    Write-Host "Node $(node --version) on path"
    Write-Host "Npm $(npm -version) on path"
}
else
{
    Write-Host "Node or npm is not on path"
    exit 1
}

if((Get-Command -Name 'gulp') -and (Get-Command -Name 'grunt') -and (Get-Command -Name 'bower') -and (Get-Command -Name 'cordova'))
{
    Write-Host "Gulp $(gulp -version) on path"
    Write-Host "Grunt $(grunt -version) on path"
    Write-Host "Bower $(bower -version) on path"
    exit 0
}
else
{
    Write-Host "one of Gulp, Grunt, Bower, Cordova is not on path."
    exit 1
}