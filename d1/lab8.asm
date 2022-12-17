[org 0x100]
jmp start ;0103

 num1: dd 0x40ff ;16639 ;100000011111111
 dest1: dw 0x0
 dest2: dd 0x40ff
 start:
        ;shift left when a single register is capable to hold number
        mov ax,[num1]
        shl ax,1
        mov [dest1],ax
        ;shift when a single register can not hold our number
        shl byte[dest2],1   ;first 8bits
        rcl byte[dest2+1],1 ;next 8bits

    mov ax,0x4C00
    int 0x21