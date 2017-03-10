  # Emitting class Main {...}
    # Emitting void main(...) {...}
    .section .data
STR_D:
    .string "%d"
      # Emitting int i0
var_i0:
      	.int 0
    	.section .text
    	.globl main
    main:
      # Emitting i0 = 0
        # Emitting 0
        movl $0, %edi
      movl %edi, var_i0
      # Emitting i0 = (5 + i0)
        # Emitting (5 + i0)
          # Emitting i0
          movl var_i0, %edi
          # Emitting 5
          movl $5, %esi
        add %esi, %edi
      movl %edi, var_i0
      # Emitting write(i0)
        # Emitting i0
        movl var_i0, %edi
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
      # Emitting i0 = (i0 + 5)
        # Emitting (i0 + 5)
          # Emitting 5
          movl $5, %edi
          # Emitting i0
          movl var_i0, %esi
        add %esi, %edi
      movl %edi, var_i0
      # Emitting write(i0)
        # Emitting i0
        movl var_i0, %edi
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
      # Emitting i0 = ((i0 + 5) + 3)
        # Emitting ((i0 + 5) + 3)
          # Emitting (i0 + 5)
            # Emitting 5
            movl $5, %edi
            # Emitting i0
            movl var_i0, %esi
          add %esi, %edi
          # Emitting 3
          movl $3, %esi
        add %edi, %esi
      movl %esi, var_i0
      # Emitting write(i0)
        # Emitting i0
        movl var_i0, %esi
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
