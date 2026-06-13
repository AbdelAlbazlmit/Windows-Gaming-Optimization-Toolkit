# Power Optimization
Requires -RunAsAdministrator
$ScriptDir = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
. "$ScriptDir\Utils\Logging-Functions.ps1"

Write-Host "`n[►] Power Optimization" -ForegroundColor Cyan

powercfg /setactive 8c5e7fda-e8bf-45a9-aea8-5c1ab23882e9
powercfg /change usb-selective-suspend-timeout 0
powercfg /change disk-timeout-ac 0
powercfg /change standby-timeout-ac 0
powercfg /h off
powercfg /change processor-throttling-ac 100
powercfg /change monitor-timeout-ac 0

Set-RegistryValue -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ec" -Name "ACSettingIndex" -Value "100" -Type "DWORD"

Write-Host "`n[✓] Power optimization completed" -ForegroundColor Green
Read-Host "Press Enter"