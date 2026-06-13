# Main launcher for Windows Gaming Optimization Toolkit
# Requires Administrator privileges

if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
    Write-Host "[ERROR] This script requires Administrator privileges" -ForegroundColor Red
    exit 1
}

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
. "$ScriptDir\Utils\Logging-Functions.ps1"

function Show-MainMenu {
    Clear-Host
    Write-Host ""
    Write-Host "=====================================================" -ForegroundColor Cyan
    Write-Host "  WINDOWS GAMING OPTIMIZATION TOOLKIT v1.0.0" -ForegroundColor Cyan
    Write-Host "    Aggressive Performance Tuning Suite" -ForegroundColor Cyan
    Write-Host "=====================================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "[!] WARNING: Aggressive system modifications" -ForegroundColor Yellow
    Write-Host "[!] Always create restore points before running" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "=====================================================" -ForegroundColor Green
    Write-Host "QUICK PROFILES" -ForegroundColor Green
    Write-Host "=====================================================" -ForegroundColor Green
    Write-Host "[1] GAMING PROFILE (All Optimizations)"
    Write-Host "[2] PERFORMANCE PROFILE (Conservative)"
    Write-Host "[3] REPAIR & MAINTENANCE"
    Write-Host ""
    Write-Host "=====================================================" -ForegroundColor Green
    Write-Host "CORE OPTIMIZATIONS" -ForegroundColor Green
    Write-Host "=====================================================" -ForegroundColor Green
    Write-Host "[4] Telemetry Removal"
    Write-Host "[5] Service Disabler"
    Write-Host "[6] Power Optimization"
    Write-Host "[7] Network Optimization"
    Write-Host "[8] Disk Optimization"
    Write-Host "[9] GPU/CPU Tuning"
    Write-Host ""
    Write-Host "=====================================================" -ForegroundColor Green
    Write-Host "APPLICATIONS & TOOLS" -ForegroundColor Green
    Write-Host "=====================================================" -ForegroundColor Green
    Write-Host "[10] Install Gaming Apps"
    Write-Host "[11] Install/Update Drivers"
    Write-Host "[12] Install Runtimes"
    Write-Host "[13] Timer Resolution Toggler"
    Write-Host "[14] DNS Switcher"
    Write-Host "[15] Disk Cleanup"
    Write-Host "[16] Restore Point Manager"
    Write-Host "[17] System Repair"
    Write-Host "[18] Quick Access Shortcuts"
    Write-Host "[19] System Diagnostics"
    Write-Host ""
    Write-Host "[0] EXIT" -ForegroundColor Red
    Write-Host "=====================================================" -ForegroundColor Green
}

function Run-Script {
    param([string]$ScriptPath, [string]$Name)
    
    if (Test-Path $ScriptPath) {
        Write-Host ""
        Write-Host "[>] Running: $Name" -ForegroundColor Cyan
        & $ScriptPath
    } else {
        Write-Host "[ERROR] Script not found: $ScriptPath" -ForegroundColor Red
    }
}

do {
    Show-MainMenu
    $choice = Read-Host "`nSelect option"
    
    switch ($choice) {
        "0" { exit 0 }
        "1" { 
            Write-Host "[>] Running Gaming Profile..." -ForegroundColor Cyan
            & "$ScriptDir\Tools\Restore-Point-Manager.ps1"
            & "$ScriptDir\Core\1-Telemetry-Removal.ps1"
            & "$ScriptDir\Core\2-Service-Disabler.ps1"
            & "$ScriptDir\Core\3-Power-Optimization.ps1"
            & "$ScriptDir\Core\4-Network-Optimization.ps1"
            & "$ScriptDir\Core\5-Disk-Optimization.ps1"
            & "$ScriptDir\Tools\Disk-Cleanup.ps1"
        }
        "4" { Run-Script "$ScriptDir\Core\1-Telemetry-Removal.ps1" "Telemetry Removal" }
        "5" { Run-Script "$ScriptDir\Core\2-Service-Disabler.ps1" "Service Disabler" }
        "6" { Run-Script "$ScriptDir\Core\3-Power-Optimization.ps1" "Power Optimization" }
        "7" { Run-Script "$ScriptDir\Core\4-Network-Optimization.ps1" "Network Optimization" }
        "8" { Run-Script "$ScriptDir\Core\5-Disk-Optimization.ps1" "Disk Optimization" }
        "9" { Run-Script "$ScriptDir\Core\6-GPU-CPU-Tuning.ps1" "GPU/CPU Tuning" }
        "10" { Run-Script "$ScriptDir\Apps\Install-GamingApps.ps1" "Gaming Apps" }
        "11" { Run-Script "$ScriptDir\Apps\Install-Drivers.ps1" "Drivers" }
        "12" { Run-Script "$ScriptDir\Apps\Install-Runtimes.ps1" "Runtimes" }
        "13" { Run-Script "$ScriptDir\Tools\Timer-Resolution-Toggler.ps1" "Timer Resolution" }
        "14" { Run-Script "$ScriptDir\Tools\DNS-Switcher.ps1" "DNS Switcher" }
        "15" { Run-Script "$ScriptDir\Tools\Disk-Cleanup.ps1" "Disk Cleanup" }
        "16" { Run-Script "$ScriptDir\Tools\Restore-Point-Manager.ps1" "Restore Points" }
        "17" { Run-Script "$ScriptDir\Tools\System-Repair.ps1" "System Repair" }
        "18" { Run-Script "$ScriptDir\Tools\Quick-Access-Shortcuts.ps1" "Quick Access" }
        "19" { Run-Script "$ScriptDir\Utils\System-Diagnostics.ps1" "Diagnostics" }
        default { 
            Write-Host "[ERROR] Invalid option" -ForegroundColor Red
            Read-Host "Press Enter"
        }
    }
} while ($true)
