[org 0x100]
jmp start

data: dw 2,3,4,5,6,9,6,7,6,6,6
swap : db 0
mostrep: dw 0

bubblesort: 
    dec  cx
    shl  cx, 1                   

    mainloop:  
        mov  si, 0               
        mov  byte[swap], 0       

        innerloop: 
            mov  ax, [bx + si]
            cmp  ax, [bx + si + 2]
            jbe  noswap 

                mov  dx, [bx + si + 2]
                mov  [bx + si], dx 
                mov  [bx + si + 2], ax 
                mov  byte[swap], 1 

            noswap: 
            add  si, 2 
            cmp  si, cx
            jne  innerloop

        cmp  byte[swap], 1 
        je   mainloop 

    ret  ; 
    
calculatemstrep:
	call bubblesort
	mov bx, 0
l3:

	add bx ,2

l1:
	mov ax ,[data+bx]
l2:
	cmp ax ,[data+bx +2]
	je repeat
	add bx,2
	cmp bx , 20
	je l3
	jne l2

	repeat:
	add cx , 1
	cmp cx,7
	jnz l1

mov [mostrep] , cx 

ret
    
start:
	call bubblesort
	
	
	
mov ax,0x4c00
int 0x21
