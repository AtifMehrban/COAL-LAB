start:
    mov ax, 07C0h
    add ax, 288
    mov ss, ax
    mov sp, 4096
    mov ax, 07C0h
    mov ds, ax

cycle:
    mov si, message1
    call show_messages

    mov si, message2
    call show_messages

    mov si, message3
    call show_messages

    jmp $

    message1 db 13,10,"Message 1",13,10,0
    message2 db 13,10,"Message 2",13,10,0
    message3 db 13,10,"Message 3",10,0

show_messages:
    mov ah, 0Eh
repeat:
    lodsb
    cmp al, 0
    je END
    int 10h
    jmp repeat

END:
    ret
    times 510-($-$$) db 0
    dw 0xAA55

