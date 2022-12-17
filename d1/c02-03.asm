; a progarm to add three numbers accessed using a single label

[org 0x100]
	mov ax,[num1]
	mov bx,[num1 + 2]
	add ax,bx
	mov bx,[num1 + 4]
	add ax ,bx
	mov [result],ax
	mov ax,0x4c00
	int 0x21
num1:	dw	5,	10,	15
result: dw	0