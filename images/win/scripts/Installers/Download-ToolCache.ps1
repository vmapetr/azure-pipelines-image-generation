################################################################################
##  File:  Install-ToolCache.ps1
##  Team:  CI-Build
##  Desc:  Install tool cache
################################################################################

$SourceUrl = "https://vstsagenttools.blob.core.windows.net/tools"

$Dest = "C:/"

$Path = "hostedtoolcache/windows"

$env:Path = "C:\Program Files (x86)\Microsoft SDKs\Azure\AzCopy;" + $env:Path

AzCopy /Source:$SourceUrl /Dest:$Dest  /S /V /Pattern:$Path

$ToolsDirectory = $Dest + $Path

setx AGENT_TOOLSDIRECTORY $ToolsDirectory /M