@echo off
REM Windows Gaming Optimization Toolkit - Batch Launcher
REM This script automatically launches PowerShell and runs the optimization toolkit

setlocal enabledelayedexpansion

REM Get the directory where this batch file is located
set "SCRIPT_DIR=%~dp0"

REM Display banner
cls
color 0A
echo.
echo ╔═══════════════════════════════════════════════════════════════╗
echo ║     WINDOWS GAMING OPTIMIZATION TOOLKIT v1.0.0               ║
echo ║        Launching PowerShell Interface...                      ║
echo ╚═══════════════════════════════════════════════════════════════╝
echo.
echo [*] Script Directory: %SCRIPT_DIR%
echo [*] Checking PowerShell availability...
echo.

REM Check if PowerShell exists
where powershell >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERROR] PowerShell not found on this system!
    pause
    exit /b 1
)

echo [✓] PowerShell found. Launching toolkit...
echo.
timeout /t 2 /nobreak

REM Launch PowerShell with the toolkit
REM Using -WindowStyle Normal to ensure it shows properly
powershell -NoProfile -ExecutionPolicy Bypass -WindowStyle Normal -Command "Set-Location '%SCRIPT_DIR%'; & '.\Launch-OptimizationToolkit.ps1'"

REM Keep window open if there was an error
if %errorLevel% neq 0 (
    echo.
    echo [ERROR] An error occurred while running the toolkit.
    echo Press Enter to close this window.
    pause
)

exit /b 0
