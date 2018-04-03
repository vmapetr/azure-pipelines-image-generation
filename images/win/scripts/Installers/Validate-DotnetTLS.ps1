################################################################################
##  File:  Validate-DotnetTLS.ps1
##  Team:  ReleaseManagement
##  Desc:  Validate DotNetFramework security protocol to TLS 1.2
################################################################################

$protocols = [Net.ServicePointManager]::SecurityProtocol
$protocolArr = $protocols -split ','
if($protocolArr.Contains('Tls12'))
{
    Write-Host "Tls 1.2 has been enabled."
}
else
{
    Write-Host "Tls 1.2 has not been enabled."
    exit 1
}

# Adding description of the software to Markdown
$SoftwareName = "TLS12"
$version = "1.2";

$Description = @"
_Version:_ $version<br/>
_Environment:_
* PATH: contains location of tls1.2
"@

Add-SoftwareDetailsToMarkdown -SoftwareName $SoftwareName -DescriptionMarkdown $Description

