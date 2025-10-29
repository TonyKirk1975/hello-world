# Makefile for MASM 64-bit Hello World
# Use with nmake (Visual Studio's make utility)

# Compiler and linker
AS = ml64
LINK = link

# Flags
ASFLAGS = /c
LINKFLAGS = /subsystem:console /entry:main

# Target executable
TARGET = hello.exe

# Object files
OBJS = hello.obj

# Default target
all: $(TARGET)

# Build executable
$(TARGET): $(OBJS)
	$(LINK) $(LINKFLAGS) $(OBJS) kernel32.lib

# Assemble source files
hello.obj: hello.asm
	$(AS) $(ASFLAGS) hello.asm

# Clean build artifacts
clean:
	del /Q $(OBJS) $(TARGET) 2>nul

# Phony targets
.PHONY: all clean
