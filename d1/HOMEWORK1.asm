;this program will print largest integers of my rollnumber
[org 0x0100]
        mov bx, 0 
        mov ax, 0    
        mov ax, [roll_no+bx]  
        mov cx, 6

largest:   cmp ax, [roll_no+bx]
            jge numbers            
            mov ax, [roll_no+bx]  
numbers:

        add bx, 2                   
	sub cx,1
	jnz largest
	

        mov [largest_number], ax               

        mov ax, 0x4c00        
        int 0x21

roll_no: dw 2,0,0,6,2,6
largest_number: dw 0

