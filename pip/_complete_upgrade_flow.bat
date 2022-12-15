@echo off

echo.

title Complete upgrade flow

call "%~dp0compile_pkg.bat"         || echo Error - Failure from: script: compile_pkg.bat         && timeout /t 10 && exit 1
call "%~dp0push_pkg.bat"            || echo Error - Failure from: script: push_pkg.bat            && timeout /t 10 && exit 1
call "%~dp0install_upgrade_pkg.bat" || echo Error - Failure from: script: install_upgrade_pkg.bat && timeout /t 10 && exit 1

echo.
echo Finished
echo.

pause

