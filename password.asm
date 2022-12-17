org 0x100
loginmsg db ' login to continue...', 0
loginfailmsg db 'Wrong user or password!'
loginsuccessmsg db 'Successfuly logged in.'
usermsg db 'User: ', 0
passmsg db 'Password: ', 0
defuser db 'root'
defpass db 'root'
entereduser times 16 db 0
enteredpass times 16 db 0
indexuser db 0
indexpass db 0
mov si, loginmsg
call ps
call nl
mov si, usermsg
call ps
call nl

call inputstring

jmp $



inputstring:
    inputchar:
        mov ah, 00h
        int 16h
        
    ret


bs:
    
    mov al, 8 
    mov ah, 0eh
    int 10h
    mov al, 32 
    mov ah, 0eh
    int 10h
    mov al, 8 
    mov ah, 0eh
    int 10h
    popa
    ret

nl:
    
    mov al, 0ah ;10
    mov ah, 0eh
    int 10h
    mov al, 0dh ;13
    mov ah, 0eh
    int 10h
    popa
    ret

ps:
    
    ps_test:
    lodsb
    cmp al, 0h
    je ps_eof
    mov ah, 0eh
    int 10h
    jmp ps_test
    ps_eof:
    popa
    ret

times 510 - ($ - $$) db 0
dw 0xaa55
