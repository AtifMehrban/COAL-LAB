[org 0x0100]

mov ax, 0
mov bx,0

outerloop :
    mov ax,[num1 + bx]
    cmp ax,0
    je	otherloop 


    add [result],ax
    add bx,2
    cmp bx,12
    jne outerloop
    je end

otherloop:
    add bx,2
    cmp bx,12
    jne outerloop



end :

mov ax, 0x4c00
int 0x21

num1 : dw 2,0,0,6,2,6
result: dw 0