org 0x100
msg db "enter Number:  $"

jmp start

myfun:
push bp
mov bp,sp
push bx
push cx

mov 





start: 

mov dx,msg
mov ah,09
int 21h

push ax 
call myfun

mov ax,0x4c00
int 0x21