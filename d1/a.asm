org 100h
mov dx, msg
mov ah, 9
int 21h
ret
msg db "hello world $"

mov ax,0x4c00
int 21h
