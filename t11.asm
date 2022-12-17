org 100h
jmp start

Palindrome:
 mov ah,9
 mov dx, ran1
 int 21h
 jmp exit

start:
 mov ah,9
 mov dx, ran
 int 21h
mov ah, 1 
int 21h 
mov [output], al

mov ah,9
 mov dx, ran
 int 21h
mov ah, 1 
int 21h
mov [output+ 2], al 

mov ah,9
 mov dx, ran
 int 21h
mov ah, 1 
int 21h

mov [output  + 4], al 

mov bh,[output] 
mov bl,[output+4] 
cmp bh,bl
je Palindrome
 mov ah,9
 mov dx, ran
 int 21h


exit:
mov ax, 0x4c00 
int 0x21
output :dw  0,0,0
ran db "   number $"
ran1 db "  palindrome $"
ran2 db " not palindrome  $"
