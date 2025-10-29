; MASM 64-bit Hello World Program
; This program prints "Hello, World!" to the console and exits

.code

; External functions from Windows API
extern ExitProcess: proc
extern GetStdHandle: proc
extern WriteConsoleA: proc

main proc
    ; Reserve shadow space and align stack (Windows x64 calling convention)
    sub rsp, 40h
    
    ; Get handle to standard output
    ; HANDLE GetStdHandle(DWORD nStdHandle)
    ; STD_OUTPUT_HANDLE = -11
    mov rcx, -11
    call GetStdHandle
    mov rbx, rax            ; Save handle in rbx
    
    ; Write "Hello, World!" to console
    ; BOOL WriteConsoleA(
    ;   HANDLE  hConsoleOutput,
    ;   const VOID *lpBuffer,
    ;   DWORD   nNumberOfCharsToWrite,
    ;   LPDWORD lpNumberOfCharsWritten,
    ;   LPVOID  lpReserved
    ; )
    
    mov rcx, rbx            ; Handle to standard output
    lea rdx, hello_msg      ; Pointer to message
    mov r8d, hello_msg_len  ; Number of characters to write
    lea r9, bytes_written   ; Pointer to bytes written
    mov qword ptr [rsp+20h], 0  ; lpReserved = NULL
    call WriteConsoleA
    
    ; Exit program
    ; void ExitProcess(UINT uExitCode)
    xor ecx, ecx            ; Exit code 0
    call ExitProcess
    
    ; Should never reach here, but restore stack just in case
    add rsp, 40h
    ret
main endp

.data
hello_msg db "Hello, World!", 13, 10
hello_msg_len equ $ - hello_msg
bytes_written dq 0

end
