; a program to add three numbers using byte variables
[org 0x100]
	mov	ax,0x8787
	xor	ax,ax			;we need to make sure AX is empty!
	

	mov	ax,0x8787
	mov	ax,0			;another way to empty the registers	 	

	mov	al,[num1]
	mov	bl,[num1+1]
	add	al,bl

	mov	bl,[num1+2]
	add	al,bl

	mov	[num1+3],al
	mov	ax,0x4c00
	int	0x21
num1: db	5, 10, 15, 0