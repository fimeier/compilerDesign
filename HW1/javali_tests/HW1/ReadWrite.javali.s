  # Emitting class Main {...}
    # Emitting void main(...) {...}
    .section .data
STR_D:
    .string "%d"
      # Emitting int r1
var_r1:
      	.int 0
      # Emitting int r2
var_r2:
      	.int 0
      # Emitting int i0
var_i0:
      	.int 0
      # Emitting int i1
var_i1:
      	.int 0
      # Emitting int i2
var_i2:
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
      # Emitting i1 = read()
        # Emitting read()
        subl $8, %esp
        leal 0(%esp), %eax
        pushl %eax
        pushl $STR_D
        call scanf
        movl 8(%esp), %edi
        addl $16, %esp
      movl %edi, var_i1
      # Emitting r1 = (i0 + i1)
        # Emitting (i0 + i1)
          # Emitting i0
          movl var_i0, %edi
          # Emitting i1
          movl var_i1, %esi
        add %edi, %esi
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
      # Emitting write((r1 - 3))
        # Emitting (r1 - 3)
          # Emitting r1
          movl var_r1, %esi
          # Emitting 3
          movl $3, %edi
        sub %edi, %esi
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
