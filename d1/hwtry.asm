[org 0x0100]


        mov bx, 0 ; initialize array index to zero
        mov ax, 0 ; initialize min to zero

        mov ax, [array_nums+bx]     ; max number to ax
        mov cx, 6

maxvalue:   cmp ax, [array_nums+bx]     ; find the maximun number
            jge maxloop                 ; if greater or equal number
            mov ax, [array_nums+bx]     ; ax contains the maximun number
maxloop:

        add bx, 2                   ; advance bx to next index
	loop maxvalue
	

        mov [max], ax               ; write back maximun in memory

        mov ax, 0x4c00              ; terminate program
        int 0x21

array_nums: dw 2,0,0,6,2,6
max: dw 0

