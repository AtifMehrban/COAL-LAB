[org 0x0100]
mov ax,0xb800
mov es,ax
mov di,160

nextpos:
    mov word[es:di],0x0D22

    add di,2
    cmp di,2000
    jne nextpos


    mov ax,0x4c00
    int 0x21
