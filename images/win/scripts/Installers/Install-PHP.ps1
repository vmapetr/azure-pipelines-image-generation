################################################################################
##  File:  Install-PHP.ps1
##  Team:  CI-X
##  Desc:  Install PHP
################################################################################

Import-Module -Name ImageHelpers

# Install PHP 7.2.12
choco install php -y --force
$installDir = "c:\tools\php72"

# curl and mbstring extension needed for tests
((Get-Content -path $installDir\php.ini -Raw) -replace ';extension=curl','extension=curl' -replace ';extension=mbstring','extension=mbstring') | Set-Content -Path $installDir\php.ini

# Set the PHPROOT environment variable.
setx PHPROOT $installDir /M

# Done
exit 0


