;a program to add three numbers directly in memory
[org 0x100]
	mov ax,[num1]
	mov [result],ax	;add this value to result
	mov ax,[num1 + 2]
	add [result],ax
	mov ax,[num1 + 4]
	add [result],ax
	mov ax,0x4c00
	int 0x21
num1: dw 5, 10, 15
result: dw 0
;should show the result seperate