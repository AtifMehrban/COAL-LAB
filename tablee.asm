.model small

.data

result dword

num dword

msg byte "Enter number You Want To Print Table$",0,13h,10h

msg1 byte " * ",0

msg2 byte " = ",0

.code

main: 

call clrscr

mov dx,msg

mov string

mov num,ax

mov cx,10

mov bx,1

L1:

mov ax,num

call int

mul bx

mov dx, msg1

call ring

mov result,ax

mov ax,bx


mov dx,msg2

call string

mov ax,result

call int
loop L1.model small

.data

result dword

num dword

msg byte "Enter number You Want To Print Table$",0,13h,10h

msg1 byte " * ",0

msg2 byte " = ",0

.code

main: 

call clrscr

mov dx,msg

mov string

mov num,ax

mov cx,10

mov bx,1

L1:

mov ax,num

call int

mul bx

mov dx, msg1

call ring

mov result,ax

mov ax,bx


mov dx,msg2

call string

mov ax,result

call int
loop L1