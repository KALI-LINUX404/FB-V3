@echo off
title Fix GameLoop Stuck at 98 Percent
color 1F

echo ========================================
echo Fixing GameLoop 32-bit stuck at 98%%
echo ========================================
echo.

:: Kill GameLoop and Tencent processes
echo Closing GameLoop processes...
taskkill /f /im AndroidEmulator.exe >nul 2>&1
taskkill /f /im aow_exe.exe >nul 2>&1
taskkill /f /im GameLoop.exe >nul 2>&1
taskkill /f /im QQExternal.exe >nul 2>&1
echo.

:: Delete cache/temp files
echo Deleting cache and temp files...
rd /s /q "%TEMP%\TxGameDownload"
rd /s /q "%TEMP%\TxGameAssistant"
rd /s /q "%USERPROFILE%\AppData\Local\Tencent"
rd /s /q "%USERPROFILE%\AppData\Roaming\Tencent"
rd /s /q "%ProgramData%\Tencent"
echo.

:: Delete AOW engine files (forces engine re-creation)
echo Removing AOW engine folder...
rd /s /q "C:\Program Files\TxGameAssistant\ui"
rd /s /q "C:\Program Files\TxGameAssistant\engine"
rd /s /q "C:\Program Files\TxGameAssistant\update"
rd /s /q "C:\Program Files\TxGameAssistant\temp"
echo.

:: Optional: Restart GameLoop
echo Restarting GameLoop...
start "" "C:\Program Files\TxGameAssistant\AppMarket\AppMarket.exe"

echo.
echo ================================
echo FIX COMPLETE. GameLoop restarted.
echo ================================