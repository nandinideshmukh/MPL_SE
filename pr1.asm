%macro rw 4
    mov rax, %1        
    mov rdi, %2         
    mov rsi, %3       
    mov rdx, %4        
    syscall            
%endmacro

section .data
hello db "Enter 5 quadwords: ", 0xA   
len equ $-hello                                

show db "The 5 quadwords are: ", 0xA              
len2 equ $-show                               

cnt1 db 5h                                    
cnt2 db 5h                                    

section .bss
arr resb 85                                     


section .text
global _start
_start:

rw 1,1,hello,len
mov r8, arr                                     

l1:

	rw 0,0,r8,17
	
	add r8, 17                                      
	dec byte[cnt1]                                  
	JNZ l1                                          

rw 1,1,show,len2
syscall

mov r8, arr                                     

l2:

	rw 1,1,r8,17

	add r8, 17                                      
	dec byte[cnt2]                                 
	JNZ l2                                          


mov rax, 60                                     
mov rdi, 00                                     
syscall
