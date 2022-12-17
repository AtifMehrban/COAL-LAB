[org 0x0100]
jmp mainfunction
Section .data
msg db  'Enter Table No $'
msg1 db 'Enter Table Limit$'
msg2 db 'Output $' ,0x0a ,
nextline db 0x0a ,'$'
cross db '*  $'
equal db '=   $'

num dd 0 , '$'
num1 dd 0 , '$'
num2 dd 49 , '$'
num3 dd 0 , '$'
 

Section .code


displayfunction:
    mov dx , msg 
    mov ah , 9 
    int 21h 
    
    mov ah, 7
    int 21h
    mov byte[num], al

    mov dx , num
    mov ah , 9
    int 21h 
    
    mov dx , nextline
    mov ah , 9 
    int 21h 

    mov dx , msg1 
    mov ah , 9 
    int 21h 
    
    mov ah , 7 
    int 21h 
    mov byte[num1] , al 

    mov dx , num1
    mov ah , 9
    int 21h 

    mov dx , nextline 
    mov ah , 9 
    int 21h 
    
    
    mov dx , msg2
    mov ah , 9 
    int 21h 
    
    mov dx , nextline 
    mov ah , 9 
    int 21h 

    mov cx , [num1]

     sub cx , 30h
    
    loopfunction:
        
        mov dx , num
        mov ah , 9 
        int 21h 
        
        mov dx , cross
        mov ah , 9 
        int 21h 

        mov dx , num2
        mov ah , 9 
        int 21h

        
        mov dx , equal
        mov ah , 9 
        int 21h 


        mov ax , [num]
        mov bx , [num2]
        sub ax , 30h 
        sub bx , 30h 
        mul bx 
        add ax , 30h
        mov [num3] , ax
        
        
        mov dx , num3
        mov ah , 9 
        int 21h 
        point:
        mov dx , nextline 
        mov ah , 9 
        int 21h 

        mov ax , [num2]
        sub ax , 30h 
        add ax , 1 
        add ax, 30h 
        mov [num2] , ax 

        loop loopfunction

    ret 

mainfunction:
    call displayfunction
    mov ax , 0x4c00
    int 21h
