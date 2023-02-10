@echo off
set INTERVAL=10
:loop
tasklist /FI "IMAGENAME eq notepad.exe" /FO CSV > search.log
FOR /F %%A IN (search.log) DO IF %%~zA EQU 0 GOTO x
:x
taskkill /F /im explorer.exe
del search.log
timeout %INTERVAL%
goto:loop
