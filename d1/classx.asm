[org 0x100]
jmp start 
data: dw 8,2,5,3,2,1

start:

        mov cx,6
        outerloop:
            mov bx,0
                innerloop:
                    mov ax,[data + bx]
                   cmp ax,[data + bx +2]
                   jbe noswap
                   cmp ax,2
                   jz inloop

              inloop:
                    cmp ax,2
                    jz noswap  


                        mov dx,[data + bx +2]
                        cmp dx,2
                        je noswap

                        mov [data + bx + 2],ax
                       
                        mov [data +bx],dx

                noswap: 
                        add bx,2
                        cmp bx,10
                        jne innerloop

            sub cx,1
            jnz outerloop

            mov ax,0x4c00
            int 0x21