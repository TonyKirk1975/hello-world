; Hello World GUI Application in MASM64
; This program creates a Windows GUI window with "Hello World" message

.code

includelib kernel32.lib
includelib user32.lib

extern GetModuleHandleA: proc
extern MessageBoxA: proc
extern ExitProcess: proc

main proc
    ; Parameters for MessageBoxA:
    ; RCX = hWnd (NULL = 0)
    ; RDX = lpText (pointer to message string)
    ; R8 = lpCaption (pointer to caption string) 
    ; R9 = uType (MB_OK = 0)
    
    sub rsp, 28h            ; Allocate shadow space (32 bytes) + align stack to 16 bytes
    
    xor rcx, rcx            ; hWnd = NULL
    lea rdx, msgText        ; lpText = address of message string
    lea r8, msgCaption      ; lpCaption = address of caption string
    xor r9, r9              ; uType = MB_OK (0)
    
    call MessageBoxA        ; Display the message box
    
    xor rcx, rcx            ; Exit code = 0
    call ExitProcess        ; Exit the program
    
main endp

.data
    msgText     db "Hello World!", 0
    msgCaption  db "MASM64 GUI", 0

end