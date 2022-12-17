org 100h


jmp start

data: db 'Assembly Language - Course, FAST University Peshawar Campus'
msg1end:
clearscreen:
	mov ah,07h
	xor al,al
	xor cx,cx
	mov dx,174fh
	mov bh, 00h
	
	int 10h
	
ret
topborder:
	mov ah,07h 
	xor al,al
	mov ch,0   ;upper left corner row
	mov cl,0   ;upper left colum  
	mov dh,6   ;lower right corner row
	mov dl,40 ;lower right corner colum
	
	mov bh,60h    
	int 10h
ret

topborder1:
	mov ah,07h 
	xor al,al
	mov ch,0   ;upper left corner row
	mov cl,26   ;upper left colum  
	mov dh,6   ;lower right corner row
	mov dl,79 ;lower right corner colum
	
	mov bh,20h    
	int 10h
ret

topborder2:
	mov ah,07h 
	xor al,al
	mov ch,7  ;upper left corner row
	mov cl,0   ;upper left colum  
	mov dh,9   ;lower right corner row
	mov dl,79 ;lower right corner colum
	
	mov bh,20h    
	int 10h

ret
topborder3:
	mov ah,07h 
	xor al,al
	mov ch,9  ;upper left corner row
	mov cl,0   ;upper left colum  
	mov dh,11   ;lower right corner row
	mov dl,79 ;lower right corner colum
	
	mov bh,70h    
	int 10h

ret
topborder4:
	mov ah,07h 
	xor al,al
	mov ch,12  ;upper left corner row
	mov cl,0   ;upper left colum  
	mov dh,14   ;lower right corner row
	mov dl,79 ;lower right corner colum
	
	mov bh,20h    
	int 10h

ret
topborder5:
	mov ah,07h 
	xor al,al
	mov ch,15  ;upper left corner row
	mov cl,0   ;upper left colum  
	mov dh,16   ;lower right corner row
	mov dl,79 ;lower right corner colum
	
	mov bh,70h    
	int 10h

ret

topborder6:
	mov ah,07h 
	xor al,al
	mov ch,16  ;upper left corner row
	mov cl,0   ;upper left colum  
	mov dh,17   ;lower right corner row
	mov dl,79 ;lower right corner colum
	
	mov bh,20h    
	int 10h

ret
topborder7:
	mov ah,07h 
	xor al,al
	mov ch,18  ;upper left corner row
	mov cl,0   ;upper left colum  
	mov dh,19   ;lower right corner row
	mov dl,79 ;lower right corner colum
	
	mov bh,70h    
	int 10h

ret

topborder8:
	mov ah,07h 
	xor al,al
	mov ch,20  ;upper left corner row
	mov cl,0   ;upper left colum  
	mov dh,21   ;lower right corner row
	mov dl,79 ;lower right corner colum
	
	mov bh,20h    
	int 10h

ret


printstr:

    mov cx, msg1end - data 
    ;mov  bx, 0001h    
    mov al, 1    
    mov bh, 0
    mov bl, 60h  ; fore and background color
    
    mov dh, 0         ; Row  12
    mov dl , 30        ; Col 15
    push cs
    pop es
    mov bp,  data
    mov ah , 13h      
    int  10h
  
    mov  ah, 00h      
    int  16h         
ret 



start:
call clearscreen


call topborder


call topborder1
call topborder2
call topborder3
call topborder4
call topborder5
call topborder6
call topborder7
call topborder8

call printstr


mov ax,0x4c00
int 0x21
