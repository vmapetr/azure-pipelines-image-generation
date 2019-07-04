################################################################################
##  File:  Download-ToolCache.ps1
##  Team:  CI-Build
##  Desc:  Download tool cache
################################################################################

Function InstallTool
{
    Param
    (
        [System.Object]$ExecutablePath
    )

    Write-Host $ExecutablePath.DirectoryName
    Set-Location -Path $ExecutablePath.DirectoryName
    Get-Location | Write-Host
    if (Test-Path 'tool.zip')
    {
        Expand-Archive 'tool.zip' -DestinationPath '.'
    }
    cmd.exe /c 'install_to_tools_cache.bat'
}

$SourceUrl = "https://vstsagenttools.blob.core.windows.net/tools"

$Dest = "C:/"

$Path = "hostedtoolcache/windows"

$env:Path = "C:\Program Files (x86)\Microsoft SDKs\Azure\AzCopy;" + $env:Path

Write-Host "Started AzCopy from $SourceUrl to $Dest"

AzCopy /Source:$SourceUrl /Dest:$Dest  /S /V /Pattern:$Path

$ToolsDirectory = $Dest + $Path

$current = Get-Location
Set-Location -Path $ToolsDirectory

$Python34x86Path
Get-ChildItem -Recurse -Depth 4 -Filter install_to_tools_cache.bat | ForEach-Object {
    #Python 3.4.* x86 have to be installed after x64 since x64 breaks installed x86 version
    if ($_.DirectoryName -Match "Python\\3.4.*\\x86") {
        $Python34x86Path = $_
    }
    else {
        InstallTool($_)
    }
}

InstallTool($Python34x86Path)

Set-Location -Path $current

setx AGENT_TOOLSDIRECTORY $ToolsDirectory /M