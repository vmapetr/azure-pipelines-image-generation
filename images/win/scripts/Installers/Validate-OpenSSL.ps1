################################################################################
##  File:  Validate-OpenSSL.ps1
##  Team:  CI-X
##  Desc:  Validate openssl
################################################################################

if (Get-Command -Name 'openssl')
{
    Write-Host "openssl on path"
}
else
{
    Write-Host 'openssl is not on path'
    exit 1
}

if( $(openssl version) -match  '\d+\.\d+\.\d+\w' )
{
   $version = $Matches[0]
}
# Adding description of the software to Markdown
$SoftwareName = "OpenSSL"

$Description = @"
_Version:_ $version<br/>
"@

Add-SoftwareDetailsToMarkdown -SoftwareName $SoftwareName -DescriptionMarkdown $Description
