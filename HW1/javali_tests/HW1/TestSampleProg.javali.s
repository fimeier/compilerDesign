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
      # Emitting a = 100
        # Emitting 100
        movl $100, %edi
      movl %edi, var_a
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
      # Emitting b = read()
        # Emitting read()
        subl $8, %esp
        leal 0(%esp), %eax
        pushl %eax
        pushl $STR_D
        call scanf
        movl 8(%esp), %edi
        addl $16, %esp
      movl %edi, var_b
      # Emitting c = 0
        # Emitting 0
        movl $0, %edi
      movl %edi, var_c
      # Emitting c = (c + ((a / b) * -(-(64))))
        # Emitting (c + ((a / b) * -(-(64))))
          # Emitting ((a / b) * -(-(64)))
            # Emitting (a / b)
              # Emitting b
              movl var_b, %edi
              # Emitting a
              movl var_a, %esi
            movl %esi, %eax
            cltd
            idivl %edi
            movl %eax, %edi
            # Emitting -(-(64))
              # Emitting -(64)
                # Emitting 64
                movl $64, %esi
              neg %esi
            neg %esi
          imul %edi, %esi
          # Emitting c
          movl var_c, %edi
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
      # Emitting c = 0
        # Emitting 0
        movl $0, %esi
      movl %esi, var_c
      # Emitting write((c + ((a / b) * -(-(64)))))
        # Emitting (c + ((a / b) * -(-(64))))
          # Emitting ((a / b) * -(-(64)))
            # Emitting (a / b)
              # Emitting b
              movl var_b, %esi
              # Emitting a
              movl var_a, %edi
            movl %edi, %eax
            cltd
            idivl %esi
            movl %eax, %esi
            # Emitting -(-(64))
              # Emitting -(64)
                # Emitting 64
                movl $64, %edi
              neg %edi
            neg %edi
          imul %esi, %edi
          # Emitting c
          movl var_c, %esi
        add %esi, %edi
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
      # Emitting d = -(1000000000)
        # Emitting -(1000000000)
          # Emitting 1000000000
          movl $1000000000, %edi
        neg %edi
      movl %edi, var_d
      # Emitting write((d / -(3)))
        # Emitting (d / -(3))
          # Emitting -(3)
            # Emitting 3
            movl $3, %edi
          neg %edi
          # Emitting d
          movl var_d, %esi
        movl %esi, %eax
        cltd
        idivl %edi
        movl %eax, %edi
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
