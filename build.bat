@echo off
REM MASM 64-bit Hello World Build Script

echo Assembling hello.asm...
ml64 /c hello.asm
if %errorlevel% neq 0 (
    echo Assembly failed!
    exit /b %errorlevel%
)

echo Linking hello.obj...
link /subsystem:console /entry:main hello.obj kernel32.lib
if %errorlevel% neq 0 (
    echo Linking failed!
    exit /b %errorlevel%
)

echo Build successful! Run hello.exe to execute the program.
