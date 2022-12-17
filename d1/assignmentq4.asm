[org 0x100]
 jmp start
 
nums: db 99,12,56,45,36 


start: mov ax,data 
mov ds,ax 
mov ch,04
up2: mov cl,04
lea si,nums 
up1:
	mov al,[si] 
	mov bl,[si+1] 
	cmp al,bl 
	jnc down 
	mov dl,[si+1] 
	xchg [si],dl 
	mov [si+1],dl 
down: 
	inc si 
	dec cl 
	jnz up1 
	dec ch 
	jnz up2 
 mov  ax,0x4x00
 int 0x21
