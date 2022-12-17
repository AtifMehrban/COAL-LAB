[org 0x100]
jmp start
data: dw 0

val:
    mov ax,1
    val1:
    push ax
    add ax,1
    cmp ax,6
    jne val1
   ; pop ax
    ;pop bx
    ;pop cx
   ; pop di
   ; pop si
    ;mul bx
    ;mul cx
    ;mul di
    ;mul si
    ;mov [data],ax
     
    
mod:

    mov ax,1
    mov cx,0
init:
    pop bx
    mul bx
    add cx,1
    cmp cx,5
     jne init
    mov [data],bx
    ret
start:
    call val
    
    mov ax,0x4c00
    int 0x21 
	
	
