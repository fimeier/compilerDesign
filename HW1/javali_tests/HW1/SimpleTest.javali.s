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
    	.section .text
    	.globl main
    main:
      # Emitting a = 10
        # Emitting 10
        movl $10, %edi
      movl %edi, var_a
      # Emitting b = 2
        # Emitting 2
        movl $2, %edi
      movl %edi, var_b
      # Emitting c = ((a + b) + 3)
        # Emitting ((a + b) + 3)
          # Emitting (a + b)
            # Emitting b
            movl var_b, %edi
            # Emitting a
            movl var_a, %esi
          add %esi, %edi
          # Emitting 3
          movl $3, %esi
        add %edi, %esi
      movl %esi, var_c
      # Emitting write(c)
        # Emitting c
        movl var_c, %esi
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
