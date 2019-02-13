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
        [Boolean]$AddToDefaultPath
    )

    $SourceUri = 'https://github.com/boostorg/boost.git'
    $ReleaseDirectory = "$BoostRootDirectory\$ReleaseVersion"
    $TempDirectory = "$BoostRootDirectory\Temp"

    New-Item -Path $TempDirectory -ItemType Directory -Force
    New-Item -Path $ReleaseDirectory -ItemType Directory -Force

    Write-Host "Downloading Boost $ReleaseVersion..."
    git clone --recursive --branch "boost-$ReleaseVersion" $SourceUri $TempDirectory --depth 1 -q

    # Build and integrate Boost release
    Invoke-Expression "$TempDirectory\bootstrap.bat"
    Invoke-Expression "$TempDirectory\b2 install --prefix=$ReleaseDirectory"

    # Move Boost binaries to release directory
    New-Item -Path $ReleaseDirectory\bin -ItemType Directory -Force
    Move-Item -Path $TempDirectory\b2.exe -Destination $ReleaseDirectory\bin
    Move-Item -Path $TempDirectory\bjam.exe -Destination $ReleaseDirectory\bin

    # Delete Boost repo to conserve space
    Write-Host "Cleaning temp directory of Boost $ReleaseVersion..."
    if (Test-Path $TempDirectory)
    {
        Remove-Item $TempDirectory -Recurse -Force
    }

    # Make this the default version of Boost?
    if ($AddToDefaultPath)
    {
        Write-Host "Adding Boost $ReleaseVersion to the path..."
        # Add the Boost binaries to the path.
        Add-MachinePathItem "$ReleaseDirectory\bin" | Out-Null
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
$InstallDirectory = Install-BoostRelease -BoostRootDirectory $BoostRootPath -ReleaseVersion '1.66.0' -AddToDefaultPath $false
setx BOOST_ROOT_1_66 $InstallDirectory /M

# Install Boost 1.67.x
$InstallDirectory = Install-BoostRelease -BoostRootDirectory $BoostRootPath -ReleaseVersion '1.67.0' -AddToDefaultPath $false
setx BOOST_ROOT_1_67 $InstallDirectory /M

# Install Boost 1.68.x
$InstallDirectory = Install-BoostRelease -BoostRootDirectory $BoostRootPath -ReleaseVersion '1.68.0' -AddToDefaultPath $false
setx BOOST_ROOT_1_68 $InstallDirectory /M

# Install Boost 1.69.x
$InstallDirectory = Install-BoostRelease -BoostRootDirectory $BoostRootPath -ReleaseVersion '1.69.0' -AddToDefaultPath $true
setx BOOST_ROOT_1_69 $InstallDirectory /M
