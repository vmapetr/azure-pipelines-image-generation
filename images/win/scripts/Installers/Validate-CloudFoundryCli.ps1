################################################################################
##  File:  Validate-CloudFoundryCli.ps1
##  Team:  CI-X
##  Desc:  Validate Cloud Foundry CLI
################################################################################

if (Get-Command -Name 'cf')
{
    Write-Host "cf on path"
}
else
{
    Write-Host 'cf is not on path'
    exit 1
}

if( $(cf version) -match  '\d+\.\d+\.\d+' )
{
   $version = $Matches[0]
}
# Adding description of the software to Markdown
$SoftwareName = "Cloud Foundry CLI"

$Description = @"
_Version:_ $version<br/>
"@

Add-SoftwareDetailsToMarkdown -SoftwareName $SoftwareName -DescriptionMarkdown $Description
