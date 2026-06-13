# Install Runtimes
Requires -RunAsAdministrator
$ScriptDir = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
. "$ScriptDir\Utils\Logging-Functions.ps1"

Write-Host "`n[►] Installing Runtime Libraries" -ForegroundColor Cyan

Write-Host "[•] Installing DirectX..." -ForegroundColor Yellow
choco install directx -y --no-progress 2>$null

Write-Host "[•] Installing Visual Studio C++..." -ForegroundColor Yellow
choco install vcredist140 vcredist2015 vcredist2013 -y --no-progress 2>$null

Write-Host "[•] Installing .NET Framework..." -ForegroundColor Yellow
choco install dotnet-framework -y --no-progress 2>$null

Write-Host "`n[✓] Runtime installation completed" -ForegroundColor Green
Read-Host "Press Enter"