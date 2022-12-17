org 100h

Section .txt
jmp start

RandomNo:

mov cx, 0
mov ah, 00h
int 1ah  
mov dx, 00h
mov ax, dx 

mov bx, 10 
div bx

add  dl, 30h   
mov [output],dl
mov ah, 2h   
int 21h
ret 

wining:
 mov ah,9
 mov dx, ran1
 int 21h
 jmp exit

start:

call RamdomNo

 mov ah,9
 mov dx, ran
 int 21h
mov ah, 1 
int 21h 
cmp al,'e'
je exit
mov dl,[output]
cmp al,dl
je wining
 mov ah,9
 mov dx, ran2
 int 21h

exit:
mov ax, 0x4c00 
int 0x21
output :dw  0
ran db "  number  $"
ran11 db "  wining $"
ran2 db " LOSing $"







