del C:\Windows\Logs\CBS\*Persist*.* /q
del C:\Users\SA-WW-GDC-QA-perftst\AppData\Local\Temp\*.* /s /q
rmdir /s /q "C:\Users\SA-WW-GDC-QA-perftst\AppData\Local\Temp"
mkdir "C:\Users\SA-WW-GDC-QA-perftst\AppData\Local\Temp"
START /B CLEANMGR c: /sagerun:101