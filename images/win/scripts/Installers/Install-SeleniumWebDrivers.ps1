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

exit 0

