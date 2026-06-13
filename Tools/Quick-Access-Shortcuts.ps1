# Quick Access Shortcuts
Requires -RunAsAdministrator
$ScriptDir = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
. "$ScriptDir\Utils\Logging-Functions.ps1"

Write-Host "`n[►] Quick Access Shortcuts" -ForegroundColor Cyan
Write-Host "[1] Task Manager"
Write-Host "[2] System Information"
Write-Host "[3] Device Manager"
Write-Host "[4] Event Viewer"
Write-Host "[5] BIOS/UEFI"
Write-Host "[6] Performance Monitor"
Write-Host "[7] Registry Editor"
Write-Host "[8] Disk Management"

$choice = Read-Host "Select"
switch ($choice) {
    "1" { taskmgr.exe }
    "2" { msinfo32.exe }
    "3" { devmgmt.msc }
    "4" { eventvwr.msc }
    "5" { shutdown /r /fw /t 30 /c "Restarting to BIOS"; Write-Host "[i] Restart in 30 seconds..." }
    "6" { perfmon.exe }
    "7" { regedit.exe }
    "8" { diskmgmt.msc }
}
Read-Host "Press Enter"