org 0x100
section.text
	global_start
	
_start:
	mov ebx,'0'
	add eax,ebx
	
	mov ebx,'6'
	add eax,ebx
	
	mov ebx,'2'
	add eax,ebx
	
	mov ebx,'6'
	add eax,ebx
	
	mov [sum],eax
	mov ecx,rollno
	mov edx,len
	mov ebx,1
	mov eax,4
	int 0x80
	
	mov ecx,rollno
	mov edx,1
	mov ebx,1
	mov eax,4
	int 0x80
	
	
	mov eax,1
	int 0x80
	
	
	
section.data
	rollno: db "0626",0xA,0x0
	name: db "WELCOME FROM HAMMAAD",0xA.0x0
	msg: db "the sum of roll number is : ",0xA
	len:equ $-rollno
	sum: db 0
