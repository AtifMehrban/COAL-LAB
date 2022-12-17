[org 0x0100]
jmp start
data: dw 5
vally:
    mov ax,1
    vally1:
    push ax
    add ax,1
    cmp ax,[data]
    jne vally1
    pop ax
    ret 
mody:
    mov ax,1
    mov cx,0
indigo:
    pop bx
    mul bx
    add cx,1
    cmp cx,5
    jne indigo
    mov [data],bx
    ret
start:
    call vally
    call mody
    mov ax,0x4c00
    int 0x21
