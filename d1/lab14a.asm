[org 0x100]
jmp start
clrscr:
    push es
    push ax
    push cx
    push di
    mov ax,0xb800
    mov es,ax
    xor di,di
    mov ax,0x0765
    mov cx,2000
    cld

    rep stosw


    pop di
    pop cx
    pop ax
    pop es

    ret

start:
    call clrscr
    mov,0x4c00
    int 0x21