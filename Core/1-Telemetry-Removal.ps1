# Telemetry Removal
Requires -RunAsAdministrator
$ScriptDir = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
. "$ScriptDir\Utils\Logging-Functions.ps1"

Write-Host "`n[►] Telemetry Removal" -ForegroundColor Cyan
Backup-Registry "HKLM\SYSTEM\CurrentControlSet\Services\DiagTrack" "DiagTrack"

Disable-Service "DiagTrack"
Disable-Service "dmwappushservice"

Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowDiagnosticData" -Value "0" -Type "DWORD"
Set-RegistryValue -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "ContentDeliveryAllowed" -Value "0" -Type "DWORD"
Set-RegistryValue -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name "Enabled" -Value "0" -Type "DWORD"
Set-RegistryValue -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "PublishUserActivities" -Value "0" -Type "DWORD"

Write-Host "[✓] Telemetry removal completed" -ForegroundColor Green
Read-Host "Press Enter"