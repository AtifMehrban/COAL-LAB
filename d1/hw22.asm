[org 0x0100]

jmp start
dtt : db 'P20-0626', 3;'$' (ENTER YOUR OWN VUID),
start:
MOV AX, 0600h
MOV BH, 0Fh
MOV CX, 0000h
MOV DX, 0C4Fh
INT 10h

MOV AH, 02h
MOV BH, 00h
MOV DH, 01h
MOV DL, 00h
INT 10h

mov ah, 02h

mov bx, 5
mov si, 1
l1:
mov cx, si
mov dl, '*'
l2:

int 21h
loop l2
 
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h
inc si
dec bx
jnz l1

mov ah, 02h
mov bx, 5
lol:
mov cx, bx
mov dl, '*'

lo2:
int 21h
loop lo2

mov dl, 0dh
int 21h
mov dl, 0ah
int 21h
dec bx
jnz lol

 ;2nd

MOV AX, 0600h
MOV BH, 5Fh
MOV DL, 01h
MOV CX, 0C00h
MOV DX, 184Fh
INT 10h

MOV AH, 02h
MOV BH, 00h
MOV DH, 0Ch
MOV DL, 24h
INT 10h
MOV AH, 09h
MOV dx, dtt
INT 21h
	MOV AX, 4C00h
	INT 21h
