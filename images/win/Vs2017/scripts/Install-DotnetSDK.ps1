################################################################################
##  File:  Install-DotnetSDK.ps1
##  Team:  CI-Build
##  Desc:  Install all released versions of the dotnet sdk and populate package
##         cache.  Should run after VS and Node
################################################################################

# ensure temp
New-Item -Path C:\Temp -Force -ItemType Directory

Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/dotnet/core/master/release-notes/releases.json' -UseBasicParsing -OutFile 'dotnet-releases.json'
$dotnetReleases = Get-Content -Path 'dotnet-releases.json' | ConvertFrom-Json
$dotnetReleases = $dotnetReleases | Sort-Object -Property 'version-runtime'

Invoke-WebRequest -Uri 'https://dot.net/v1/dotnet-install.ps1' -UseBasicParsing -OutFile 'dotnet-install.ps1'

$dotnetReleases | ForEach-Object {
    $release = $_
    $sdkVersion = $release.'version-sdk'
    if(!$sdkVersion.Contains('preview'))
    {
        .\dotnet-install.ps1 -Architecture x64 -Version $sdkVersion -InstallDir $(Join-Path -Path $env:ProgramFiles -ChildPath 'dotnet')
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