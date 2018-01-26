################################################################################
##  File:  Install-NET471DevPack.ps1
##  Team:  CI-Build
##  Desc:  Install .NET 4.7.1 targeting pack.
################################################################################

# at the moment this will not install successfully over the WinRM channel and I am unsure why.
#choco install netfx-4.7.1-devpack -y --force --no-progress

# .NET 4.7.1 targeting pack
$InstallerURI = 'https://download.microsoft.com/download/9/0/1/901B684B-659E-4CBD-BEC8-B3F06967C2E7/NDP471-DevPack-ENU.exe'
$InstallerName = 'NDP471-DevPack-ENU.exe'
$ArgumentList = ('/install', '/quiet', '/norestart' )

Install-EXE -Url $InstallerURI -Name $InstallerName -ArgumentList $ArgumentList
