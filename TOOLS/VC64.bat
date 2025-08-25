@echo off
title Install Visual C++ Redistributable (x64)
color 1F

echo ============================================
echo Downloading and Installing VC++ Redistributable (x64)
echo ============================================
echo.

setlocal

:: Set variables
set "WORKDIR=%TEMP%\vcredist"
set "URL=https://aka.ms/vs/17/release/vc_redist.x64.exe"
set "FILE=%TEMP%\vc_redist.x64.exe"

:: Create temp folder
mkdir "%WORKDIR%" >nul 2>&1

echo Downloading VC++ Redistributable x64...
powershell -Command "Invoke-WebRequest -Uri '%URL%' -OutFile '%FILE%'"
if errorlevel 1 (
    echo ERROR: Download failed. Check your internet connection.
    pause
    exit /b 1
)

echo Installing VC++ Redistributable silently...
"%FILE%" /install /quiet /norestart

echo Cleaning up files...
del "%FILE%" >nul 2>&1
rd /s /q "%WORKDIR%" >nul 2>&1

echo.
echo Installation complete.
echo If needed, please restart your computer.