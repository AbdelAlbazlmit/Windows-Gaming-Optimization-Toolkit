# System Diagnostics
Requires -RunAsAdministrator
$ScriptDir = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
. "$ScriptDir\Utils\Logging-Functions.ps1"

Write-Host "`n[>] System Diagnostics" -ForegroundColor Cyan
Write-SystemInfo

Write-Host "`n=====================================================" -ForegroundColor Cyan
Write-Host "CPU INFORMATION" -ForegroundColor Cyan
Write-Host "=====================================================" -ForegroundColor Cyan
$cpu = Get-CimInstance -ClassName Win32_Processor
Write-Host "Cores: $($cpu.NumberOfCores) | Threads: $($cpu.ThreadCount) | Speed: $($cpu.MaxClockSpeed) MHz" -ForegroundColor White

Write-Host "`n=====================================================" -ForegroundColor Cyan
Write-Host "MEMORY INFORMATION" -ForegroundColor Cyan
Write-Host "=====================================================" -ForegroundColor Cyan
$memory = Get-CimInstance -ClassName Win32_ComputerSystem
$totalRAM = [math]::Round($memory.TotalPhysicalMemory / 1GB, 2)
Write-Host "Total RAM: $totalRAM GB" -ForegroundColor White

Write-Host "`n=====================================================" -ForegroundColor Cyan
Write-Host "DISK INFORMATION" -ForegroundColor Cyan
Write-Host "=====================================================" -ForegroundColor Cyan
Get-Volume | Where-Object {$_.DriveType -eq 'Fixed'} | ForEach-Object {
    $usedSpace = $_.Size - $_.SizeRemaining
    $percentUsed = [math]::Round(($usedSpace / $_.Size) * 100, 2)
    Write-Host "Drive $($_.DriveLetter): $([math]::Round($_.SizeRemaining / 1GB, 2)) GB free of $([math]::Round($_.Size / 1GB, 2)) GB ($percentUsed% used)" -ForegroundColor White
}

Read-Host "Press Enter to continue"
