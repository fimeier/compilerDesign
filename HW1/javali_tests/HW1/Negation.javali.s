  # Emitting class Main {...}
    # Emitting void main(...) {...}
    .section .data
STR_D:
    .string "%d"
      # Emitting int A
var_A:
      	.int 0
      # Emitting int B
var_B:
      	.int 0
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
      # Emitting A = 1
        # Emitting 1
        movl $1, %edi
      movl %edi, var_A
      # Emitting B = 1
        # Emitting 1
        movl $1, %edi
      movl %edi, var_B
      # Emitting a = (A * -(B))
        # Emitting (A * -(B))
          # Emitting -(B)
            # Emitting B
            movl var_B, %edi
          neg %edi
          # Emitting A
          movl var_A, %esi
        imul %esi, %edi
      movl %edi, var_a
      # Emitting b = (-(A) * B)
        # Emitting (-(A) * B)
          # Emitting B
          movl var_B, %edi
          # Emitting -(A)
            # Emitting A
            movl var_A, %esi
          neg %esi
        imul %esi, %edi
      movl %edi, var_b
      # Emitting c = -((A + B))
        # Emitting -((A + B))
          # Emitting (A + B)
            # Emitting B
            movl var_B, %edi
            # Emitting A
            movl var_A, %esi
          add %esi, %edi
        neg %edi
      movl %edi, var_c
      # Emitting d = -((A * B))
        # Emitting -((A * B))
          # Emitting (A * B)
            # Emitting B
            movl var_B, %edi
            # Emitting A
            movl var_A, %esi
          imul %esi, %edi
        neg %edi
      movl %edi, var_d
      # Emitting write(a)
        # Emitting a
        movl var_a, %edi
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
      # Emitting write(c)
        # Emitting c
        movl var_c, %edi
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
