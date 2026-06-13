# Disk Cleanup
Requires -RunAsAdministrator
$ScriptDir = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
. "$ScriptDir\Utils\Logging-Functions.ps1"

Write-Host "`n[►] Disk Cleanup" -ForegroundColor Cyan

Clear-Directory "C:\Windows\Temp"
Clear-Directory "$env:LOCALAPPDATA\Temp"
Clear-Directory "C:\Windows\Prefetch"
Clear-Directory "C:\Windows\SoftwareDistribution\Download"

try { Clear-RecycleBin -Force -ErrorAction SilentlyContinue; Write-Host "[✓] Recycle Bin emptied" -ForegroundColor Green } catch {}

Write-Host "[✓] Disk cleanup completed" -ForegroundColor Green
Read-Host "Press Enter"