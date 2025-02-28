@echo off
if "%1"=="" (
    set /p name=Please enter your name:
)
if "%name%"=="" (
    echo Hello %1
) else (
    echo Hello %name%
)
exit /b
