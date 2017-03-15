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
    	.section .text
    	.globl main
main:
    pushl %ebp
    movl %esp, %ebp
      # Emitting a = (((4 + 5) + (3 - 2)) + ((3 - 1) + (7 + 8)))
        # Emitting (((4 + 5) + (3 - 2)) + ((3 - 1) + (7 + 8)))
          # Emitting ((4 + 5) + (3 - 2))
            # Emitting (4 + 5)
              # Emitting 4
              movl $4, %edi
              # Emitting 5
              movl $5, %esi
            add %edi, %esi
            # Emitting (3 - 2)
              # Emitting 3
              movl $3, %edi
              # Emitting 2
              movl $2, %edx
            sub %edx, %edi
          add %esi, %edi
          # Emitting ((3 - 1) + (7 + 8))
            # Emitting (3 - 1)
              # Emitting 3
              movl $3, %esi
              # Emitting 1
              movl $1, %edx
            sub %edx, %esi
            # Emitting (7 + 8)
              # Emitting 7
              movl $7, %edx
              # Emitting 8
              movl $8, %ecx
            add %edx, %ecx
          add %esi, %ecx
        add %edi, %ecx
      movl %ecx, var_a
      # Emitting write(a)
        # Emitting a
        movl var_a, %ecx
      sub $16, %esp
      movl %ecx, 4(%esp)
      movl $STR_D, 0(%esp)
      call printf
      add $16, %esp
      # Emitting writeln()
      sub $12, %esp
      pushl $10
      call putchar
      add $16, %esp
      # Emitting b = ((8 - 5) + (4 + (7 - 1)))
        # Emitting ((8 - 5) + (4 + (7 - 1)))
          # Emitting (8 - 5)
            # Emitting 8
            movl $8, %ecx
            # Emitting 5
            movl $5, %edi
          sub %edi, %ecx
          # Emitting (4 + (7 - 1))
            # Emitting (7 - 1)
              # Emitting 7
              movl $7, %edi
              # Emitting 1
              movl $1, %esi
            sub %esi, %edi
            # Emitting 4
            movl $4, %esi
          add %esi, %edi
        add %ecx, %edi
      movl %edi, var_b
      # Emitting write(((a + b) - a))
        # Emitting ((a + b) - a)
          # Emitting (a + b)
            # Emitting a
            movl var_a, %edi
            # Emitting b
            movl var_b, %ecx
          add %edi, %ecx
          # Emitting a
          movl var_a, %edi
        sub %edi, %ecx
      sub $16, %esp
      movl %ecx, 4(%esp)
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
