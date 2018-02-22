################################################################################
##  File:  Validate-Chrome.ps1
##  Team:  Automated Testing
##  Desc:  Validate Google Chrome installation.
################################################################################

$IEDriverPath = $env:IESeleniumDriverPath
$GeckoDriverPath = $env:GeckoSeleniumDriverPath
$ChromeDriverPath = $env:ChromeSeleniumDriverPath

if(($IEDriverPath -like "C:\SeleniumWebDrivers\IEDriver") -and ($GeckoDriverPath -like "C:\SeleniumWebDrivers\GeckoDriver") -and ($ChromeDriverPath -like "C:\SeleniumWebDrivers\ChromeDriver"))
{	
	
	Write-Host "IEDriver installed at "
	(Get-Item "C:\SeleniumWebDrivers\IEDriver\IEDriverServer.exe").VersionInfo
	
	
	Write-Host "Gecko Driver installed at "
	(Get-Item "C:\SeleniumWebDrivers\GeckoDriver\geckodriver.exe").VersionInfo
	
	
	Write-Host "Chrome Driver installed at "
	(Get-Item "C:\SeleniumWebDrivers\ChromeDriver\chromedriver.exe").VersionInfo
	
	exit 0
}
else
{
	Write-Host "Selenium Web Drivers are not installed."
    exit 1
}