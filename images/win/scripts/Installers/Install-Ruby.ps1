################################################################################
##  File:  Install-Ruby.ps1
##  Team:  CI-Platform
##  Desc:  Install Ruby
################################################################################

Import-Module -Name ImageHelpers -Force

# Speed up Invoke-WebRequest
$ProgressPreference = 'SilentlyContinue'

# GitHub requires TLS 1.2 instead of the Invoke-WebRequest default of TLS 1.0
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Install Ruby 2.3
$rubyArch = "x64"
$rubyVersion = "2.3.3"
$InstallerURI = "https://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-$rubyVersion-$rubyArch.exe"
$InstallerName = 'rubyinstaller-$rubyVersion-$rubyArch.exe'
$ArgumentList = ("/dir=C:/Ruby$rubyVersion-$rubyArch", '/verysilent', '/tasks:nomodpath,noassocfiles,noridkinstall,defaultutf8' )
Install-EXE -Url $InstallerURI -Name $InstallerName -ArgumentList $ArgumentList
Remove-Item "rubyinstaller-$rubyVersion-$rubyArch.exe"
setx RUBY_2_3_X64 "C:\Ruby$rubyVersion-$rubyArch" /M

# Install Ruby 2.4 (default version in path)
$rubyArch = "x64"
$rubyVersion = "2.4.3-1"
$InstallerURI = "https://github.com/oneclick/rubyinstaller2/releases/download/rubyinstaller-$rubyVersion/rubyinstaller-$rubyVersion-$rubyArch.exe"
$InstallerName = 'rubyinstaller-$rubyVersion-$rubyArch.exe'
$ArgumentList = ("/dir=C:/Ruby$rubyVersion-$rubyArch", '/verysilent', '/tasks:nomodpath,noassocfiles,noridkinstall,defaultutf8' )
Install-EXE -Url $InstallerURI -Name $InstallerName -ArgumentList $ArgumentList
Remove-Item "rubyinstaller-$rubyVersion-$rubyArch.exe"
setx RUBY_2_4_X64 "C:\Ruby$rubyVersion-$rubyArch" /M
Add-MachinePathItem "C:\Ruby$rubyVersion-$rubyArch\bin"

# Install Ruby 2.5
$rubyArch = "x64"
$rubyVersion = "2.5.0-1"
$InstallerURI = "https://github.com/oneclick/rubyinstaller2/releases/download/rubyinstaller-$rubyVersion/rubyinstaller-$rubyVersion-$rubyArch.exe"
$InstallerName = 'rubyinstaller-$rubyVersion-$rubyArch.exe'
$ArgumentList = ("/dir=C:/Ruby$rubyVersion-$rubyArch", '/verysilent', '/tasks:nomodpath,noassocfiles,noridkinstall,defaultutf8' )
Install-EXE -Url $InstallerURI -Name $InstallerName -ArgumentList $ArgumentList
Remove-Item "rubyinstaller-$rubyVersion-$rubyArch.exe"
setx RUBY_2_5_X64 "C:\Ruby$rubyVersion-$rubyArch" /M

# Done
exit 0
