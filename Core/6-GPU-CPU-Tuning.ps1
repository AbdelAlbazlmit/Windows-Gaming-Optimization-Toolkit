# GPU/CPU Tuning
Requires -RunAsAdministrator
$ScriptDir = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
. "$ScriptDir\Utils\Logging-Functions.ps1"

Write-Host "`n[►] GPU/CPU Tuning" -ForegroundColor Cyan

Set-RegistryValue -Path "HKCU:\Software\Microsoft\GameBar" -Name "AutoGameModeEnabled" -Value "1" -Type "DWORD"
Set-RegistryValue -Path "HKCU:\Software\Microsoft\GameBar" -Name "GamePanelStartupTipIndex" -Value "3" -Type "DWORD"

Write-Host "`n[✓] GPU/CPU tuning completed" -ForegroundColor Green
Read-Host "Press Enter"