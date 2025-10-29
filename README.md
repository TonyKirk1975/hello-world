# MASM 64-bit Hello World

This repository contains a simple "Hello, World!" program written in MASM (Microsoft Macro Assembler) for 64-bit Windows.

## Prerequisites

To build and run this program, you need:
- Windows operating system (64-bit)
- Microsoft Visual Studio (any edition) or Windows SDK
- ml64.exe (MASM 64-bit assembler) which comes with Visual Studio

## Building the Program

### Using Command Line

1. Open a "x64 Native Tools Command Prompt for VS" (or similar Visual Studio command prompt)
2. Navigate to the repository directory
3. Run the build script:

```batch
build.bat
```

Or manually assemble and link:

```batch
ml64 /c hello.asm
link /subsystem:console /entry:main hello.obj kernel32.lib
```

### Using Make (with nmake)

```batch
nmake
```

## Running the Program

After building, run the executable:

```batch
hello.exe
```

You should see:
```
Hello, World!
```

## File Description

- `hello.asm` - MASM 64-bit assembly source code
- `build.bat` - Windows batch file to build the program
- `Makefile` - Makefile for nmake (Visual Studio's make utility)

## Technical Details

This program uses the Windows x64 calling convention and the Windows Console API:
- `GetStdHandle` - Gets a handle to the standard output
- `WriteConsoleA` - Writes text to the console
- `ExitProcess` - Terminates the program

The code follows Microsoft's x64 calling convention:
- First four integer arguments in RCX, RDX, R8, R9
- 32 bytes of shadow space on the stack
- Stack alignment to 16 bytes
