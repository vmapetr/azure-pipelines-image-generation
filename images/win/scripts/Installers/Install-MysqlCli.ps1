################################################################################
##  File:  Install-MysqlCli.ps1
##  Team:  ReleaseManagement
##  Desc:  Install Mysql CLI
################################################################################


## Download different mysql jar on the basis of platform version
if([Environment]::Is64BitProcess)
{
    $uri = 'https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.21-winx64.zip'
    $mysqlPath = 'C:\mysql-5.7.21-winx64\bin'
    $visualcDepdendencyUri = 'http://download.microsoft.com/download/0/5/6/056dcda9-d667-4e27-8001-8a0c6971d6b1/vcredist_x64.exe'
}
else
{
    $uri = 'https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.21-win32.zip'
    $mysqlPath = 'C:\mysql-5.7.21-winx64\bin'
    $visualcDepdendencyUri = 'http://download.microsoft.com/download/0/5/6/056dcda9-d667-4e27-8001-8a0c6971d6b1/vcredist_x86.exe'
}

# Get the visual c++ redistibutable package.
Invoke-WebRequest -UseBasicParsing -Uri $visualcDepdendencyUri -OutFile 'vcredist.exe'

# Installing visual c++ redistibutable
Start-Process -FilePath  'vcredist.exe' '/S'

# Get the latest mysql command line tools .
Invoke-WebRequest -UseBasicParsing -Uri $uri -OutFile mysql.zip

# Expand the zip
Expand-Archive -Path mysql.zip -DestinationPath "C:\" -Force

# Deleting zip folder
Remove-Item -Recurse -Force mysql.zip
Remove-Item -Recurse -Force 'vcredist.exe'

# Getting system environment path
$systemPath = [Environment]::GetEnvironmentVariable('Path', [System.EnvironmentVariableTarget]::Machine)

$systemPath += ';' + $mysqlPath

# Adding mysql in system environment path
[Environment]::SetEnvironmentVariable('Path', $systemPath, [System.EnvironmentVariableTarget]::Machine)