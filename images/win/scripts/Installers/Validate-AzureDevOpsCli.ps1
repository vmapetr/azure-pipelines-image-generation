################################################################################
##  File:  Validate-AzureDevOpsCli.ps1
##  Team:  Protocol CLI
##  Desc:  Validate Azure DevOps CLI
################################################################################

$DevOpsCliHelp = az devops -h
$Description = " ` " + $DevOpsCliHelp + " ` "

if($LastExitCode -ne 0)
{
    Write-Error "Azure DevOps Cli extension not present"
    exit 1
}
else
{
    Write-Host "Azure DevOps Cli extension is present"
}

Add-SoftwareDetailsToMarkdown -SoftwareName 'Azure DevOps Cli extension' -DescriptionMarkdown $Description