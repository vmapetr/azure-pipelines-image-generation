################################################################################
##  File:  Install-Boost.ps1
##  Team:  CI-Platform
##  Desc:  Install Boost
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
    $RepoDirectory = "$BoostRootDirectory\sources\$ReleaseVersion"

    New-Item -Path $RepoDirectory -ItemType Directory -Force
    New-Item -Path $ReleaseDirectory -ItemType Directory -Force

    Write-Host "Downloading Boost $ReleaseVersion..."
    git clone --recursive --branch "boost-$ReleaseVersion" $SourceUri $RepoDirectory --depth 1 -q

    # Build and integrate Boost release
    Invoke-Expression "$RepoDirectory\bootstrap.bat"
    Invoke-Expression "$RepoDirectory\b2 install --prefix=$ReleaseDirectory"

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

# Install Boost 1.66.x
$InstallDirectory = Install-BoostRelease -BoostRootDirectory $BoostRootPath -ReleaseVersion '1.66.0'
setx BOOST_ROOT_1_66 $InstallDirectory /M

# Install Boost 1.67.x
$InstallDirectory = Install-BoostRelease -BoostRootDirectory $BoostRootPath -ReleaseVersion '1.67.0'
setx BOOST_ROOT_1_67 $InstallDirectory /M

# Install Boost 1.68.x
$InstallDirectory = Install-BoostRelease -BoostRootDirectory $BoostRootPath -ReleaseVersion '1.68.0'
setx BOOST_ROOT_1_68 $InstallDirectory /M

# Install Boost 1.69.x
$InstallDirectory = Install-BoostRelease -BoostRootDirectory $BoostRootPath -ReleaseVersion '1.69.0' -AddToDefaultPath
setx BOOST_ROOT_1_69 $InstallDirectory /M
