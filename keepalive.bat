@echo off
set INTERVAL=10
:loop
start Brother
start SierraOne.exe
timeout %INTERVAL%
goto:loop
