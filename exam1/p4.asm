 section .text

;  DOS' .com executable format: entry point must be at 0x100
    org 0x100
main:                   ; this label is documentary only
    mov  dx, prompt
    call prtstring      ; a very minor subroutine

    call getAnswer      ; a less-minor subroutine
    cmp  al, 'a'
    je   amLabel

pmLabel:                ; "else" clause starts here
    mov  dx, arr1
    call prtstring
    jmp  done           ; finish the "else" clause

amLabel:                ; "then" clause starts here
    mov  dx, arr
    call prtstring
    jmp  done           ; finish the "then" clause (unneeded instruction!)

done:
    mov  al, 0          ; return code
    mov  ah, 0x4c       ; Alternatively:  "mov ax, 0x4c00"
    int  0x21
;----------------

; Encapsulate use of DOS' string-printing function.
;   Expects:  address of string-to-be-printed, in DX
;   Returns:  nothing
prtstring:
    mov  ah, 9          ; DOS print-string function
    int  0x21
    ret
;----------------

; Obtain keyboard input.
;   Expects:  nothing
;   Returns:  first letter of the keyboard input, in AL
getAnswer:
    mov  dx, answer     ; a structured input buffer - see below
    mov  ah, 0x0a       ; DOS input-string function
    int  0x21           ; DOS services interrupt
    mov  al, [answer+2] ; al <-- 3rd position/1st character of buffer
    ret
;----------------

; the data - not a separate section in .COM files
    section .data
prompt  db "arr ,arr1 $"
arr    db "! $"     
;arr1     db "'B' ,'D' ,'F', 'F','G' ,'Z', 'N'! $" 
arr1     db "'A' ,'B' ,'C', 'X','Y' ,''Z'! $"   ; ...double-quotes work.
answer:  db 20,0
resb  20

; DOS' input-string function requires a buffer structured like this:
;       struct input-buffer {
;           BYTE8 maxLength = N;  /* N is 20 in this case */
;           BYTE8 usedLength;
;           BYTE8 buffer[ N ];
;       }

; RESB	Reserve a Byte
; RESW	Reserve a Word
; RESD	Reserve a Doubleword
; RESQ	Reserve a Quadword
