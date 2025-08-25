@echo off
echo Cleaning Temp folders...
echo.

REM Clean C:\Windows\Temp
echo Cleaning C:\Windows\Temp
del /f /s /q "C:\Windows\Temp\*.*"
for /d %%p in ("C:\Windows\Temp\*.*") do rmdir "%%p" /s /q
echo Done with C:\Windows\Temp
echo.

REM Clean C:\Users\Administrator\AppData\Local\Temp
echo Cleaning C:\Users\Administrator\AppData\Local\Temp
del /f /s /q "C:\Users\Administrator\AppData\Local\Temp\*.*"
for /d %%p in ("C:\Users\Administrator\AppData\Local\Temp\*.*") do rmdir "%%p" /s /q
echo Done with C:\Users\Administrator\AppData\Local\Temp
echo.

echo Cleaning complete!