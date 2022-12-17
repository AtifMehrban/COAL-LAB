[org 0x100]

data segment 

msg1 db 10,13,'Enter Number: $'
msg2 db 10,13,'This is Even Number $'
msg3 db 10,13,'This is Odd Number: $'
msg db 10,13,'This is Prime Number: $'
nmsg db 10,13,'This is not a Prime Number: $'

data ends
display  macro msg
mov ah,9
lea dx,msg
int 21h
endm

code segment 
assume cs:code, ds:data

start:
mov, data
mov ds, ax
display msg1
mov ah,1
int 21h

mov ah, 0
chech: mov dl,2
div dl
cmp ah, 0
jne odd 

even:

display msg1
jmp done 

odd:
 display msg3

done:

start: mov ax, @data
mov ds, ax
mov al, num

mov bl, 02h

mov dx, 0000h

mov ah, 00h
 

L1: div bl
cmp ah, 00h
jne next

inc bh

next: cmp bh, 02h

je false

inc bl

mov ax, 0000h

mov dx, 0000h

cmp bl, num

jne L1

true: lea dx,msg
mov ah,09
int 21h
jmp next

false: lea dx, nmsg
mov ah, 09h

int 21h

exit:
mov ah, 4ch
int 21h 

end start
