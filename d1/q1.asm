org 0x100

jmp start

        msgchr db 'Enter a character (A-Z OR a-z):$'
        msglow db 10 , 'Lower case is : $' 
        msgup db 10 , 'Upper case is : $'
        err db 10 , 'Wrong entry :( $'
        num dw 0 , '$'
   
    printf:
        mov ah , 9
        int 21h
        ret
   
    scanchr:
        mov ah , 7
        int 21h
        mov [num] , al
        mov dx , num
        mov ah , 9
        int 21h
        ret
       
       

       
       
    lowtoup:
        mov dx , msgup
        mov ah , 9
        int 21h
       
        mov [num] , ax
        sub ax , 11
        mov [num] , ax
        mov dx , num
        mov ah, 9
        int 21h
        ret
       
    uptolow:
        mov dx , msglow
        mov ah , 9
        int 21h
       
        mov [num] , ax
        add ax , 29
        mov [num] , ax
        mov dx , num
        mov ah, 9
        int 21h
        ret

       


start:
    mov dx , msgchr
    call printf
    call scanchr
    call uptolow
    call lowtoup
     ;mmov ax,[num]
     ;m   cmp ax,0x0D
     ;m   je end
     ;m   jne start
    ;m
    
   
   
   
   
   
 end:  
    mov ax , 0x4c00
    int 0x21