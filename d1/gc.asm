[org 0x0100]
jmp start

start_game: db 0

inst: db 'PRESS I TO GO INTO INSTRUCTION BOX'


welcome_str: db 'WELCOME TO BRICK BREAKER'
option_str: db 'PLEASE SELECT OPTIONS'
instructions_str: db 'INSTRUCTION'
play_str: db 'PRESS ENTER TO PLAY GAME'

ttl_live_str: db 'YOUR TOTAL LIVES ARE 3'
bonus_note_str: db 'BONUS AWARDED IF BREAK ALL BRICKS IN 2 MINS' 
solid_base_str: db 'HITTING RED BRICK WILL SOLIDIFY YOUR BASE'

space_bar: db 'PRESS SPACE BAR TO RELEASE BALL'

total_score_str: db 'YOUR TOTAL SCORES :'
lives_remain_str: db 'LIVES REMAINING'
exit_str: db 'PRESS E TO EXIT'
quit_str: db 'PRESS ENTER+Q TO QUIT GAME'
restart_str: db 'PRESS ENTER+R TO RESTART YOUR GAME'

left_arrow: db 'USE RIGHT & LEFT ARROW TO MOVE BAR'


start_menu:
	push ax
	call clrscr
	
	mov ax , 690  ; row 6 col 25
	push ax
	mov ax ,welcome_str
	push ax
	mov ax , 24
	push ax
	
	call printstr_B
	
	
	mov ax , 1010
	push ax
	mov ax , option_str
	push ax
	mov ax , 21
	push ax
	
	call printstr
	
	
	mov ax , 1330
	push ax
	mov ax , play_str
	push ax
	mov ax , 24
	push ax
	call printstr
	
	
	
	mov ax , 1650
	push ax
	mov ax , inst
	push ax
	mov ax , 35
	push ax
	call printstr
	
	
	
	pop ax
	ret
	
; printnum: 
; push bp
; mov bp, sp
; push es
; push ax
; push bx
; push cx
; push dx
; push di
; mov ax, 0xb800
; mov es, ax ; point es to video base
; mov ax, [bp+4] ; load number in ax
; mov bx, 10 ; use base 10 for division
; mov cx, 0 ; initialize count of digits
; nextdigit: mov dx, 0 ; zero upper half of dividend
; div bx ; divide by 10
; add dl, 0x30 ; convert digit into ascii value
; push dx ; save ascii value on stack
; inc cx ; increment count of values
; cmp ax, 0 ; is the quotient zero
; jnz nextdigit ; if no divide it again
; mov di, [bp+6] ; point di to 70th column
; nextpos: pop dx ; remove a digit from the stack
; mov dh, 0x07 ; use normal attribute
; mov [es:di], dx ; print char on screen
; add di, 2 ; move to next screen location
; loop nextpos ; repeat for all digits on stack
; pop di
; pop dx
; pop cx
; pop bx
; pop ax
; 
; pop es
; pop bp
; ret 4
; 
printstr:
 push bp
mov bp, sp
push es
push ax
push cx
push si
push di
mov ax, 0xb800
mov es, ax ; point es to video base
mov di, [bp+8] ; point di to top left column
mov si, [bp+6] ; point si to string
mov cx, [bp+4] ; load length of string in cx
mov ah, 0x0a ; normal attribute fixed in al
nextchar: 
mov al, [si] ; load next char of string
mov [es:di], ax ; show this char on screen
add di, 2 ; move to next screen location
add si, 1 ; move to next char in string
loop nextchar ; repeat the operation cx times
pop di
pop si
pop cx
pop ax
pop es
pop bp
ret 6

printstr_B:
 push bp
mov bp, sp
push es
push ax
push cx
push si
push di
mov ax, 0xb800
mov es, ax ; point es to video base
mov di, [bp+8] ; point di to top left column
mov si, [bp+6] ; point si to string
mov cx, [bp+4] ; load length of string in cx
mov ah, 0x84 ; normal attribute fixed in al
nextchar1: 
mov al, [si] ; load next char of string
mov [es:di], ax ; show this char on screen
add di, 2 ; move to next screen location
add si, 1 ; move to next char in string
loop nextchar1 ; repeat the operation cx times
pop di
pop si
pop cx
pop ax
pop es
pop bp
ret 6

clrscr: 
	push es
	push ax
	push cx
	push di
	mov ax, 0xb800
	mov es, ax ; point es to video base
	xor di, di ; point di to top left column
	mov ax, 0x0720 ; space char in normal attribute
	mov cx, 2000 ; number of screen locations
	cld ; auto increment mode
	rep stosw ; clear the whole screen
	pop di 
	pop cx
	pop ax
	pop es
ret 

call_instruction_menu: db 0
instruction_menu:
	push ax
	call clrscr
	
	
	mov ax , 370 ; row 6 col 25
	push ax
	mov ax ,instructions_str
	push ax
	mov ax , 11
	push ax
	call printstr_B
	
	mov ax , 690  ; row 6 col 25
	push ax
	mov ax , ttl_live_str
	push ax
	mov ax , 22
	push ax
	
	call printstr
	
	mov ax , 1010
	push ax
	mov ax , play_str
	push ax
	mov ax , 24
	push ax
	call printstr
	
	
	
	mov ax , 1330
	push ax
	mov ax , solid_base_str
	push ax
	mov ax , 41
	push ax
	call printstr
	
	
	mov ax , 1650
	push ax
	mov ax , bonus_note_str
	push ax
	mov ax , 43
	push ax
	call printstr
	
		
	mov ax , 1970
	push ax
	mov ax , space_bar
	push ax
	mov ax , 31
	push ax
	call printstr
	
	
	mov ax , 2290
	push ax
	mov ax , left_arrow
	push ax
	mov ax , 34
	push ax
	call printstr
	
	mov ax , 2610
	push ax
	mov ax , exit_str
	push ax
	mov ax , 15
	push ax
	call printstr
	
	pop ax
	ret

kbisr: 
	push ax
	push es
	mov ax, 0xb800
	mov es, ax 
	
	in al, 0x60
	cmp al , 0x1c
	jne cmp_instruction

	cmp_instruction:
	cmp al , 0x17
	jne exit
	mov byte[call_instruction_menu] , 1
	exit:
		mov al, 0x20
		out 0x20, al 

	pop es
	pop ax 
iret 
		


start:
	
	xor ax, ax
	mov es, ax ; point es to IVT base
	
	mov ax, [es:9*4]
	mov ax, [es:9*4+2]
	mov ax, [es:8*4]
	mov ax, [es:8*4+2]
;	cli ; disable interrupt
;		mov [es:9*4+2], cs 
	cli ; disable interrupts
		mov word [es:9*4], kbisr 
		mov [es:9*4+2], cs
	sti

	
 call start_menu

menu_loop:
	cmp byte[call_instruction_menu] , 0
	je instruction
 instruction:
	call instruction_menu
 again_ins
	je start_menu
	jne again_ins	
go_quit:
		pop ax
		ret		

