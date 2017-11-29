################################################################################
##  File:  Install-DotnetSDK.ps1
##  Team:  CI-Build
##  Desc:  Install all released versions of the dotnet sdk and populate package
##         cache.  Should run after VS and Node
################################################################################

function Install-SDK {
    [CmdletBinding()]
    param (
        [string]$DownloadUrl
    )

    Write-Host "Downloading from" $DownloadUrl
    Invoke-WebRequest -Uri $DownloadUrl -OutFile C:\Temp\dotnet.zip -UseBasicParsing
    Expand-Archive C:\Temp\dotnet.zip -DestinationPath $Env:ProgramFiles\dotnet -Force
    Remove-Item -Force C:\Temp\dotnet.zip -ErrorAction SilentlyContinue
}

# ensure temp
New-Item -Path C:\Temp -Force -ItemType Directory

# versions we don't want to install
$blacklist = @('1.0.0-preview2-1-003177', '1.0.0-preview2-003148','1.0.0-preview2-003156', '1.0.0-preview2-003121', '1.0.0-preview2-003131', '2.0.0-preview1-005977','2.0.0-preview2-006497')

Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/dotnet/core/master/release-notes/releases.json' -UseBasicParsing -OutFile 'dotnet-releases.json'
$dotnetReleases = Get-Content -Path 'dotnet-releases.json' | ConvertFrom-Json
$dotnetReleases = $dotnetReleases | Sort-Object -Property 'version-runtime'

$dotnetReleases | ForEach-Object {
    $release = $_
    $releaseUrl = $release.'blob-sdk'
    $releasePackage = $release.'sdk-win-x64'
    $sdkVersion = $release.'version-sdk'
    if(!($blacklist.Contains($sdkVersion)) -and !(Test-Path -Path $(Join-Path -Path $env:ProgramFiles -ChildPath $('\dotnet\sdk\' + $sdkVersion))))
    {
        Install-SDK -DownloadUrl ($releaseUrl + $releasePackage)
    }
}

# warm up dotnet for first time experience and nuget cache
$env:NUGET_PACKAGES = 'C:\nuget'
& setx NUGET_PACKAGES C:\nuget /M

$templates = @(
    'console',
    'classlib',
    'mstest',
    'xunit',
    'web',
    'mvc',
    'razor',
    'angular',
    'react',
    'reactredux',
    'webapi'
)

$templates | ForEach-Object {
    $template = $_
    $projectPath = Join-Path -Path C:\temp -ChildPath $template
    New-Item -Path $projectPath -Force -ItemType Directory
    Set-Location -Path $projectPath
    & $env:ProgramFiles\dotnet\dotnet.exe new $template
    if(Test-Path -Path '.\package.json'){
        & npm install
    }
}