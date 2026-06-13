# Timer Resolution Toggler
Requires -RunAsAdministrator
$ScriptDir = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
. "$ScriptDir\Utils\Logging-Functions.ps1"

Write-Host "`n[>] Timer Resolution Toggler" -ForegroundColor Cyan
Write-Host "[1] 0.5ms (Maximum Performance)"
Write-Host "[2] 1.0ms (Balanced)"
Write-Host "[3] Reset to Default"

$choice = Read-Host "Select"
switch ($choice) {
    "1" {
        bcdedit /set useplatformclock yes
        bcdedit /set tscsyncpolicy enhanced
        bcdedit /set disabledynamictick yes
        Write-Host "[OK] Timer resolution set to 0.5ms" -ForegroundColor Green
    }
    "2" {
        bcdedit /set useplatformclock no
        bcdedit /set tscsyncpolicy default
        Write-Host "[OK] Timer resolution set to 1.0ms" -ForegroundColor Green
    }
    "3" {
        bcdedit /deletevalue useplatformclock
        bcdedit /deletevalue tscsyncpolicy
        bcdedit /deletevalue disabledynamictick
        Write-Host "[OK] Timer resolution reset" -ForegroundColor Green
    }
}
Read-Host "Press Enter to continue"
