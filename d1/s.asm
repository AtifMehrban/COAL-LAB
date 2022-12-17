org 0x100

boader:
	push ax
	push es
	push di
	
	mov ax,0xb800
	mov es,ax
	
	mov ah,0x60
	mov al,0x20
	mov di,482
	l1:
		 mov word[es:di],ax
		 add di,2
		 cmp di,636
		 jne l1
	
	cmp byte[cs:0],1
	jne nnp
		mov ah,0x40
		jmp npp
	nnp:
		mov ah,0x60
	npp:
		mov di,3680
	l2:
			mov word[es:di],ax
			add di,2
			cmp di,3836
			jne l2
	
	mov ah,0x60
	mov al,0x20
	mov di,482
	;l3:
	;	mov word[es:di],ax
	;	add di,160
	;	cmp di,3842
	;	jne l3
		
	mov di,636
	;l4:
	;	mov word[es:di],ax
	;	add di,160
	;	cmp di,3996
	;	jne l4
	pop di
	pop es
	pop ax

ret

call boader

mov ax,0x4c00
int 0x21
