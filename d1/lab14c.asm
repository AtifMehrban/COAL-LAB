        global say_hi
        section .text

say_hi:
        mov rax,rdi
        push rax
            ;printname
        mov rax,1   ;sys write
        mov rdi,1   ;std out
        mov rsi,hello  ;start adress of name
        mov rdx,helloln-hello ;length
        syscall ;interupt
        pop rax ;pop parameter
        inc rax 
        ret

section .data
        hello: db 'Hi,Fastian Welcome Back from Assembly :)',10
        helloln:
        ;nasm -f elf64 lab14c.asm -o lab13c.o
