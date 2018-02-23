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

$content = @"

## Selenium Web Drivers

### Chrome Driver 2.35

_Environment:_
ChromeSeleniumDriverPath : Contains location of chromedriver.exe

### Gecko driver 0.19.1

_Environment:_
GeckoSeleniumDriverPath : Contains location of geckodriver.exe

### IE driver 3.8.0.0

_Environment:_
IESeleniumDriverPath : Contains location of IEDriverServer.exe

"@
Add-ContentToMarkdown -Content $content

exit 0

