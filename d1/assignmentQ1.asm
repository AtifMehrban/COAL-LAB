[org 0x100]

mov ax,0
mov bx,20
mov cx,20

outerloop:
	add ax,bx
	sub cx,1
	jnz outerloop
	
mov ax,0x4c00
int 0x21
