  # Emitting class Main {...}
    # Emitting void main(...) {...}
    .section .data
STR_D:
    .string "%d"
      # Emitting int a
var_a:
      	.int 0
      # Emitting int b
var_b:
      	.int 0
      # Emitting int c
var_c:
      	.int 0
      # Emitting int d
var_d:
      	.int 0
    	.section .text
    	.globl main
main:
    pushl %ebp
    movl %esp, %ebp
      # Emitting a = 30
        # Emitting 30
        movl $30, %edi
      movl %edi, var_a
      # Emitting b = -(20)
        # Emitting -(20)
          # Emitting 20
          movl $20, %edi
        neg %edi
      movl %edi, var_b
      # Emitting c = 2147483647
        # Emitting 2147483647
        movl $2147483647, %edi
      movl %edi, var_c
      # Emitting d = -(c)
        # Emitting -(c)
          # Emitting c
          movl var_c, %edi
        neg %edi
      movl %edi, var_d
      # Emitting c = +(c)
        # Emitting +(c)
          # Emitting c
          movl var_c, %edi
      movl %edi, var_c
      # Emitting d = (d - 2)
        # Emitting (d - 2)
          # Emitting d
          movl var_d, %edi
          # Emitting 2
          movl $2, %esi
        sub %esi, %edi
      movl %edi, var_d
      # Emitting write(d)
        # Emitting d
        movl var_d, %edi
      sub $16, %esp
      movl %edi, 4(%esp)
      movl $STR_D, 0(%esp)
      call printf
      add $16, %esp
      # Emitting writeln()
      sub $12, %esp
      pushl $10
      call putchar
      add $16, %esp
      # Emitting write(b)
        # Emitting b
        movl var_b, %edi
      sub $16, %esp
      movl %edi, 4(%esp)
      movl $STR_D, 0(%esp)
      call printf
      add $16, %esp
      # Emitting writeln()
      sub $12, %esp
      pushl $10
      call putchar
      add $16, %esp
      # Emitting write(-(2147483645))
        # Emitting -(2147483645)
          # Emitting 2147483645
          movl $2147483645, %edi
        neg %edi
      sub $16, %esp
      movl %edi, 4(%esp)
      movl $STR_D, 0(%esp)
      call printf
      add $16, %esp
      # Emitting writeln()
      sub $12, %esp
      pushl $10
      call putchar
      add $16, %esp
    movl $0, %eax
    leave
    ret
