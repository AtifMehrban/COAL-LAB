;assembly language program to add three numbers
org 0x100
mov ax,5	;move the constant 5 int to register ax
mov bx,10	;move the constant 10 int to register bx
add ax,bx	;add value of bx into ax
mov bx,15
add ax,bx
mov ax,0x4c00   ;exit
int 0x21	;... is what the OS should do for me