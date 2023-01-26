@echo off
set INTERVAL=10
:loop
cd contacts
start SierraOne.exe
timeout %INTERVAL%
goto:loop
