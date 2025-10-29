# hello-world
A GUI Hello World application written in MASM64 (Microsoft Macro Assembler 64-bit)

## Description
This is a simple Windows GUI application written in x64 assembly language using MASM64. It displays a message box with "Hello World!" when executed.

## Requirements
- Windows operating system (64-bit)
- MASM64 (ml64.exe) - included with Visual Studio or Windows SDK
- Microsoft Linker (link.exe)

## Building the Application

### Option 1: Using the build script
Simply run the provided batch file:
```cmd
build.bat
```

### Option 2: Manual build
If you prefer to build manually, use these commands:
```cmd
ml64.exe /c /Cp HelloWorld.asm
link.exe /SUBSYSTEM:WINDOWS /ENTRY:main HelloWorld.obj
```

## Running the Application
After building, simply execute:
```cmd
HelloWorld.exe
```

A message box will appear displaying "Hello World!"

## Files
- `HelloWorld.asm` - The main assembly source file
- `build.bat` - Automated build script
- `README.md` - This file

## Notes
- This application uses the Win32 API MessageBoxA function
- The code follows x64 calling conventions (RCX, RDX, R8, R9 for first 4 parameters)
- Shadow space is allocated on the stack as required by x64 calling convention
