################################################################################
##  File:  Install-SSDT.ps1
##  Team:  CI-Platform
##  Desc:  Install SQL Server Data Tools for Windows
################################################################################

Function Install-SSDT
{
    Param
    (
        [String]$Url,
        [String]$Name
    )

    $exitCode = -1

    try
    {
        Write-Host "Downloading $Name..."
        $FilePath = "${env:Temp}\$Name"

        Invoke-WebRequest -Uri $Url -OutFile $FilePath

        $Arguments = ('/install', 'INSTALLALL', '/passive', '/norestart' )

        Write-Host "Starting Install $Name..."
        $process = Start-Process -FilePath $FilePath -ArgumentList $Arguments -Wait -PassThru
        $exitCode = $process.ExitCode

        if ($exitCode -eq 0 -or $exitCode -eq 3010)
        {
            Write-Host -Object 'Installation successful'
            return $exitCode
        }
        else
        {
            Write-Host -Object "Non zero exit code returned by the installation process : $exitCode."
            exit $exitCode
        }
    }
    catch
    {
        Write-Host -Object "Failed to install the MSI $Name"
        Write-Host -Object $_.Exception.Message
        exit -1
    }
}

$exitCode = Install-SSDT -Url 'https://download.microsoft.com/download/9/B/7/9B73106C-6207-41D2-AA22-BAEE63B9EC63/SSDT-Setup-ENU.exe' -Name 'SSDT-Setup-ENU.exe'
exit $exitCode
