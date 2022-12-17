;code for q1

[org 0x100]
mov bx,0
mov cx,6




;label1:
	mov ax,12
	cmp ax,[nums + bx]
	add bx,2
	jge label2
	jb  label3
label2:
	mov [greater + bx],ax
label3:
	mov [less + bx],ax
	
	sub cx,1
	jnz label1
	


	mov ax,0x4c00
	int 0x21
	
nums: dw 5,6,8,10,11,20
greater: dw 0,0,0,0,0,0
less: dw 0,0,0,0,0,0

	
	
