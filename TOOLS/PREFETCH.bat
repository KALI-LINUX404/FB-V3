@echo off
echo Cleaning Temp folders...
echo.

REM Clean C:\Windows\Prefetch
echo Cleaning C:\Windows\Prefetch
del /f /s /q "C:\Windows\Prefetch\*.*"
for /d %%p in ("C:\Windows\Prefetch\*.*") do rmdir "%%p" /s /q
echo Done with C:\Windows\Prefetch
echo.

echo Cleaning complete!