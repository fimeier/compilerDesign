  # Emitting class Main {...}
    # Emitting void main(...) {...}
    .section .data
STR_D:
    .string "%d"
      # Emitting int a
var_a:
      	.int 0
    	.section .text
    	.globl main
main:
    pushl %ebp
    movl %esp, %ebp
      # Emitting a = 10
        # Emitting 10
        movl $10, %edi
      movl %edi, var_a
      # Emitting write(a)
        # Emitting a
        movl var_a, %edi
      sub $16, %esp
      movl %edi, 4(%esp)
      movl $STR_D, 0(%esp)
      call printf
      add $16, %esp
    movl $0, %eax
    leave
    ret
