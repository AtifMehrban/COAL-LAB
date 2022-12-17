[org 0x0100]
jmp start

    welcome_message: db 'Welcome To The MAZE GAME!'
    welcomeTwo:           db 'Press Any Key To Play'
    welcomeTwoLength:  dw 21
    Over: db 'Game Over!'
    OverLength: dw 10
    welcome_message_length: dw 25


   
clr:
    push dx
    push di
    push ax
    push es

    mov di , 0
    mov ax ,0xb800
    mov es , ax
    mov dx , 0x0720

    loop14:
        mov [es:di] , dx
        add di , 2
        cmp di , 4000
        jne loop14
    
    pop es
    pop ax
    pop di
    pop dx
    ret


display:
    push bp 
    mov bp , sp
    push ax 
    push bx
    push cx
    push dx
    push es 
    push di
    push si

    
    mov si , 0
    mov di , 0
    mov ax , 0xb800
    mov es , ax
   

    loop10:
         mov cx , 12
         mov dx , 0x0640
        loop1:
            mov [es:di] , dx
            add di , 2
            loop loop1
        mov  cx , 24
        mov dx , 0x0620
        loop2:
            mov [es:di] , dx
            add di , 2
            loop loop2
        mov  cx , 34
        mov dx , 0x0640
        loop4:
            mov [es:di] , dx
            add di , 2
            loop loop4
        mov  cx , 100
        mov dx , 0x0620
        loop5:
            mov [es:di] , dx
            add di , 2
            loop loop5

        mov  cx , 5
        mov dx , 0x0640
        loop6:
            mov [es:di] , dx
            add di , 2
            loop loop6


        mov  cx , 10
        mov dx , 0x0620
        loop7:
            mov [es:di] , dx
            add di , 2
            loop loop7
        mov  cx , 20
        mov dx , 0x0620
        loop8:
            mov [es:di] , dx
            add di , 2
            loop loop8
        mov  cx , 25
        mov dx , 0x0640
        loop9:
            mov [es:di] , dx
            add di , 2
            loop loop9
        mov  cx , 20
        mov dx , 0x0620
        loop11:
            mov [es:di] , dx
            add di , 2
            loop loop11

        mov  cx , 20
        mov dx , 0x0640
        loop12:
            mov [es:di] , dx
            add di , 2
            loop loop12
    inc si 
    cmp si , 10
    jne loop10

    

    pop si
    pop di
    pop es
    pop dx
    pop cx
    pop bx
    pop ax
    pop bp
    ret 

printTName:
    push bp
    mov  bp, sp
    push es
    push ax
    push cx 
    push si 
    ; push di 

    mov ax, 0xb800 
    mov es, ax 
    mov di, 72               


    mov si, [bp + 6]
    mov cx, [bp + 4]
    mov ah, 0x02 ; only need to do this once 

    nextchar: 
        mov al, [si]
        mov [es:di], ax 
        add di, 2 
        add si, 1 
        
        loop nextchar 


    ; pop di 
    pop si 
    pop cx 
    pop ax 
    pop es 
    pop bp 
    ret 4 

printName:
    push bp
    mov  bp, sp
    push es
    push ax
    push cx 
    push si 
    push di 

    mov ax, 0xb800 
    mov es, ax 
    ;// Displaying Score
    ; mov di, 3843             

    mov di, [bp + 8]
    mov si, [bp + 6]
    mov cx, [bp + 4]
    mov ah, 0x02 ; only need to do this once 

    nextchar1: 
        mov al, [si]
        mov [es:di], ax 
        add di, 2 
        add si, 1 
        

        loop nextchar1


    pop di 
    pop si 
    pop cx 
    pop ax 
    pop es 
    pop bp 
    ret 6 

printNum: 
    push bp 
    mov  bp, sp
    push es 
    push ax 
    push bx 
    push cx 
    push dx 
    push di 

   

    mov ax, [bp+4]   
    mov bx, 10       
    mov cx, 0        

    nextdigit: 
        mov dx, 0    
        div bx       
        add dl, 0x30 
        push dx      
        inc cx       
        cmp ax, 0    
        jnz nextdigit 

    

    mov ax, 0xb800 
    mov es, ax 

    mov di, [bp + 6]
    nextpos: 
        pop dx          
        mov dh, 0x03    
        mov [es:di], dx 
        add di, 2 
        loop nextpos    

    pop di 
    pop dx 
    pop cx 
    pop bx 
    pop ax 
    pop es
    pop bp 
    ret 4 






