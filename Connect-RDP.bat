@echo off
title RDP Auto-Connect
color 0A

set HOST=100.81.14.98
set USER=Xmon4U

echo ============================================
echo   RDP Auto-Connect ^| Host: %HOST%
echo ============================================
echo.

:retry
echo [%TIME%] Checking connection to %HOST%:3389 ...

powershell -NoProfile -Command "exit (Test-NetConnection -ComputerName '%HOST%' -Port 3389 -InformationLevel Quiet -WarningAction SilentlyContinue)"

if %ERRORLEVEL%==0 (
    echo.
    echo [OK] Port 3389 is OPEN! Launching Remote Desktop...
    echo.
    cmdkey /generic:TERMSRV/%HOST% /user:%USER% /pass:4725 >nul 2>&1
    mstsc /v:%HOST%
    exit /b 0
) else (
    echo [WAIT] Not ready yet. Retrying in 10 seconds...
    timeout /t 10 /nobreak >nul
    goto retry
)
