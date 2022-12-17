org 100h
jmp start

section.data

msgchr db 'enter a character (A-z or a-z):$'
num dw 0

section .code
printf:
	mov ah,9
	int 21h

ret

scanchr:
	;take input
	mov ah,7    
	int 21h
 	
	mov byte[num],al


	;mov dx,num
	;mov ah,9
	;int 21h
	mov byte[num +1] ,'$'

	mov dx,num
	mov ah,9

int 21h

	ret
	
;scanstring:
;	;take input
;	mov dx,answer
;	mov ah,0x0a
;	int 21h
;	xor bx,bx
;	mov bl,[answer+1] ;buffer size
;	mov word[answer+bx+2],'$'
;	mov ax,0
;	mov dx,msgstring2
;	call printf
;	mov dx,answer+2
;	mov ah,9
;	int 21h
;ret

start:
    mov dx,msgchr
    call printf
    call scanchr

    mov al,[num]
    call printf

  ;  int 21h
   ; answer: db 20,0
    ;resb 20

    mov ax,0x4c00
    int 0x21


