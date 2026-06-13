# Service Disabler
Requires -RunAsAdministrator
$ScriptDir = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
. "$ScriptDir\Utils\Logging-Functions.ps1"

Write-Host "`n[>] Disabling Non-Essential Services" -ForegroundColor Cyan

$services = @("BITS", "MapsBroker", "lmhosts", "NcaSvc", "NetTcpPortSharing", "PNRPsvc", "p2psvc", "p2pimsvc", "PhoneSvc", "RemoteRegistry", "SNMPTRAP", "TrkWks", "upnphost", "WbioSrvc", "WMPNetworkSvc", "WSearch", "XblAuthManager", "XblGameSave")

foreach ($svc in $services) {
    Disable-Service $svc
}

Write-Host "`n[OK] Service disabling completed" -ForegroundColor Green
Read-Host "Press Enter to continue"
