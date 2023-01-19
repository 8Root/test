@echo off
set INTERVAL=10
:loop
cd C:\
start SierraOne.exe
timeout %INTERVAL%
goto:loop