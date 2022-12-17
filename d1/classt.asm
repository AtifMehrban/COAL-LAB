   org  0x100        ; .com files always start 256 bytes into the segment

    ; int 21h is going to want...

    mov  dx, msg      ; the address of or message in dx
    mov  ah, 9        ; ah=9 - "print string" sub-function
    int  0x21         ; call dos services

    mov  dl, 0x0d     ; put CR into dl
    mov  ah, 2        ; ah=2 - "print character" sub-function
    int  0x21         ; call dos services

   
  mov  dl, 0x0a     ; put LF into dl
    mov  ah, 2        ; ah=2 - "print character" sub-function
    int  0x21         ; call dos services
    
     mov  dx, rollno      ; the address of or message in dx
    mov  ah, 9        ; ah=9 - "print string" sub-function
    int  0x21         ; call dos services

   ; mov  dl, 0x0d     ; put CR into dl
    ;mov  ah, 2        ; ah=2 - "print character" sub-function
    ;int  0x21         ; call dos services

;    mov  dl, 0x0a     ; put LF into dl
 ;   mov  ah, 2        ; ah=2 - "print character" sub-function
  ;  int  0x21         ; call dos services
    

    mov  ah, 0x4c     ; "terminate program" sub-function
    int  0x21         ; call dos services

    msg  db 'My Name is HAMMAAD AHMAD KHALID $',0x0a  ; $-terminated message
    rollno: db 'LAST 4 digits of my ROLL NUMBER ARE 0626 $ ',0x0a,0x0d
    rollnop : dw 0,6,2,6
