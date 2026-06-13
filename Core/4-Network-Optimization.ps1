# Network Optimization
Requires -RunAsAdministrator
$ScriptDir = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
. "$ScriptDir\Utils\Logging-Functions.ps1"

Write-Host "`n[>] Network Optimization" -ForegroundColor Cyan

Backup-Registry "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" "NetworkTCP"

Set-RegistryValue -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "Tcp1323Opts" -Value "1" -Type "DWORD"
Set-RegistryValue -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TcpAckFrequency" -Value "1" -Type "DWORD"
Set-RegistryValue -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TcpDelAckTicks" -Value "0" -Type "DWORD"
Set-RegistryValue -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TcpRecvSegmentCoalescing" -Value "0" -Type "DWORD"
Set-RegistryValue -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "SackOpts" -Value "0" -Type "DWORD"
Set-RegistryValue -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -Value "4294967295" -Type "DWORD"

Write-Host "`n[OK] Network optimization completed" -ForegroundColor Green
Read-Host "Press Enter to continue"
