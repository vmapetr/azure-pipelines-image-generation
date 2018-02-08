################################################################################
##  File:  Validate-MysqlCli.ps1
##  Team:  ReleaseManagement
##  Desc:  Validate Mysql Cli
################################################################################

if(Get-Command -Name 'mysql')
{
    Write-Host "Mysql is on path"
}
else
{
    Write-Host 'Mysql not on path'
    exit 1
}

# Adding description of the software to Markdown
$SoftwareName = "Mysql"

$versionResult = mysql -V
$version = [regex]::match($versionResult,'(\d+\.)(\d+\.)(\d+)').value

$Description = @"
_Version:_ $version<br/>
_Environment:_
* PATH: contains location of mysql.exe
"@

Add-SoftwareDetailsToMarkdown -SoftwareName $SoftwareName -DescriptionMarkdown $Description