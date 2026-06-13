# Restore Point Manager
Requires -RunAsAdministrator
$ScriptDir = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
. "$ScriptDir\Utils\Logging-Functions.ps1"

Write-Host "`n[>] System Restore Point Manager" -ForegroundColor Cyan
Write-Host "[1] Create Restore Point"
Write-Host "[2] List Recent Points"
Write-Host "[3] Open System Restore"

$choice = Read-Host "Select"
switch ($choice) {
    "1" { 
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        Checkpoint-Computer -Description "Gaming Optimization - $timestamp" -RestorePointType "MODIFY_SETTINGS"
        Write-Host "[OK] Restore point created" -ForegroundColor Green
    }
    "2" { 
        Get-ComputerRestorePoint -ErrorAction SilentlyContinue | Sort-Object CreationTime -Descending | Select-Object -First 10 | ForEach-Object { Write-Host "[*] $($_.Description) - $($_.CreationTime)" -ForegroundColor Cyan }
    }
    "3" { Start-Process "rstrui.exe" }
}
Read-Host "Press Enter to continue"
