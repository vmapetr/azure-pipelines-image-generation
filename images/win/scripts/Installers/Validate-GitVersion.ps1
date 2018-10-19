################################################################################
##  File:  Validate-GitVersion.ps1
##  Team:  CI-X
##  Desc:  Validate GitVersion
################################################################################

$command = Get-Command -Name 'gitversion'
if ($command)
{
    Write-Host "gitversion on path"
}
else
{
    Write-Host 'gitversion is not on path'
    exit 1
}

# Adding description of the software to Markdown
$SoftwareName = "GitVersion"
$version = $command.Version.ToString()

$Description = @"
_Version:_ $version<br/>
"@

#Write-Host $Description
Add-SoftwareDetailsToMarkdown -SoftwareName $SoftwareName -DescriptionMarkdown $Description