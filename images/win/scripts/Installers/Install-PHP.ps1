################################################################################
##  File:  Install-PHP.ps1
##  Team:  CI-X
##  Desc:  Install PHP
################################################################################

Import-Module -Name ImageHelpers

function Install-PHPVersion
{
    Param
    (
        [String]$phpVersion,
        [Boolean]$addToDefaultPath
    )

    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

    # Download the PHP zip archive.
    Write-Host "Downloading PHP $phpVersion..."
    $ProgressPreference = 'SilentlyContinue'
    Invoke-WebRequest -UseBasicParsing -Uri "https://windows.php.net/downloads/releases/php-$phpVersion-nts-Win32-VC15-x64.zip" -OutFile php$phpVersion.windows-amd64.zip

    # Extract the zip archive.
    Write-Host "Extracting PHP $phpVersion..."
    Expand-Archive -Path php$phpVersion.windows-amd64.zip -DestinationPath "C:\php" -Force

    # Rename the extracted "php" directory to include the PHP version number (to support side-by-side versions of PHP).
    $newDirName = "php$phpVersion"
    Rename-Item -path "C:\php" -newName $newDirName

    # Delete the PHP zip archive.
    Write-Host "Deleting downloaded archive of PHP $phpVersion..."
    Remove-Item php$phpVersion.windows-a`md64.zip

    # Make this the default version of PHP?
    if ($addToDefaultPath)
    {
        Write-Host "Adding php $phpVersion to the path..."
        # Add the php binaries to the path.
        Add-MachinePathItem "C:\$newDirName" | Out-Null
        # Set the PHPROOT environment variable.
        setx PHPROOT "C:\$newDirName" /M | Out-Null
    }

    # Done
    Write-Host "Done installing PHP $phpversion."
    return "C:\$newDirName"
}

# Install PHP 7.2.10
$installDirectory = Install-PHPVersion -phpVersion '7.2.10' -addToDefaultPath $True
setx PHPROOT_7_2_X64 "$installDirectory" /M

# Done
exit 0


