[org 0x100]
jmp start
data : dw 2,10,2,4    ;2,3,4,10
start :
	mov cx,4
	outerloop:
		mov bx,0
			innerloop:
				mov ax,[data + bx]
				cmp ax,[data + bx +2]	;why did we move value to ax?
				jbe noswap		;if we dont have to swap,we just?
						;THINK of this as the "if"
				;swap position
					mov dx,[data + bx +2]
					mov [data + bx + 2],ax		;again with ax?
					mov [data + bx],dx
				noswap:
				add bx,2
				cmp bx,6
				jne innerloop
			
			;xheck outer loop termination
		sub cx,1
		jnz outerloop
		
		;exit system call
		
		mov ax, 0x4c00
		int 0x21				
				
				
