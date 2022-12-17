org 100h

jmp start
data: db 'I'
msg1end:
data2: db ' Love '
msg2end:
data3: db 'Pakistan'
msg3end:
clearscreen:

	mov ah, 06h ; scroll up function
	xor al, al  ; number of lines by which to scroll up
	mov al, 25
	xor cx, cx  ; upper left corner ch = row , cl = column
	mov dx, 184fh ; lower right corner dh = row, dl = column
	mov bh, 00h ; BlackonBlack

	int 10h
	ret

setcursor:
	    
    mov  dh, 24	
    mov  dl, 2	    
    mov  bh, 00h ;    
   mov  ah, 02h     
    int  10h
ret


printstr:

	mov cx, msg1end - data 
	mov al, 1
	mov bh, 0
	mov bl, 00fh	; color the text and background
	mov dh, 20	; row number 5
	mov dl,13	;coloumn no 13
	push cs
	pop es
	mov bp, data
	mov ah, 13h	; To print string on screen we use
	INT 10h
	; mov ah, 00h	;BIOS.WaitKeyboardKey
	 int 16h	; ->Ax

	mov cx, msg2end - data2 ;calculate msg size

	mov al, 1
	mov bh, 0
	mov bl, 00fh	; color the text and background
	mov dh, 13	; row number 5
	mov dl, 36	;coloumn no 13
	push cs
	pop es
	mov bp, data2
	mov ah, 13h	; To print string on screen we use
	INT 10h

	; mov ah, 00h	
	 int 16h
	 
	 mov cx, msg3end - data3 ;calculate msg size
	
	mov al, 1
	mov bh, 0
	mov bl, 00fh	
	mov dh, 50	; row  5
	mov dl, 60	;coloumn  13
	push cs
	pop es
	mov bp, data3
	mov ah, 13h
	INT 10h

	
	 int 16h	


ret



setBorderColour:


mov ah, 06h	;scroll up function
	xor al, al	;number of lines by which to scroll up
	;xor cx, cx	;upper left corner, ch = row, cl=coloumn
	mov dx, 3501H 	;lower right corner DH=row, DL=coloumn
	mov ch , 2
	mov cl , 18
	mov dh, 20
	mov dl, 25
	mov bh, 1111h	
	int 10h

mov ah, 06h	;scroll up function
	xor al, al	;number of lines by which to scroll up
	;xor cx, cx	;upper left corner, ch = row, cl=coloumn
	mov dx, 3501H 	;lower right corner DH=row, DL=coloumn
	mov ch , 16
	mov cl , 2
	mov dh, 28
	mov dl, 25
	mov bh, 1111h	
	int 10h
mov ah, 06h	;scroll up function
	xor al, al	
	mov ch , 8
	mov cl , 25	
	mov dh, 17
	mov dl, 47
	mov bh, 07FH	
	int 10h
	
	mov ah, 06h	;scroll up function
	xor al, al	;number of lines by which to scroll up
	
	mov ch , 2
	mov cl , 45
	mov dh, 11
	mov dl, 75
	mov bh, 07FH	
	int 10h
ret


setcursor1:
    mov  dh, 1		;Row (12)
    mov  dl, 2	     ; Column (35)
    mov  bh, 00h ; 00h or 0h 
    mov  ah, 02h      ; BIOS.SetCursorPosition
    int  10h
ret

start:

	call clearscreen
	call setBorderColour
	call printstr
	call setcursor1
	call setcursor
	
	

	mov ax, 0x4c00
	int 21h
