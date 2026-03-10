section .data
    msg db "Hello, World!", 0xa ; Your message and a newline character (0xa)
    len equ $ - msg            ; Length of the message

section .text
    global _start              ; Declares _start as the entry point for the linker

_start:
    ; syscall for sys_write (sys_write is 1 on 64-bit Linux)
    mov rax, 1                 ; syscall number for sys_write
    mov rdi, 1                 ; file descriptor 1 = stdout
    mov rsi, msg               ; address of the message
    mov rdx, len               ; message length
    syscall                    ; invoke syscall

    ; syscall for sys_exit (sys_exit is 60 on 64-bit Linux)
    mov rax, 60                ; syscall number for sys_exit
    xor rdi, rdi               ; exit code 0
    syscall                    ; invoke syscall

