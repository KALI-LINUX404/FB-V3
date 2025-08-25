@echo off
title DirectX 10 Installer
color 1F

echo ========================================
echo   Installing DirectX 10 (June 2010)
echo ========================================
echo.

:: Set working directory
set "WORKDIR=%TEMP%\DirectX"

:: Download DirectX End-User Runtime Web Installer
set "DXURL=https://download.microsoft.com/download/1/4/7/1477F6BC-7E08-41A9-96E8-DF6DEB82B123/directx_Jun2010_redist.exe"
set "DXFILE=%TEMP%\directx_jun2010_redist.exe"

echo Downloading DirectX installer...
powershell -Command "Invoke-WebRequest -Uri '%DXURL%' -OutFile '%DXFILE%'"
if %ERRORLEVEL% NEQ 0 (
    echo Failed to download DirectX installer.
    pause
    exit /b 1
)

echo Extracting installer...
mkdir "%WORKDIR%" >nul 2>&1
"%DXFILE%" /Q /T:"%WORKDIR%"

if exist "%WORKDIR%\DXSETUP.exe" (
    echo Running DirectX setup...
    "%WORKDIR%\DXSETUP.exe" /silent
) else (
    echo DXSETUP.exe not found. Extraction may have failed.
    pause
    exit /b 1
)

echo Cleaning up...
del "%DXFILE%" >nul 2>&1
rd /s /q "%WORKDIR%" >nul 2>&1

echo.
echo DirectX 10 installation complete!
echo Please restart your computer if prompted.