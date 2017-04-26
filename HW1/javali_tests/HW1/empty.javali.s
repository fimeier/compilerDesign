  # Emitting class Main {...}
    # Emitting void main(...) {...}
    .section .data
STR_D:
    .string "%d"
    	.section .text
    	.globl main
main:
    pushl %ebp
    movl %esp, %ebp
    movl $0, %eax
    leave
    ret
