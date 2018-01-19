################################################################################
##  File:  Install-Go.ps1
##  Team:  CI-Platform
##  Desc:  Install Go
################################################################################

Import-Module -Name ImageHelpers

# Install Go 1.9.2
$goVersion = "1.9.2"
# Download the Go zip archive.
Invoke-WebRequest -UseBasicParsing -Uri "https://dl.google.com/go/go$goVersion.windows-amd64.zip" -OutFile go$goVersion.windows-amd64.zip
# Extract the zip archive.  It contains a single directory named "go".
Expand-Archive -Path go$goVersion.windows-amd64.zip -DestinationPath 'C:\' -Force
# Rename the extracted "go" directory to include the Go version number (to support side-by-side versions of Go).
Rename-Item -path "C:\go" -newName "Go$goVersion"
# Delete the Go zip archive.
Remove-Item go$goVersion.windows-amd64.zip
# Add the Go binaries to the path.
Add-MachinePathItem "C:\Go$goVersion\bin"
# Set the GOROOT environment variable.
setx GOROOT "C:\Go$goVersion" /M

# Done
exit 0
