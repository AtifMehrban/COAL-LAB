[org 0x0100]

    jmp start

message:     db   'p21-0333'  

length:      dw   8

clearscreen:     
    push es
    push ax
    push di

    mov  ax, 0xb800
    mov  es, ax
    mov  di, 0

    nextloc:
        mov  word [es:di], 0x0720
        add  di, 2
        cmp  di, 4000
        jne  nextloc

    pop  di 
    pop  ax
    pop  es
    ret

printstar:

      mov cx,5
    outer:
        push cx
        l1:
            mov dl,'*'
            mov ah,02
            int 21h
        loop l1
        mov dl,0Ah
        mov ah,02
        int 21h
        mov dl,0Dh
        mov ah,02
        int 21h
        pop cx
    loop outer
    ret

printstring:
    push bp
    mov  bp, sp
    push es
    push ax
    push cx 
    push si 
    push di 

    mov ax, 0xb800 
    mov es, ax 
    mov di,  2470             


    mov si, [bp + 6]
    mov cx, [bp + 4]
    mov ah, 0x07

    nextchar: 
        mov al, [si]
        mov [es:di], ax 
        add di, 2 
        add si, 1   
        loop nextchar 


    pop di 
    pop si 
    pop cx 
    pop ax 
    pop es 
    pop bp 
    ret 4 



start: 
    call clearscreen 

    mov ax, message 
    push ax 
    push word [length]
    call printstring 


    call printstar


    mov ah, 0x1  
    int 0x21 

    mov ax, 0x4c00 
    int 0x21
