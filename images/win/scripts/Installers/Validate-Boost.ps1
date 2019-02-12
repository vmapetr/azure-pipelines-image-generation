################################################################################
##  File:  Validate-Boost.ps1
##  Team:  CI-Platform
##  Desc:  Validate Boost
################################################################################

function Get-BoostVersion
{
    Param
    (
        [String]$BoostRootPath,
        [String]$BoostRelease
    )

    if (Test-Path "$BoostRootPath\$BoostRelease\b2.exe")
    {
        Write-Host "Boost release $BoostRelease is successfully installed"
        return $BoostRelease
    }
    else 
    {
        Write-Host "Boost release $BoostRelease is not installed"
        exit 1
    }
}

# Verify that Boost is on the path
if (Get-Command -Name 'b2')
{
    Write-Host "Boost is on the path"
}
else 
{
    Write-Host "Boost is not on the path"
    exit 1    
}

# Get available versions of Boost
$BoostRootDirectory = "C:\Program Files\Boost\"

$BoostVersion_1_66 = Get-BoostVersion -BoostRootPath $BoostRootDirectory -BoostRelease "1.66.0"
$BoostVersion_1_67 = Get-BoostVersion -BoostRootPath $BoostRootDirectory -BoostRelease "1.67.0"
$BoostVersion_1_68 = Get-BoostVersion -BoostRootPath $BoostRootDirectory -BoostRelease "1.68.0"
$BoostVersionOnPath = Get-BoostVersion -BoostRootPath $BoostRootDirectory -BoostRelease "1.69.0"

# Adding description of the software to Markdown
$SoftwareName = 'Boost'
$Description = @"
#### $BoostVersion_1_66

_Environment:_
* BOOST_ROOT_1_66: root directory of the Boost version $BoostVersion_1_66 installation

#### $BoostVersion_1_67

_Environment:_
* BOOST_ROOT_1_67: root directory of the Boost version $BoostVersion_1_67 installation

#### $BoostVersion_1_68

_Environment:_
* BOOST_ROOT_1_68: root directory of the Boost version $BoostVersion_1_68 installation

#### $BoostVersionOnPath
* PATH: contains the location of Boost version $BoostVersionOnPath
* BOOST_ROOT: root directory of the Boost version $BoostVersionOnPath installation
* BOOST_ROOT_1_69: root directory of the Boost version $BoostVersionOnPath installation
"@

Add-SoftwareDetailsToMarkdown -SoftwareName $SoftwareName -DescriptionMarkdown $Description
