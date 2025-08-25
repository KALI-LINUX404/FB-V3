@echo off
title DirectX Runtime Installer
color 1F

echo ========================================
echo Installing DirectX End-User Runtime (June 2010)
echo ========================================
echo.

setlocal

:: Set variables
set "WORKDIR=%TEMP%\DirectX"
set "DXURL=https://download.microsoft.com/download/1/4/7/1477F6BC-7E08-41A9-96E8-DF6DEB82B123/directx_Jun2010_redist.exe"
set "DXFILE=%TEMP%\directx_jun2010_redist.exe"

:: Download DirectX redistributable installer
echo Downloading DirectX installer...
powershell -Command "Invoke-WebRequest -Uri '%DXURL%' -OutFile '%DXFILE%'"
if errorlevel 1 (
    echo Error: Failed to download DirectX installer.
    pause
    exit /b 1
)

:: Create temporary folder
mkdir "%WORKDIR%" >nul 2>&1

:: Extract files
echo Extracting installer files...
"%DXFILE%" /Q /T:"%WORKDIR%"
if not exist "%WORKDIR%\DXSETUP.exe" (
    echo Error: Extraction failed (DXSETUP.exe missing).
    pause
    exit /b 1
)

:: Run DirectX setup silently
echo Running DirectX Setup...
"%WORKDIR%\DXSETUP.exe" /silent

:: Clean up temporary files
echo Cleaning up...
del "%DXFILE%" >nul 2>&1
rd /s /q "%WORKDIR%" >nul 2>&1

echo.
echo ========================================
echo DirectX installation completed.
echo Please restart your computer if needed.
echo ========================================