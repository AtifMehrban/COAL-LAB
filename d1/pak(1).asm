org 100h
jmp start

data : db 'Assembly Language - Course , Fast University Peshawar '
msg1end:

data1: db 'i love pakistan'
msg2end:

clearscreen:
    mov ah,06h
    xor al,al
    xor cx,cx
    mov dx,184fh
    mov bh,07h
    int 10h

ret

setmode:
    
    mov al,03h
    mov ah,00h
    int 10h

ret

setcursor:
   mov dh,0
    mov dl,80
    mov bh,0
    mov ah,02h
    int 10h
   
ret

setcursor2:
    mov dh,22
    mov dl,80
    mov bh,0
    mov ah,02h
    int 10h
  
ret

printchr:
   mov cx,80

   mov al,40h
   mov bh,0
   mov bl,07
   mov dh,24
   mov dl,80
   mov ah,09h
    
    int 10h



ret




printstr:
    mov cx,msg1end - data
     mov al,1
     mov bh,0
     mov bl,07
     mov dh,5
     mov dl,13
     push cs
     pop es
     mov bp,data
     mov ah,13h
     int 10h

ret
setBorderColor:
    mov ah,06h
    xor al,al
    xor cx,cx
   
    mov dh,24
    mov dl,01
    mov bh,05fh
    int 10h


    mov ah,06h
    xor al,al
    
    mov ch,0
    mov cl,0
    mov dh,2
    mov dl,79
    mov bh,05fh
    int 10h

   


    mov ah,06h
    xor al,al
    
    mov ch,0
    mov cl,79
    mov dh,24
    mov dl,79
    mov bh,05fh
    int 10h


    mov ah,06h
    xor al,al
  
    mov ch,22
    mov cl,0
    mov dh,24
    mov dl,79
    mov bh,05fh
    int 10h

ret


drawRectang: 

    mov ah,06h
    xor al,al
    mov ch,7
    mov cl,20
    mov dh,15
    mov dl,55
    mov bh,0002fh
    int 10h


    mov ah,06h
    xor al,al
    mov ch,7
    mov cl,20
    mov dh,15
    mov dl,27
    mov bh,0007fh
    int 10h

    mov cx,msg2end - data1
    mov al,1
    mov bh,0
    mov bl,07
    mov dh,11
    mov dl,35
    push cs
    pop es
    mov bp,data1
    mov ah,13h
    int 10h

ret
start:
call clearscreen
call setmode
call setcursor
call setBorderColor
call printchr
call setcursor2
call printchr
call printstr



call drawRectang
mov ax,0x4c00
int 0x21