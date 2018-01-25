################################################################################
##  File:  Validate-JavaTools.ps1
##  Team:  CI-X
##  Desc:  Validate various JDKs and java tools
################################################################################

if((Get-Command -Name 'java') -and (Get-Command -Name 'mvn') -and (Get-Command -Name 'ant') -and (Get-Command -Name 'gradle'))
{
    Write-Host "Java $(java -version) on path"
    Write-Host "Maven $(mvn -version) on path"
    Write-Host "Ant $(ant -version) on path"
    Write-Host "Gradle $(gradle -version) on path"
    exit 0
}
else
{
    Write-Host "one of Java,Maven,Ant,Gradle is not on path."
    exit 1
}