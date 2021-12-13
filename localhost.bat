call .\scripts\GitPull.bat
call .\scripts\SetGlobalVariables.bat
call .\scripts\SetLocalVariables.bat
SET IE32="C:\Program Files (x86)\Internet Explorer\iexplore.exe"
SET FIREFOX="C:\Program Files\Mozilla Firefox\firefox.exe"
SET BROWSERS=.\browsers\1.0\localhost_GC_MF_IE.json
SET PORT=5556
start /B .\scripts\RunHub.bat
sleep 3
call .\scripts\RunNode.bat
