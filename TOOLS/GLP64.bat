@echo off
echo Downloading and installing GameLoop 64‑bit...
echo.

REM === Step 1: Download GameLoop 64‑bit installer ===
set "url=https://gameloophub.com/gameloop-emulator/setup-installation/how-to-install-gameloop-64-bit-on-a-clean-windows-system-full-setup-guide/"
REM Note: Replace the URL above with a direct download link if you have one.
powershell -Command "Invoke-WebRequest -Uri '%url%' -OutFile '%~dp0GameLoop_64bit_installer.exe'"
IF ERRORLEVEL 1 (
  echo Download failed. Please check the link or your internet connection.
  pause
  exit /b 1
)

REM === Step 2: Run the installer as Administrator ===
echo Running installer...
start "" "%~dp0GameLoop_64bit_installer.exe"

echo Installation should now be in progress.
echo If prompted by UAC (User Account Control), click "Yes".