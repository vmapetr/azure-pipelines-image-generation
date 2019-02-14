################################################################################
##  File:  Validate-Boost.ps1
##  Team:  CI-Platform
##  Desc:  Validate Boost C++ Libraries
################################################################################

function Get-BoostVersion
{
    Param
    (
        [String]$BoostRootPath,
        [String]$BoostRelease
    )

    $ReleasePath = "$BoostRootPath\$BoostRelease"

    if (Test-Path "$ReleasePath")
    {
        Write-Host "Boost $BoostRelease is successfully installed"
    }
    else 
    {
        Write-Host "Boost $BoostRelease is not installed"
        exit 1
    }

    return $BoostRelease
}

if ($env:BOOST_ROOT)
{
    Write-Host "The BOOST_ROOT environment variable is set"
    Write-Host $env:BOOST_ROOT
}
else 
{
    Write-Host "The BOOST_ROOT environment variable is not set"
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
* BOOST_ROOT_1_66_0: root directory of the Boost version $BoostVersion_1_66 installation

#### $BoostVersion_1_67

_Environment:_
* BOOST_ROOT_1_67_0: root directory of the Boost version $BoostVersion_1_67 installation

#### $BoostVersion_1_68

_Environment:_
* BOOST_ROOT_1_68_0: root directory of the Boost version $BoostVersion_1_68 installation

#### $BoostVersionOnPath

_Environment:_
* PATH: contains the location of Boost version $BoostVersionOnPath
* BOOST_ROOT: root directory of the Boost version $BoostVersionOnPath installation
* BOOST_ROOT_1_69_0: root directory of the Boost version $BoostVersionOnPath installation
"@

Add-SoftwareDetailsToMarkdown -SoftwareName $SoftwareName -DescriptionMarkdown $Description
