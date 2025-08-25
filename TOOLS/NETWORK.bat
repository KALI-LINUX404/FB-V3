@echo off
echo Resetting Network Settings...
echo.

:: Flush DNS Resolver Cache
echo Flushing DNS...
ipconfig /flushdns
echo.

:: Release current IP configuration
echo Releasing IP address...
ipconfig /release
echo.

:: Renew IP address
echo Renewing IP address...
ipconfig /renew
echo.

:: Reset Winsock Catalog
echo Resetting Winsock...
netsh winsock reset
echo.

:: Reset TCP/IP Stack
echo Resetting TCP/IP...
netsh int ip reset
echo.

:: Clear ARP Cache
echo Clearing ARP cache...
arp -d
echo.

:: Clear NetBIOS name cache
echo Clearing NetBIOS name cache...
nbtstat -R
nbtstat -RR
echo.

echo Network reset complete!
echo Please restart your computer for all changes to take effect.