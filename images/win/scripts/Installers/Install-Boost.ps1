################################################################################
##  File:  Install-Boost.ps1
##  Team:  CI-Platform
##  Desc:  Install Boost C++ Libraries
################################################################################

Import-Module -Name ImageHelpers -Force
function Install-BoostRelease
{
    Param
    (
        [String]$BoostRootDirectory,
        [String]$ReleaseVersion,
        [Switch]$AddToDefaultPath
    )

    $SourceUri = 'https://github.com/boostorg/boost.git'
    $ReleaseDirectory = "$BoostRootDirectory\$ReleaseVersion"

    New-Item -Path $ReleaseDirectory -ItemType Directory -Force

    Write-Host "Downloading Boost $ReleaseVersion..."
    git clone --recursive --branch "boost-$ReleaseVersion" $SourceUri $ReleaseDirectory --depth 1 -q

    # Build and integrate Boost release
    Invoke-Expression "$ReleaseDirectory\bootstrap.bat"
    Invoke-Expression "$ReleaseDirectory\b2 install --prefix=$ReleaseDirectory"

    # Make this the default version of Boost?
    if ($AddToDefaultPath)
    {
        Write-Host "Adding Boost $ReleaseVersion to the path..."
        # Add the Boost binaries to the path.
        Add-MachinePathItem "$ReleaseDirectory" | Out-Null
        # Set the BOOST_ROOT environment variable.
        setx BOOST_ROOT $ReleaseDirectory /M | Out-Null
    }

    # Done
    Write-Host "Done installing Boost $ReleaseVersion."
    return $ReleaseDirectory
}

# Root folder of all Boost releases
$BoostRootPath = 'C:\Program Files\Boost'

# Install Boost 1.66.0
$InstallDirectory = Install-BoostRelease -BoostRootDirectory $BoostRootPath -ReleaseVersion '1.66.0'
setx BOOST_ROOT_1_66_0 $InstallDirectory /M

# Install Boost 1.67.0
$InstallDirectory = Install-BoostRelease -BoostRootDirectory $BoostRootPath -ReleaseVersion '1.67.0'
setx BOOST_ROOT_1_67_0 $InstallDirectory /M

# Install Boost 1.68.0
$InstallDirectory = Install-BoostRelease -BoostRootDirectory $BoostRootPath -ReleaseVersion '1.68.0'
setx BOOST_ROOT_1_68_0 $InstallDirectory /M

# Install Boost 1.69.0
$InstallDirectory = Install-BoostRelease -BoostRootDirectory $BoostRootPath -ReleaseVersion '1.69.0' -AddToDefaultPath
setx BOOST_ROOT_1_69_0 $InstallDirectory /M
