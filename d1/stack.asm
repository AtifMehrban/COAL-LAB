[org 0x100]
jmp start
data: dw 5,4,7,1
swap: db 0

bubblesort:
    dec cx
    shl cx,1   ;jumping by 2 everytime
    mainloop:
        mov si,0    ;use as array index
        mov byte[swap],0    ;reset swap flag for iteration
        innerloop:
            mov ax,[bx + si]
            cmp ax,[bx + si + 2]
            jbe noswap
                mov dx,[bx + si + 2]
                mov [bx + si],dx
                mov [bx + si + 2],ax
                mov byte[swap],1

            noswap:
            add si,2
            cmp si,cx
            jne innerloop

        cmp byte[swap],1
        je mainloop

    ret ;notice this

start:
    mov bx,data
    mov cx,4
    ;make a func call

    call bubblesort

    ;data is now sorted
    mov ax,0x4c00
    int 0x21