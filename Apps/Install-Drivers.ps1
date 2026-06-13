# Driver Installation
Requires -RunAsAdministrator
$ScriptDir = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
. "$ScriptDir\Utils\Logging-Functions.ps1"

Write-Host "`n[>] Driver Installation Manager" -ForegroundColor Cyan
Write-Host "[1] NVIDIA GPU Drivers"
Write-Host "[2] AMD GPU Drivers"
Write-Host "[3] Intel Chipset"
Write-Host "[4] Realtek Audio"

$choice = Read-Host "Select"
switch ($choice) {
    "1" { Start-Process "https://www.nvidia.com/Download/"; Write-Host "[i] Download from NVIDIA website" }
    "2" { Start-Process "https://www.amd.com/en/support"; Write-Host "[i] Download from AMD website" }
    "3" { choco install intel-chipset -y --no-progress; Write-Host "[OK] Intel Chipset installed" }
    "4" { choco install realtek-audio -y --no-progress; Write-Host "[OK] Realtek Audio installed" }
}
Read-Host "Press Enter to continue"
