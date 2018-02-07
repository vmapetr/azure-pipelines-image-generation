################################################################################
##  File:  Validate-MysqlCli.ps1
##  Team:  ReleaseManagement
##  Desc:  Validate Mysql Cli
################################################################################

function Test-Leaf
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$LiteralPath)

    if ((Test-Path -LiteralPath $LiteralPath -PathType Leaf))
    {
        return $true
    }

    return $false
}

function Test-Mysql-Installed
{
    # Getting system environment path
    $systemPath = [Environment]::GetEnvironmentVariable('Path', [System.EnvironmentVariableTarget]::Machine)
    $paths = $systemPath.split(';')
    foreach ($path in $paths)
    {
	    if(Test-Leaf $path"\mysql.exe")
        {
            $mysqlPath = $path
            return $true;
        }
    }

    return $false;
}

if(Test-Mysql-Installed)
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