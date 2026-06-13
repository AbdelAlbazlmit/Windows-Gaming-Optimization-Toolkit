# System Repair
Requires -RunAsAdministrator
$ScriptDir = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
. "$ScriptDir\Utils\Logging-Functions.ps1"

Write-Host "`n[>] System Repair Utilities" -ForegroundColor Cyan
Write-Host "[1] Run System File Checker (SFC)"
Write-Host "[2] Run DISM Repair"
Write-Host "[3] Fix Windows Update"
Write-Host "[4] Run All"

$choice = Read-Host "Select"
switch ($choice) {
    "1" { Write-Host "[*] Running SFC..." -ForegroundColor Yellow; sfc /scannow }
    "2" { Write-Host "[*] Running DISM..." -ForegroundColor Yellow; DISM /Online /Cleanup-Image /StartComponentCleanup }
    "3" { 
        Stop-Service -Name wuauserv -Force -ErrorAction SilentlyContinue
        Remove-Item -Path "C:\Windows\SoftwareDistribution\Download" -Recurse -Force -ErrorAction SilentlyContinue
        Start-Service -Name wuauserv -ErrorAction SilentlyContinue
        Write-Host "[OK] Windows Update fixed" -ForegroundColor Green
    }
    "4" { sfc /scannow; DISM /Online /Cleanup-Image /StartComponentCleanup }
}
Read-Host "Press Enter to continue"
