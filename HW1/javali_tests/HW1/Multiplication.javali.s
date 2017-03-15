  # Emitting class Main {...}
    # Emitting void main(...) {...}
    .section .data
STR_D:
    .string "%d"
      # Emitting int r1
var_r1:
      	.int 0
      # Emitting int i0
var_i0:
      	.int 0
      # Emitting int i1
var_i1:
      	.int 0
    	.section .text
    	.globl main
main:
    pushl %ebp
    movl %esp, %ebp
      # Emitting i0 = 5
        # Emitting 5
        movl $5, %edi
      movl %edi, var_i0
      # Emitting i1 = 2
        # Emitting 2
        movl $2, %edi
      movl %edi, var_i1
      # Emitting r1 = (i1 * 3)
        # Emitting (i1 * 3)
          # Emitting i1
          movl var_i1, %edi
          # Emitting 3
          movl $3, %esi
        imul %edi, %esi
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
      # Emitting r1 = (i0 * i1)
        # Emitting (i0 * i1)
          # Emitting i0
          movl var_i0, %esi
          # Emitting i1
          movl var_i1, %edi
        imul %esi, %edi
      movl %edi, var_r1
      # Emitting write(r1)
        # Emitting r1
        movl var_r1, %edi
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
      # Emitting r1 = (((r1 * i0) * i1) * 3)
        # Emitting (((r1 * i0) * i1) * 3)
          # Emitting ((r1 * i0) * i1)
            # Emitting (r1 * i0)
              # Emitting r1
              movl var_r1, %edi
              # Emitting i0
              movl var_i0, %esi
            imul %edi, %esi
            # Emitting i1
            movl var_i1, %edi
          imul %esi, %edi
          # Emitting 3
          movl $3, %esi
        imul %edi, %esi
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
