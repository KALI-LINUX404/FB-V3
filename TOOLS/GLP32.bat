@echo off
echo Downloading and installing GameLoop 32‑bit...
echo.

:: Step 1: Set the direct download URL for GameLoop 32‑bit installer
set "url=https://dosya.co/dyowka40yu9s/GLP_installer_1000218456_market.exe.html"

:: Step 2: Download the installer
echo Downloading installer from:
echo %url%
powershell -Command "Invoke-WebRequest -Uri '%url%' -OutFile '%~dp0GameLoop_32bit_installer.exe'"
IF ERRORLEVEL 1 (
  echo [Error] Download failed. Please check the link or your internet connection.
  pause
  exit /b 1
)

:: Step 3: Execute the installer
echo Running GameLoop 32‑bit installer...
start "" "%~dp0GameLoop_32bit_installer.exe"

echo Installation launched. Follow the on‑screen instructions.
echo Be sure to review antivirus prompts if any appear.