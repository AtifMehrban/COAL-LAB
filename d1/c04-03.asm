[org 0x100]
jmp start
multiplicand : dw 0xC8  ;200 = 0b 11001000
multiplier : db 0x32    ;50 = 0b 00110010
result : dw 0 ;should be 10,000 = 0x2710 

start:
        mov cl,8
        mov dl,[multiplier]

checkbit:
        shr dl,1
        jnc skip

            mov al,[multiplicand]
            add byte[result],al
            mov al,[multiplicand + 1]
            adc byte [result + 1],al

        skip:
        shl byte[multiplicand],1
        rcl byte[multiplicand + 1],1
        dec cl
        jnz checkbit

;exit syscall 
mov  ax, 0x4c00
int  0x21
