:: Close Browsers
taskkill /f /im msedge.exe >nul 2>&1
taskkill /f /im chrome.exe >nul 2>&1

:: Update policies 
gpupdate /force

:: Clear DNS cache
ipconfig /flushdns

timeout /t 1 >nul

:: Lower zones security
reg import Zone1.reg
reg import Zone2.reg
reg import Zone3.reg

:: Turn off popup blocker
reg add "HKCU\Software\Microsoft\Internet Explorer\New Windows" /v PopupMgr /t REG_DWORD /d 0 /f

:: Clear SSL state
"%SystemRoot%\System32\rundll32.exe" "%SystemRoot%\System32\wininet.dll",DispatchAPICall 3
