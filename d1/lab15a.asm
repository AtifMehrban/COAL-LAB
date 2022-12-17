org 100h
jmp start
Section .data

    msgchr db 'enter a character (A-Z or a-z) : $'
    msgString db 10,'Enter Your Name : $',10
    msgString2 db 10,'Enter name : $'
    num dw 0


Section .code

    printf:
        mov ah,9
        int 12h

    ret


    scanchr:
        ;take input
        mov ah,7
        int 21h ;;input will be stored in al
        
        mov byte[num],al
        ;print the entered character
        mov byte[num+1],'$'
        mov dx,num
        mov ah,9
        int 21h
    ret

scanstring:
        ;take inpiut

        mov dx,anwser
        mov ah,0x0a
        int 21h ;;input stored in al
        xor bx,bx

        mov bl,[anwser+1] ;buffer size
        mov word[anwser+bx+2],'$'
        mov ax,0
        mov dx,msgString2

        call printf

        mov dx,anwser+2
        mov ah,9
        int 21h

    ret

    start:
    ;mov dx,msgchr
    ;call printf
    ;call scanchr

    mov dx,msgString
    call printf
    call scanstring
    mov ah,4ch

    int 21h

    anwser : db 20,0
    resb 20

