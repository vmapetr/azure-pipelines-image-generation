################################################################################
##  File:  Install-SeleniumWebDrivers.ps1
##  Team:  Automated Testing
##  Desc:  Install Selenium Web Drivers
################################################################################

Invoke-WebRequest -UseBasicParsing -Uri "https://seleniumwebdrivers.blob.core.windows.net/seleniumwebdrivers/SeleniumWebDrivers.zip" -OutFile SeleniumWebDrivers.zip

Expand-Archive -Path SeleniumWebDrivers.zip -DestinationPath "C:\" -Force

Remove-Item SeleniumWebDrivers.zip

setx IESeleniumDriverPath "C:\SeleniumWebDrivers\IEDriver" /M
setx GeckoSeleniumDriverPath "C:\SeleniumWebDrivers\GeckoDriver" /M
setx ChromeSeleniumDriverPath "C:\SeleniumWebDrivers\ChromeDriver" /M


$chromedriverversion = Get-Content -Path "C:\SeleniumWebDrivers\ChromeDriver\versioninfo.txt"
$geckodriverversion = Get-Content -Path "C:\SeleniumWebDrivers\GeckoDriver\versioninfo.txt"
$iedriverversion = Get-Content -Path "C:\SeleniumWebDrivers\IEDriver\versioninfo.txt"

$content = @"

## Selenium Web Drivers

### Chrome Driver

_version:_
$(chromedriverversion)

_Environment:_
ChromeSeleniumDriverPath : Contains location of chromedriver.exe

### Gecko driver

_version:_
$(geckodriverversion)

_Environment:_
GeckoSeleniumDriverPath : Contains location of geckodriver.exe

### IE driver

_version:_
$(iedriverversion)

_Environment:_
IESeleniumDriverPath : Contains location of IEDriverServer.exe

"@
Add-ContentToMarkdown -Content $content

exit 0

