; calculateMean Median and Mode on below dataset. 

[org 0x100]

jmp start 

data:   dw  8, 7, 1,2,4,3,6,5,3,4
size:  dw 10
mean: dw 0
median: dw 0
modee: dw 0
swap:db 0

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



calculateMean:
	mov ax,0
	mov bx,0
	mov cx,[size]
	shl cx,1
	mov dx,[size]


	loop1:
		add ax ,[data+bx]
		add bx,2
		cmp bx,cx
		jne loop1
		
		div dx
		
		mov [mean],ax
		ret

calculateMedian:
	mov ax,0
	mov bx, 0
	mov ax,[data+bx]
	add ax , [data+bx-2]
	mov [median] , ax

call bubblesort

	mov cx, [size]
	
	shr cx,1
	
	shl cx,1
	cmp cx,size

	je calculateMedian
	mov ax , [data+bx]
	mov [median] , ax


calculateMode:
	call bubblesort
	mov bx, 0
l3:

	add bx ,2

l1:
	mov ax ,[data+bx]
l2:
	cmp ax ,[data+bx +2]
	je mode
	add bx,2
	cmp bx , 20
	je l3
	jne l2

	mode:
	add cx , 1
	cmp cx,7
	jnz l1

mov [modee] , cx 

ret


start:
	call calculateMean

 	call calculateMedian

	call calculateMode

    mov ax, 0x4c00
    int 0x21
