;data segmentation
msg1 db 10,13,'enter no here :-$'
msg2 db 10,13,'even here$'
msg3 db 10,13,'odd no here$' 
MSG DB  "prime no here$" 
NMSG DB "nonprime no here$" 
;data ends
;display macro msg
mov ah,9
lea dx,msg
int 21h
endm
;code segment
;assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
;display msg1
mov ah,1
int 21h
mov ah,0
check:
mov dl,2
div dl
cmp ah,0
jne odd
even:
;display msg2
jmp done
odd:
;display msg3
done:
START:MOV AX,@DATA
MOV DS,AX
MOV AL,NUM


MOV BL,02H
MOV DX,0000H
error

L1:DIV BL
CMP AH,00H
JNE NEXT
INC BH

NEXT:CMP BH,02H;
JE FALSE
INC BL

MOV AL,NUM
CMP BL,NUM

JNE L1

TRUE:
LEA DX,MSG
MOV AH,09H
INT 21H
JMP EXIT

FALSE:LEA DX,NMSG
MOV AH,09H
INT 21H
EXIT:
MOV AH,4CH
INT 21H
;END START
