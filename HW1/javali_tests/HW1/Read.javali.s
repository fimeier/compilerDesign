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
      # Emitting i0 = 6
        # Emitting 6
        movl $6, %edi
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
      # Emitting write(i1)
        # Emitting i1
        movl var_i1, %edi
      sub $16, %esp
      movl %edi, 4(%esp)
      movl $STR_D, 0(%esp)
      call printf
      add $16, %esp
      # Emitting i2 = read()
        # Emitting read()
        subl $8, %esp
        leal 0(%esp), %eax
        pushl %eax
        pushl $STR_D
        call scanf
        movl 8(%esp), %edi
        addl $16, %esp
      movl %edi, var_i2
      # Emitting writeln()
      sub $12, %esp
      pushl $10
      call putchar
      add $16, %esp
      # Emitting write(i2)
        # Emitting i2
        movl var_i2, %edi
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
      # Emitting r1 = read()
        # Emitting read()
        subl $8, %esp
        leal 0(%esp), %eax
        pushl %eax
        pushl $STR_D
        call scanf
        movl 8(%esp), %edi
        addl $16, %esp
      movl %edi, var_r1
      # Emitting write(r1)
        # Emitting r1
        movl var_r1, %edi
      sub $16, %esp
      movl %edi, 4(%esp)
      movl $STR_D, 0(%esp)
      call printf
      add $16, %esp
    movl $0, %eax
    leave
    ret
