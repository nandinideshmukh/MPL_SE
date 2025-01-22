%macro rw 4
    mov rax, %1        
    mov rdi, %2         
    mov rsi, %3       
    mov rdx, %4        
    syscall            
%endmacro

section .data
hello db "Enter string: "   
len equ $-hello                                

show db "The length of string is: "           
len2 equ $-show              

dis db 20


section .text
global _start
_start:

rw 1,1,hello,len

rw 0,0,dis,20

x:

add rax,30h

mov byte[dis],al
dec byte[dis]

rw 1,1,show,len2

rw 1,1,dis,1


mov rax, 60                                     
mov rdi, 00                                     
syscall
                 
