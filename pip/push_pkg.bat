@echo off

echo.

title Uploading pip pkg

:: Go to 1 dir above:
pushd "%~dp0.." || echo Error - Failed to CD to: "%~dp0.." && timeout /t 15 && exit 1
echo CD=%cd%
echo.

set cmndStr=py -m twine upload --repository localhost dist\* --verbose
echo Executing: %cmndStr%
%cmndStr% 
if %errorlevel% neq 0 echo. && echo Error - Failure during execution of: && echo %cmndStr% && echo. && echo Aborting.. && timeout /t 15 && exit 1
echo.

echo.
echo Success
echo All Done
echo.
ping 127.0.0.1 -n 2 > nul


