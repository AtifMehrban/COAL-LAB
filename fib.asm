SECTION .data ;init data




str: db "This equal: %d",10,0

SECTION .text   


extern printf
global main

main:
push ebp
mov ebp,esp
push 03  ; the index 
call _fibonacci
add esp,4

push DWORD eax
push str
call printf

mov esp,ebp
pop ebp
ret
_fibonacci:

push ebp
mov ebp,esp


mov ebx, [ebp+8] ;; param n 
cmp ebx,0
jne CHECK2

mov eax,0
jmp _endFIbofunc        

CHECK2: 
    cmp ebx,0x1
    jne ELSE3
    mov eax,1
jmp _endFIbofunc

ELSE3:

mov ebx,[ebp+8] 
dec ebx  ;; n-1


;;  FIRST call
push ebx
call _fibonacci
add esp,4
mov edx,eax

;;  SEC CALL
dec ebx
push ebx
call _fibonacci
