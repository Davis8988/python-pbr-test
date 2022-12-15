@echo off

echo.

title compiling pip pkg

:: Go to 1 dir above:
pushd "%~dp0.." || echo Error - Failed to CD to: "%~dp0.." && timeout /t 15 && exit 1
echo CD=%cd%
echo.

:: Clean old build artifacts
if exist "dist" echo Removing 'dist' dir: %CD%\dist && rmdir /q /s "%CD%\dist"
if exist "dist" rmdir /q /s "%CD%\dist" && REM Sometimes needs to run this shitty command twice on windows!

set cmndStr=py -m build
echo Executing: %cmndStr%
%cmndStr% 
if %errorlevel% neq 0 echo. && echo Error - Failure during execution of: && echo %cmndStr% && echo. && echo Aborting.. && timeout /t 15 && exit 1
echo.

REM powershell -ExecutionPolicy bypass -Command "Write-Host 'Success' -ForegroundColor Green"

echo.
echo Success
echo All Done
echo.
ping 127.0.0.1 -n 2 > nul


