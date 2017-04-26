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
      # Emitting write(0)
        # Emitting 0
        movl $0, %edi
      sub $16, %esp
      movl %edi, 4(%esp)
      movl $STR_D, 0(%esp)
      call printf
      add $16, %esp
      # Emitting write(-(1))
        # Emitting -(1)
          # Emitting 1
          movl $1, %edi
        neg %edi
      sub $16, %esp
      movl %edi, 4(%esp)
      movl $STR_D, 0(%esp)
      call printf
      add $16, %esp
      # Emitting write((2 + 4))
        # Emitting (2 + 4)
          # Emitting 2
          movl $2, %edi
          # Emitting 4
          movl $4, %esi
        add %edi, %esi
      sub $16, %esp
      movl %esi, 4(%esp)
      movl $STR_D, 0(%esp)
      call printf
      add $16, %esp
    movl $0, %eax
    leave
    ret
