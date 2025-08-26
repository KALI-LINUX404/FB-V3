@echo off
echo Cleaning Temp folders...
echo.

REM Clean C:\Windows\Temp
echo Cleaning C:\Windows\Temp
del /f /s /q "C:\Windows\Temp\*.*"
for /d %%p in ("C:\Windows\Temp\*.*") do rmdir "%%p" /s /q
echo Done with C:\Windows\Temp
echo.

REM Get current user's temp folder path
set "tempfolder=%TEMP%"

echo Temp folder: %tempfolder%

REM Delete files
del /f /s /q "%tempfolder%\*.*"

REM Delete folders
for /d %%p in ("%tempfolder%\*.*") do rmdir "%%p" /s /q

echo Cleaning complete!
