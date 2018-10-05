################################################################################
##  File:  Validate-PHP.ps1
##  Team:  CI-X
##  Desc:  Validate PHP
################################################################################

# Function that gets the version of php at the specified path
function Get-PHPVersion
{
    Param
    (
        [String]$phpRootPath
    )

    $env:Path = "$phpRootPath;" + $env:Path
    if($(php --version) -match 'php (?<version>.*) \(.*')
    {
        $phpVersion = $Matches.version
        return $phpVersion
    }

    Write-Host "Unable to determine PHP version at " + $phpRootPath
    exit 1
}

# Verify that php.exe is on the path
if(Get-Command -Name 'php')
{
    Write-Host "$(php --version) is on the path."
}
else
{
    Write-Host "php is not on the path."
    exit 1
}

# Get available versions of PHP
$phpVersion7_2 = Get-PHPVersion -phpRootPath "C:\php7.2.10"
$phpVersionOnPath = Get-PHPVersion -phpRootPath "C:\php7.2.10"

# Add details of available versions in Markdown
$SoftwareName = "PHP (x64)"
$Description = @"
#### $phpVersion7_2

_Environment:_
* PHPROOT_7_2_X64: root directory of the PHP $phpVersion7_2 installation

#### $phpVersionOnPath

_Environment:_
* PATH: contains the location of php.exe version $phpVersionOnPath
* PHPROOT: root directory of the PHP $phpVersionOnPath installation
* PHPROOT_7_2_X64: root directory of the PHP $phpVersionOnPath installation
"@

Add-SoftwareDetailsToMarkdown -SoftwareName $SoftwareName -DescriptionMarkdown $Description
