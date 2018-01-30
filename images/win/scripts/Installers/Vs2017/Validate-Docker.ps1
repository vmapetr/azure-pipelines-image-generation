################################################################################
##  File:  Validate-Docker.ps1
##  Team:  CI-Platform
##  Desc:  Validate Docker.
################################################################################


if((Get-Command -Name 'docker') -and (Get-Command -Name 'docker-compose'))
{
    Write-Host "docker $(docker version) on path"
    Write-Host "docker-compose $(docker-compose version) on path"
}
else
{
     Write-Host "docker or docker-compose are not on path"
    exit 1
}

# Adding description of the software to Markdown
$SoftwareName = "Docker"

$version = $(docker version --format '{{.Server.Version}}')

$Description = @"
_Version:_ $version<br/>
_Environment:_
* PATH: contains location of docker.exe
"@

Add-SoftwareDetailsToMarkdown -SoftwareName $SoftwareName -DescriptionMarkdown $Description



$SoftwareName = "Docker-compose"

$version = $(docker-compose version) | %{ if( ($_.Split(' ')[0]).Trim() -like "docker-compose") { ($_.Split(' ')[2]).Split(',')[0] } }

$Description = @"
_Version:_ $version<br/>
_Environment:_
* PATH: contains location of docker-compose.exe
"@

Add-SoftwareDetailsToMarkdown -SoftwareName $SoftwareName -DescriptionMarkdown $Description
