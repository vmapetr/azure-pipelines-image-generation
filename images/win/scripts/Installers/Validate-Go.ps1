################################################################################
##  File:  Validate-Go.ps1
##  Team:  CI-X
##  Desc:  Validate Go
################################################################################

if(Get-Command -Name 'go')
{
    Write-Host "$(go version) is on the path."
}
else
{
    Write-Host "Go is not on the path."
    exit 1
}


if( $(go version) -match  'go version go(?<version>.*) win.*' )
{
   $goVersion = $Matches.version
}


# Adding description of the software to Markdown
$SoftwareName = "Go"

$Description = @"
_Version:_ $goVersion<br/>
_Environment:_
* PATH: contains location of go.exe
* GOROOT: root directory of the Go installation
"@

Add-SoftwareDetailsToMarkdown -SoftwareName $SoftwareName -DescriptionMarkdown $Description
