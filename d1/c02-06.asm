; a program to add three numbers using byte variables
[org 0x100]
	mov	0x8787
	xor	ax,ax			;we need yo make sure AX is empty! or we do?
	

	mov	ah,[num1]		;intel software developer manual - figure 3-5(page 76)
	
	mov	bl,[num1+1]
	add	ah,bh

	mov	bh,[num1+2]
	add	ah,bh

	mov	[num1+3],ah
	mov	ax,0x4c00
	int	0x21
num1: db	5, 10, 15, 0

