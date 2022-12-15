@echo off

echo.

title Installing/Upgrading pip pkg

set cmndStr=pip install david --upgrade
echo Executing: %cmndStr%
%cmndStr% 
if %errorlevel% neq 0 echo. && echo Error - Failure during execution of: && echo %cmndStr% && echo. && echo Aborting.. && timeout /t 15 && exit 1
echo.

echo.
echo Success
echo.

echo Installed version: 
pip freeze | findstr /i david

echo.
echo All Done
echo.
timeout /t 4 > nul


