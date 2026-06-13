# Install Gaming Applications
Requires -RunAsAdministrator
$ScriptDir = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
. "$ScriptDir\Utils\Logging-Functions.ps1"

Write-Host "`n[►] Installing Gaming Applications" -ForegroundColor Cyan

if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "[•] Installing Chocolatey..." -ForegroundColor Yellow
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

$apps = @("brave", "ddu", "obs-studio", "winrar", "openrgb", "hwinfo", "7zip", "gpu-z", "cpuz")
foreach ($app in $apps) {
    Write-Host "[•] Installing $app..." -ForegroundColor Yellow
    choco install $app -y --no-progress 2>$null
}

Write-Host "`n[✓] Application installation completed" -ForegroundColor Green
Read-Host "Press Enter"