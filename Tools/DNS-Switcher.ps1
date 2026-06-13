# DNS Switcher
Requires -RunAsAdministrator
$ScriptDir = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
. "$ScriptDir\Utils\Logging-Functions.ps1"

Write-Host "`n[>] DNS Switcher" -ForegroundColor Cyan
Write-Host "[1] Google DNS (8.8.8.8, 8.8.4.4)"
Write-Host "[2] Cloudflare DNS (1.1.1.1, 1.0.0.1)"
Write-Host "[3] Quad9 DNS (9.9.9.9, 149.112.112.112)"
Write-Host "[4] Reset to DHCP"

$choice = Read-Host "Select"
$adapter = Get-NetAdapter | Where-Object {$_.Status -eq 'Up'} | Select-Object -First 1

if ($adapter) {
    switch ($choice) {
        "1" { Set-DnsClientServerAddress -InterfaceIndex $adapter.InterfaceIndex -ServerAddresses ("8.8.8.8", "8.8.4.4"); Write-Host "[OK] Set to Google DNS" -ForegroundColor Green }
        "2" { Set-DnsClientServerAddress -InterfaceIndex $adapter.InterfaceIndex -ServerAddresses ("1.1.1.1", "1.0.0.1"); Write-Host "[OK] Set to Cloudflare DNS" -ForegroundColor Green }
        "3" { Set-DnsClientServerAddress -InterfaceIndex $adapter.InterfaceIndex -ServerAddresses ("9.9.9.9", "149.112.112.112"); Write-Host "[OK] Set to Quad9 DNS" -ForegroundColor Green }
        "4" { Set-DnsClientServerAddress -InterfaceIndex $adapter.InterfaceIndex -ResetServerAddresses; Write-Host "[OK] Reset to DHCP" -ForegroundColor Green }
    }
}
Read-Host "Press Enter to continue"
