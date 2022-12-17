[org 0x0100]
jmp start 
data: dw 2,3,4,5,6,3,5,6,7,8
max: dw 0
min: dw 0
result: dw 0
start:
mov  ax,0
mov bx,0
mov cx,5
mov dx,0
innerloop:
mov ax,[data+bx]
cmp ax,dx
ja maxloop
add bx,2
sub cx,1
jnz innerloop
jmp minloop

maxloop:
mov dx,ax
add bx,2
sub cx,1
jnz innerloop
minloop:
mov [max],dx
mov cx,5
mov dx,0

outerloop:
mov ax,[data+bx]
cmp ax,dx
jb minimum
add bx,2
cmp bx,18
jne outerloop
jmp rezults

minimum:
mov dx,ax
add bx,2
cmp bx,18
jne outerloop
mov [min],dx

rezults:
add dx,[max]
mov [result],dx
mov ax,0x4c00  
int 0x21
