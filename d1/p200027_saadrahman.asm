[org 0x0100]
jmp start

max: dw 0
tmax: dw 0
min:dw 0
tmin: dw 0
index: dw 18
num: dw 2,1,8,3,4,5,9,7,6
    
    start:
    ;max
    mov ax,[num]

    mov bx,0

    outerloop:
        cmp ax,[num + bx]
        jnc noswap
            
            mov ax, [num + bx]
            

    noswap:
        add bx,2
        cmp bx,[index]
        jnz outerloop
    
    
    mov [max], ax


    ;second maximum
    


    mov ax,0
    mov bx,0
    mov cx,0
    mov dx,0

    mov ax, [num]
    mov dx,[max]
    
    outerloop1:
        cmp ax, [num + bx]
        jnc noswap1
            cmp dx,[num + bx] ;check max
            je noswap1

            mov ax, [num + bx]






        noswap1:
        add bx,2
        cmp bx, [index]
        jnz outerloop1


    mov [tmax],ax

    ;minimum


    mov ax, 0
    mov bx, 0
    mov cx,0
    mov dx,0


    mov ax, [num]
    
    outerloop2:
        cmp ax, [num + bx]
        jc noswap2
            mov ax, [num+bx]
            





        noswap2:
        add bx,2
        cmp bx,[index]
        jnz outerloop2


    mov [min],ax

    ;second minimum
    mov ax,0
    mov bx,0
    mov cx,0
    mov dx,0

    mov ax,[num]
    mov dx,[min]

    outerloop3:
    cmp ax,[num + bx]
    jc noswap3
        cmp dx, [num + bx]
        je noswap3

        mov ax, [num + bx]


    noswap3:
    add bx, 2
    cmp bx,[index]
    jnz outerloop3

    mov [tmin], ax
 


    
    
    mov ax, 0x4c00
    
    int 0x21
