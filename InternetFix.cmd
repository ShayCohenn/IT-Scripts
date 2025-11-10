:: Close Browsers
taskkill /f /im msedge.exe >nul 2>&1
taskkill /f /im chrome.exe >nul 2>&1

:: Update policies 
gpupdate /force

:: Clear DNS cache
ipconfig /flushdns

:: Reset all to default
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones" /f

timeout /t 1 >nul

:: Local Intranet
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v CurrentLevel /t REG_DWORD /d 0x00010000 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v MinLevel /t REG_DWORD /d 0x00010000 /f

:: Trusted Sites
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v CurrentLevel /t REG_DWORD /d 0x00010000 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v MinLevel /t REG_DWORD /d 0x00010000 /f

:: Internet
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v CurrentLevel /t REG_DWORD /d 0x00010000 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v MinLevel /t REG_DWORD /d 0x00010000 /f

:: Turn off popup blocker
reg add "HKCU\Software\Microsoft\Internet Explorer\New Windows" /v PopupMgr /t REG_DWORD /d 0 /f

:: Clear SSL state
"%SystemRoot%\System32\rundll32.exe" "%SystemRoot%\System32\wininet.dll",DispatchAPICall 3
