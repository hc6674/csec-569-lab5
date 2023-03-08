@echo off

set ap_console_com_port=COM3
set ap_console_speed=9600
set ap_username=Cisco
set ap_password=Cisco
set ssid=Starbucks_Wifi
set wep_key=1234567890

echo.
echo Starting PuTTY...
putty.exe -serial %ap_console_com_port% -sercfg %ap_console_speed%

echo.
echo Waiting for AP to boot up...
timeout /t 60

echo.
echo Entering privileged EXEC mode...
echo enable
echo %ap_password%

echo.
echo Clearing configuration...
echo write erase
echo y
echo reload
echo

echo.
echo Waiting for AP to reboot...
timeout /t 60

echo.
echo Entering privileged EXEC mode...
echo enable
echo %ap_password%

echo.
echo Entering global configuration mode...
echo conf t

echo.
echo Creating SSID...
echo dot11 ssid %ssid%
echo authentication open
echo guest-mode
echo exit

echo.
echo Assigning SSID to radio...
echo int dot11radio 0
echo ssid %ssid%

echo.
echo Configuring WEP encryption...
echo encryption mode wep mandatory
echo encryption key 1 size 40bit 0 %wep_key% transmit-key
echo no shutdown
echo end

echo.
echo Configuration complete.