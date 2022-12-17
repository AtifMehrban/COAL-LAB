; a progarm to add three numbers using byte variables 
[org 0x0100]

	;for(int c=3;c>0;c--){
	;result +=data[c];
	;}

;initialize stuff

mov	ax,0x8787
mov	ax,0	;reset the accumulator

mov	ax,0x8787
xor	ax,ax	;reset the accumulator,set changes in zf.

mov	cx,3	;set the iterator count
mov	bx,num1	;set the base

outerloop:
	add ax,[bx]
	add bx,2

	sub cx,1
	jnz outerloop	;jump to other label if zero flag(zf != 1) is not set
;its means if previous result of arthematic or logical operation is not zero
;then move to outerloop otherwise ignore

	mov	[result],ax
	mov	ax,0x4c00
	int	0x21

	;intel software developer manual- EFLAGS AND instructions (page 435)

num1: dw 5, 10, 15

result: dw 0