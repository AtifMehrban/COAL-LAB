;add roll number
[org 0x0100]
	mov ax,0
	mov bx,0
	mov cx,6
	outerloop:
		add ax,[num1 + bx]
		add bx,2
		cmp bx,0
		je outerloop
	overloop:
		add ax,[num1 + bx]
		;add bx,2
		cmp bx,14
		je outerloop
		
	mov [result],ax
	mov ax,0x4c00
		

num1: dw	2,0,0,6,2,6
result:dw	0