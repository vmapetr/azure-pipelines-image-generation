################################################################################
##  File:  Validate-NET471.ps1
##  Team:  CI-Build
##  Desc:  Validate .NET 4.7.1
################################################################################

# For reference, visit https://docs.microsoft.com/en-us/dotnet/framework/migration-guide/how-to-determine-which-versions-are-installed#ps_a

if(Get-ChildItem "HKLM:SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full\" | Get-ItemPropertyValue -Name Release | ForEach-Object { $_ -ge 461308 })
{
    $version = Get-ChildItem "HKLM:SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full\" | Get-ItemPropertyValue -Name Version
    Write-Host "Installed .Net version " $version
    exit 0
}
else {
    Write-Host ".Net 471 not found"
    exit 1
}