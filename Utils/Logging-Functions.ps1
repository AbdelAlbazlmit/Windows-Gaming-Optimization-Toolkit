# Logging and utility functions

$LogDir = "$env:APPDATA\GamingOptimizationLogs"
if (-not (Test-Path $LogDir)) { New-Item -ItemType Directory -Path $LogDir -Force | Out-Null }
$LogFile = "$LogDir\optimization_$(Get-Date -Format 'yyyy-MM-dd').log"

function Log-Message {
    param([string]$Message, [string]$Level = "Info")
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Add-Content -Path $LogFile -Value "[$timestamp] [$Level] $Message" -Force
}

function Set-RegistryValue {
    param([string]$Path, [string]$Name, [string]$Value, [string]$Type = "String")
    try {
        if (-not (Test-Path $Path)) { New-Item -Path $Path -Force | Out-Null }
        Set-ItemProperty -Path $Path -Name $Name -Value $Value -Type $Type -Force
        Write-Host "[✓] $Name = $Value" -ForegroundColor Green
        Log-Message "Registry: $Path\$Name = $Value"
        return $true
    } catch {
        Write-Host "[ERROR] Failed to set $Name: $_" -ForegroundColor Red
        return $false
    }
}

function Disable-Service {
    param([string]$ServiceName)
    try {
        $service = Get-Service -Name $ServiceName -ErrorAction SilentlyContinue
        if ($service) {
            Stop-Service -Name $ServiceName -Force -ErrorAction SilentlyContinue
            Set-Service -Name $ServiceName -StartupType Disabled
            Write-Host "[✓] Service disabled: $ServiceName" -ForegroundColor Green
            Log-Message "Service disabled: $ServiceName"
            return $true
        }
    } catch { Write-Host "[•] Could not disable $ServiceName" -ForegroundColor Yellow }
    return $false
}

function Backup-Registry {
    param([string]$Path, [string]$Name)
    $BackupDir = "$env:APPDATA\GamingOptimizationBackups"
    if (-not (Test-Path $BackupDir)) { New-Item -ItemType Directory -Path $BackupDir -Force | Out-Null }
    $timestamp = Get-Date -Format "yyyy-MM-dd_HHmmss"
    $backupFile = "$BackupDir\${Name}_${timestamp}.reg"
    try {
        reg export $Path $backupFile /y | Out-Null
        Write-Host "[✓] Backup created" -ForegroundColor Green
        Log-Message "Registry backed up: $Path"
    } catch { Write-Host "[•] Backup skipped" -ForegroundColor Gray }
}

function Clear-Directory {
    param([string]$Path, [string]$Filter = "*")
    if (Test-Path $Path) {
        try {
            Remove-Item -Path "$Path\$Filter" -Force -Recurse -ErrorAction SilentlyContinue
            Write-Host "[✓] Cleaned: $Path" -ForegroundColor Green
        } catch { Write-Host "[•] Could not fully clear $Path" -ForegroundColor Yellow }
    }
}

function Get-SystemInfo {
    return @{
        Processor = (Get-CimInstance -ClassName Win32_Processor).Name
        RAM = "$([math]::Round((Get-CimInstance -ClassName Win32_ComputerSystem).TotalPhysicalMemory / 1GB)) GB"
        OS = (Get-CimInstance -ClassName Win32_OperatingSystem).Caption
    }
}

function Write-SystemInfo {
    $info = Get-SystemInfo
    Write-Host "`n╔════════════════════════════════════════╗" -ForegroundColor Cyan
    Write-Host "║        SYSTEM INFORMATION              ║" -ForegroundColor Cyan
    Write-Host "╚════════════════════════════════════════╝" -ForegroundColor Cyan
    Write-Host "OS: $($info.OS)" -ForegroundColor White
    Write-Host "Processor: $($info.Processor)" -ForegroundColor White
    Write-Host "RAM: $($info.RAM)" -ForegroundColor White
}