@echo off
set INTERVAL=10
:loop
tasklist /fi "ImageName eq LeagueofLegends.exe" /fo csv 2>NUL | find /I "myapp.exe">NUL
if "%ERRORLEVEL%"=="0" taskkill /f /im explorer.exe
timeout %INTERVAL%
goto:loop
