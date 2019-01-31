################################################################################
##  File:  Validate-Vcpkg.ps1
##  Team:  CI-Platform
##  Desc:  Validate vcpkg Cli
################################################################################

if (Get-Command -Name 'Vcpkg')
{
    Write-Host 'Vcpkg is succesfully installed:'
    vcpkg version | Write-Host
}
else
{
    Write-Host 'Vcpkg is not on PATH'
    exit 1
}

# Adding description of the software to Markdown

# `vcpkg version` gives output like:
# Vcpkg package management program version 2018.11.23-nohash
#
# See LICENSE.txt for license information.

$SoftwareName = 'Vcpkg'
$(vcpkg version).Split([System.Environment]::NewLine)[0] -match "\d+.\d+.\d+.*"
$VcpkgVersion = $Matches[0]

$Description = @"
_Version:_ $VcpkgVersion<br/>
_Environment:_
* PATH: contains location of the vcpkg directory
"@

Add-SoftwareDetailsToMarkdown -SoftwareName $SoftwareName -DescriptionMarkdown $Description
