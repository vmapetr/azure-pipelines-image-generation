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
}
else
{
    Write-Host "one of Gulp, Grunt, Bower, Cordova is not on path."
    exit 1
}



if( $(node --version) -match  'v(?<version>.*)' )
{
   $nodeVersion = $Matches.version
}

$npmVersion = $(npm -version)

# Adding description of the software to Markdown
$SoftwareName = "Node.js"

$Description = @"
_Version:_ $nodeVersion<br/>
_Environment:_
* PATH: contains location of node.exe<br/>

> Note: You can install and use another version of Node on the hosted agents using the [Node tool installer](https://docs.microsoft.com/en-us/vsts/build-release/tasks/tool/node-js) task.
"@

Add-SoftwareDetailsToMarkdown -SoftwareName $SoftwareName -DescriptionMarkdown $Description

# Adding description of the software to Markdown
$SoftwareName = "npm"

$Description = @"
_Version:_ $npmVersion<br/>
_Environment:_
* PATH: contains location of npm.cmd
"@

Add-SoftwareDetailsToMarkdown -SoftwareName $SoftwareName -DescriptionMarkdown $Description