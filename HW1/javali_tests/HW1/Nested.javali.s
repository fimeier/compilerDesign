  # Emitting class Main {...}
    # Emitting void main(...) {...}
    .section .data
STR_D:
    .string "%d"
      # Emitting int r0
var_r0:
      	.int 0
      # Emitting int r1
var_r1:
      	.int 0
    	.section .text
    	.globl main
main:
    pushl %ebp
    movl %esp, %ebp
      # Emitting r0 = (((4 + 5) + (3 - 2)) + ((3 - 1) + (7 + 8)))
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
      movl %ecx, var_r0
      # Emitting write(r0)
        # Emitting r0
        movl var_r0, %ecx
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
      # Emitting r1 = ((9 - 1) + (6 + 6))
        # Emitting ((9 - 1) + (6 + 6))
          # Emitting (9 - 1)
            # Emitting 9
            movl $9, %ecx
            # Emitting 1
            movl $1, %edi
          sub %edi, %ecx
          # Emitting (6 + 6)
            # Emitting 6
            movl $6, %edi
            # Emitting 6
            movl $6, %esi
          add %edi, %esi
        add %ecx, %esi
      movl %esi, var_r1
      # Emitting write(r1)
        # Emitting r1
        movl var_r1, %esi
      sub $16, %esp
      movl %esi, 4(%esp)
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
