@echo off
REM Build script for MASM64 Hello World GUI application
REM Requires: MASM64 (ml64.exe) and Microsoft Linker

echo Building Hello World GUI in MASM64...

REM Assemble the source file
ml64.exe /c /Cp HelloWorld.asm
if errorlevel 1 goto error

REM Link the object file
link.exe /SUBSYSTEM:WINDOWS /ENTRY:main HelloWorld.obj
if errorlevel 1 goto error

echo.
echo Build successful! Run HelloWorld.exe to see the GUI.
goto end

:error
echo.
echo Build failed! Make sure MASM64 is installed and in your PATH.
echo You need Visual Studio or Windows SDK installed.
pause

:end