################################################################################
##  File:  Run-Antivirus.ps1
##  Team:  CI-Platform
##  Desc:  Run a full antivirus scan.
##         Run right after cleanup before we sysprep
################################################################################

Write-Host "Run antivirus"
Push-Location "C:\Program Files\Windows Defender"
# Full Scan
.\MpCmdRun.exe -Scan -ScanType 2
Pop-Location

Write-Host "Disable Antivirus"
Set-MpPreference -DisableRealtimeMonitoring $true `
                -DisableBehaviorMonitoring $true `
                -DisableIOAVProtection $true `
                -DisableIntrusionPreventionSystem $true `
                -DisableScriptScanning $true `
                -DisableArchiveScanning $true `
                -DisableCatchupFullScan $true `
                -DisableCatchupQuickScan $true `
                -DisableEmailScanning $true `
                -DisableRemovableDriveScanning $true `
                -DisableRestorePoint $true `
                -ScanAvgCPULoadFactor 0 `
                -ExclusionPath "D:\", "C:\"