object:
    push bp
    mov bp , sp
    push ax 
    push di
    push es
    push dx

    cmp word [bp+4], 2550
    jne cont
        call GameOver
    cont:
    mov di , [bp+4]
    mov ax , 0xb800
    mov es , ax
    mov dx , 0x02158
    mov [es:di] , dx

    pop dx
    pop es
    pop di
    pop ax
    pop bp
    ret 2



food:

 
    push ax 
    push di
    push es
    push dx

    mov di , 3522
    mov ax , 0xb800
    mov es , ax
    mov dx , 0x0440
    mov [es:di] , dx

    pop dx
    pop es
    pop di
    pop ax
    ret 



walls:
    push ax 
    push es
    push di
    push cx
    push dx

    mov dx , 0x0142
    mov ax , 0xb800
    mov es , ax
    mov di , 0
    mov cx , 80
    wloop1;
        mov [es:di] , dx
        add di , 2
        loop wloop1
    
    mov di , 0
    mov cx , 25
    wloop3;
        mov [es:di] , dx
        add di , 160
        loop wloop3

    mov di , 3840
    mov cx , 80
    wloop2;
        mov [es:di] , dx
        add di , 2
        loop wloop2


    mov di , 158
    mov cx , 25
    wloop4:
        mov [es:di] , dx
        add di , 160
        loop wloop4

    pop dx
    pop cx
    pop di
    pop es
    pop ax
    ret


GameOver:
push cx
push dx
push ax
push bx
push si
push di

    call clr
    mov dx, 1994
    push dx
    mov dx, Over 
    push dx 
    push word [OverLength]
    call printName


pop di
pop si
pop bx
pop ax
pop dx
pop cx
mov ax, 0x4c00
int 0x21
ret 


pop ax
ret

WelcomeBorder:
    mov ax, 0xb800 
    mov es, ax 
    mov di, 2126              

    mov ah, 0x04 ; only need to do this once 
    print0: 
        mov al, '-'
        mov [es:di], ax 
        add di, 2
        cmp di, 2190
        jne print0

    mov ah, 0x09
    mov al, 'P'
    mov word [es:2312], ax
    mov al, 'L'
    mov word [es:2314], ax
    mov al, 'A'
    mov word [es:2316], ax
    mov al, 'Y'
    mov word [es:2318], ax
    mov al, '!'
    mov word [es:2320], ax



    mov ah, 0x09
    mov al, '*'

    mov word [es:2], ax
    mov word [es:162], ax
    mov word [es:322], ax
    mov word [es:482], ax
    mov word [es:642], ax
    mov word [es:3996], ax
    mov word [es:3836], ax
    mov word [es:3676], ax
    mov word [es:3516], ax

    mov word [es:642], 0x0902
    mov word [es:3356], 0x0902

ret





start:
    call clr

    mov dx, 1972
    push dx
    mov dx, welcome_message 
    push dx 
    push word [welcome_message_length]
    call printName
    push dx
    mov dx,  welcomeTwo
    push dx 
    push word [welcomeTwoLength]
    call printTName


    mov ah, 01
    int 0x21




mov ax , 0xb800
mov es , ax
mov cx ,300
mov ax , 100
mov dx , 440
mov al , 0
mov si , 100
loop20:

    cmp al , 'a'
    je a
    cmp al , 'w'
    je w
    cmp al , 's'
    je s
    cmp al , 'd'
    je d

    w:sub dx , 160
    mov di , dx
    cmp word[es:di] , 0x064
    je wyes
    jne end
    wyes:
        add dx , 160
    jmp end

    a:sub dx , 2
    mov di , dx
    cmp word[es:di] , 0x0640
    je ayes
    jne end
    ayes:
        add dx , 2
    jmp end

    s:add dx , 160
    mov di , dx
    cmp word[es:di] , 0x0640
    je syes
    jne end
    syes:
        sub dx , 160
    jmp end

    d:add dx , 2
    mov di , dx
    cmp word[es:di] , 0x0640
    je dyes
    jne end
    dyes:
        sub dx , 2
    end:

    call clr
    
    call display
    call walls
    call food
    mov dx,170
    push dx
    call object


   

   
    
 

    
    mov ah , 1
    int 21h

loop loop20



    


    


 mov ax, 0x4c00 
 int 0x21
