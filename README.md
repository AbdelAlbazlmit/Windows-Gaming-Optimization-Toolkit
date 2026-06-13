# Windows Gaming Optimization Toolkit 🎮

A comprehensive PowerShell-based toolkit for aggressive Windows optimization, gaming performance tuning, and latency reduction. Designed for advanced users on throwaway/experimental bench setups.

**⚠️ WARNING**: This toolkit applies aggressive system modifications. Use only on test machines or systems where you understand the risks. Always create restore points before running.

## Features

### 🚀 Core Optimizations
- **Telemetry Removal** - Disable Windows telemetry and data collection
- **CPU/GPU Performance Tuning** - Power plan optimization, GPU driver tweaks
- **RAM Management** - Memory optimization and cache clearing
- **Network Optimization** - DNS switching (Google/Cloudflare), TCP tweaks
- **Disk Optimization** - SSD TRIM, defrag, cleanup utilities
- **Power Settings** - USB power saving disabled, hardware acceleration controls
- **Service Disabling** - Remove non-essential Windows services

### 📦 Application Management
- **App Installer** - One-click installation of gaming/performance apps
- **Driver Management** - Automated driver installation and updates
- **Runtime Installers** - DirectX, Visual Studio C++, .NET Framework

### 🔧 System Tools
- **Quick Shortcuts** - Fast access to Task Manager, System Info, BIOS, Event Viewer
- **Repair Utilities** - System file checks, Windows Update fixes
- **Restore Points** - Automated backup creation before changes
- **Disk Cleanup** - Temp files, cache, recycle bin cleanup
- **Timer Resolution Toggler** - For extreme latency reduction

## Quick Start

```powershell
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
.\Launch-OptimizationToolkit.ps1
```

## File Structure
```
Core/
  ├── 1-Telemetry-Removal.ps1
  ├── 2-Service-Disabler.ps1
  ├── 3-Power-Optimization.ps1
  ├── 4-Network-Optimization.ps1
  ├── 5-Disk-Optimization.ps1
  └── 6-GPU-CPU-Tuning.ps1
Apps/
  ├── Install-GamingApps.ps1
  ├── Install-Drivers.ps1
  └── Install-Runtimes.ps1
Tools/
  ├── Timer-Resolution-Toggler.ps1
  ├── DNS-Switcher.ps1
  ├── Disk-Cleanup.ps1
  ├── Restore-Point-Manager.ps1
  ├── System-Repair.ps1
  └── Quick-Access-Shortcuts.ps1
Utils/
  ├── Logging-Functions.ps1
  └── System-Diagnostics.ps1
```

## ⚠️ Disclaimer
Use at your own risk. Not liable for system damage or data loss.