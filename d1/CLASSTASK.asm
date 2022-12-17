[org 0x100]
jmp start

 Section .data
msg db 'Enter word:  $'
num dd 0 , '$'


start :
	mov cx,6
	outerloop:
		mov bx,0
			innerloop:
				mov ax,[data + bx]
				cmp ax,[data + bx +2]	
				jbe my		
			my:
				cmp ax,2
				je noswap
				
					mov dx,[data + bx +2]
					mov [data + bx + 2],ax		;again with ax?
					mov [data + bx],dx
				noswap:
				add bx,2
				cmp bx,10
				jne innerloop
			
		sub cx,1
		jnz outerloop
		
		;exit system call
		
		mov ax, 0x4c00
		int 0x21		
