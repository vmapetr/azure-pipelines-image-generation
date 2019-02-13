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

    $ReleasePath = "$BoostRootPath\$BoostRelease"

    if (Test-Path "$ReleasePath\bin\b2.exe")
    {
        Write-Host "Boost.Build $BoostRelease is successfully installed"
    }
    else 
    {
        Write-Host "Boost.Build $BoostRelease is not installed"
        exit 1
    }

    if (Test-Path "$ReleasePath\bin\bjam.exe")
    {
        Write-Host "Boost.Jam $BoostRelease is successfully installed"
    }
    else 
    {
        Write-Host "Boost.Jam $BoostRelease is not installed"
        exit 1
    }

    return $BoostRelease
}

# Verify that Boost is on the path
if ((Get-Command -Name 'b2') -and (Get-Command -Name 'bjam'))
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
