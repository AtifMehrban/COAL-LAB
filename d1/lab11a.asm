[org 0x100]
jmp start
data: dw 0

loop:
    mov ax,1
    loop1:
    push ax
    add ax,1
    cmp ax,6
    jne loop1
    pop ax
    pop bx
    pop cx
    pop di
    pop si
    mul bx
    mul cx
    mul di
    mul si
    mov [data],ax
    ret 
	
	
	
	
start:
	call loop
	
	  mov ax,0x4c00
    	int 0x21
