﻿################################################################################
##  File:  Install-Vcpkg.ps1
##  Team:  CI-Platform
##  Desc:  Install vcpkg
################################################################################

Import-Module -Name ImageHelpers -Force

$Uri = 'https://github.com/Microsoft/vcpkg.git'
$InstallDir = 'C:\vcpkg'
$VcpkgExecPath = 'vcpkg.exe'

git clone --depth=1 $Uri $InstallDir -q

# Build and integrate vcpkg
Invoke-Expression "$InstallDir\bootstrap-vcpkg.bat"
Invoke-Expression "$InstallDir\$VcpkgExecPath integrate install"

# Add vcpkg to system path
Add-MachinePathItem $InstallDir
$env:Path = Get-MachinePath
