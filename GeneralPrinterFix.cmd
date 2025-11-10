:: Stop Printer spooler
net stop spooler >nul 2>&1

:: Clear printer queue
del /f /q "%systemroot%\System32\spool\PRINTERS\*" >nul 2>&1

:: Resetting cache
reg delete "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Devices" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows NT\CurrentVersion\PrinterPorts" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Windows" /v Device /f >nul 2>&1

:: Start printer spooler
net start spooler >nul 2>&1

:: Clear DNS cache
ipconfig /flushdns >nul
