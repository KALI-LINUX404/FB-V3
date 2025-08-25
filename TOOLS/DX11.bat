@echo off
title DirectX 11 Installer / Repair Tool
color 1F

echo ========================================
echo Installing or Repairing DirectX 11
echo ========================================
echo.

:: Set temp directory
set "WORKDIR=%TEMP%\DirectX"
set "DXFILE=%TEMP%\directx_Jun2010_redist.exe"
set "DXURL=https://download.microsoft.com/download/1/4/7/1477F6BC-7E08-41A9-96E8-DF6DEB82B123/directx_Jun2010_redist.exe"

:: Download DirectX Redist
echo Downloading DirectX End-User Runtime (June 2010)...
powershell -Command "Invoke-WebRequest -Uri '%DXURL%' -OutFile '%DXFILE%'"
if %ERRORLEVEL% NEQ 0 (
    echo Failed to download DirectX installer.
    pause
    exit /b 1
)

:: Extract installer
echo Extracting files...
mkdir "%WORKDIR%" >nul 2>&1
"%DXFILE%" /Q /T:"%WORKDIR%"

:: Run DirectX setup
if exist "%WORKDIR%\DXSETUP.exe" (
    echo Running DirectX Setup...
    "%WORKDIR%\DXSETUP.exe" /silent
) else (
    echo ERROR: DXSETUP.exe not found after extraction.
    pause
    exit /b 1
)

:: Clean up
echo Cleaning up temporary files...
del "%DXFILE%" >nul 2>&1
rd /s /q "%WORKDIR%" >nul 2>&1

echo.
echo ========================================
echo DirectX 11 components installed/repaired
echo You may now restart your computer.
echo ========================================