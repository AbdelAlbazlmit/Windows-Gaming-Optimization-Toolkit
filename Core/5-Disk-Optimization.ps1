# Disk Optimization
Requires -RunAsAdministrator
$ScriptDir = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
. "$ScriptDir\Utils\Logging-Functions.ps1"

Write-Host "`n[►] Disk Optimization" -ForegroundColor Cyan

fsutil behavior set disabledeletenotify 0
fsutil 8dot3name set 1
fsutil behavior set disablelastaccess 1
Disable-Service "WSearch"

Set-RegistryValue -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "PrefetchParameters" -Value "3" -Type "DWORD"

Write-Host "`n[✓] Disk optimization completed" -ForegroundColor Green
Read-Host "Press Enter"