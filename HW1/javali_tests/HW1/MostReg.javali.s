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
      # Emitting a = (((((1000 * a) + b) + (c + d)) * ((a + b) + (c + d))) + (((a + b) + (c + d)) * ((a + b) + (c + d))))
        # Emitting (((((1000 * a) + b) + (c + d)) * ((a + b) + (c + d))) + (((a + b) + (c + d)) * ((a + b) + (c + d))))
          # Emitting ((((1000 * a) + b) + (c + d)) * ((a + b) + (c + d)))
            # Emitting (((1000 * a) + b) + (c + d))
              # Emitting ((1000 * a) + b)
                # Emitting (1000 * a)
                  # Emitting 1000
                  movl $1000, %edi
                  # Emitting a
                  movl var_a, %esi
                imul %edi, %esi
                # Emitting b
                movl var_b, %edi
              add %esi, %edi
              # Emitting (c + d)
                # Emitting c
                movl var_c, %esi
                # Emitting d
                movl var_d, %edx
              add %esi, %edx
            add %edi, %edx
            # Emitting ((a + b) + (c + d))
              # Emitting (a + b)
                # Emitting a
                movl var_a, %edi
                # Emitting b
                movl var_b, %esi
              add %edi, %esi
              # Emitting (c + d)
                # Emitting c
                movl var_c, %edi
                # Emitting d
                movl var_d, %ecx
              add %edi, %ecx
            add %esi, %ecx
          imul %edx, %ecx
          # Emitting (((a + b) + (c + d)) * ((a + b) + (c + d)))
            # Emitting ((a + b) + (c + d))
              # Emitting (a + b)
                # Emitting a
                movl var_a, %edx
                # Emitting b
                movl var_b, %esi
              add %edx, %esi
              # Emitting (c + d)
                # Emitting c
                movl var_c, %edx
                # Emitting d
                movl var_d, %edi
              add %edx, %edi
            add %esi, %edi
            # Emitting ((a + b) + (c + d))
              # Emitting (a + b)
                # Emitting a
                movl var_a, %esi
                # Emitting b
                movl var_b, %edx
              add %esi, %edx
              # Emitting (c + d)
                # Emitting c
                movl var_c, %esi
                # Emitting d
                movl var_d, %ebx
              add %esi, %ebx
            add %edx, %ebx
          imul %edi, %ebx
        add %ecx, %ebx
      movl %ebx, var_a
      # Emitting b = ((((a + b) + (c + d)) * ((a + b) + (c + d))) + (((a + b) + (c + d)) * ((a + b) + (c + d))))
        # Emitting ((((a + b) + (c + d)) * ((a + b) + (c + d))) + (((a + b) + (c + d)) * ((a + b) + (c + d))))
          # Emitting (((a + b) + (c + d)) * ((a + b) + (c + d)))
            # Emitting ((a + b) + (c + d))
              # Emitting (a + b)
                # Emitting a
                movl var_a, %ebx
                # Emitting b
                movl var_b, %ecx
              add %ebx, %ecx
              # Emitting (c + d)
                # Emitting c
                movl var_c, %ebx
                # Emitting d
                movl var_d, %edi
              add %ebx, %edi
            add %ecx, %edi
            # Emitting ((a + b) + (c + d))
              # Emitting (a + b)
                # Emitting a
                movl var_a, %ecx
                # Emitting b
                movl var_b, %ebx
              add %ecx, %ebx
              # Emitting (c + d)
                # Emitting c
                movl var_c, %ecx
                # Emitting d
                movl var_d, %edx
              add %ecx, %edx
            add %ebx, %edx
          imul %edi, %edx
          # Emitting (((a + b) + (c + d)) * ((a + b) + (c + d)))
            # Emitting ((a + b) + (c + d))
              # Emitting (a + b)
                # Emitting a
                movl var_a, %edi
                # Emitting b
                movl var_b, %ebx
              add %edi, %ebx
              # Emitting (c + d)
                # Emitting c
                movl var_c, %edi
                # Emitting d
                movl var_d, %ecx
              add %edi, %ecx
            add %ebx, %ecx
            # Emitting ((a + b) + (c + d))
              # Emitting (a + b)
                # Emitting a
                movl var_a, %ebx
                # Emitting b
                movl var_b, %edi
              add %ebx, %edi
              # Emitting (c + d)
                # Emitting c
                movl var_c, %ebx
                # Emitting d
                movl var_d, %esi
              add %ebx, %esi
            add %edi, %esi
          imul %ecx, %esi
        add %edx, %esi
      movl %esi, var_b
      # Emitting c = ((((a + b) + (c + d)) * ((a + b) + (c + d))) + (((a + b) + (c + d)) * ((a + b) + (c + d))))
        # Emitting ((((a + b) + (c + d)) * ((a + b) + (c + d))) + (((a + b) + (c + d)) * ((a + b) + (c + d))))
          # Emitting (((a + b) + (c + d)) * ((a + b) + (c + d)))
            # Emitting ((a + b) + (c + d))
              # Emitting (a + b)
                # Emitting a
                movl var_a, %esi
                # Emitting b
                movl var_b, %edx
              add %esi, %edx
              # Emitting (c + d)
                # Emitting c
                movl var_c, %esi
                # Emitting d
                movl var_d, %ecx
              add %esi, %ecx
            add %edx, %ecx
            # Emitting ((a + b) + (c + d))
              # Emitting (a + b)
                # Emitting a
                movl var_a, %edx
                # Emitting b
                movl var_b, %esi
              add %edx, %esi
              # Emitting (c + d)
                # Emitting c
                movl var_c, %edx
                # Emitting d
                movl var_d, %edi
              add %edx, %edi
            add %esi, %edi
          imul %ecx, %edi
          # Emitting (((a + b) + (c + d)) * ((a + b) + (c + d)))
            # Emitting ((a + b) + (c + d))
              # Emitting (a + b)
                # Emitting a
                movl var_a, %ecx
                # Emitting b
                movl var_b, %esi
              add %ecx, %esi
              # Emitting (c + d)
                # Emitting c
                movl var_c, %ecx
                # Emitting d
                movl var_d, %edx
              add %ecx, %edx
            add %esi, %edx
            # Emitting ((a + b) + (c + d))
              # Emitting (a + b)
                # Emitting a
                movl var_a, %esi
                # Emitting b
                movl var_b, %ecx
              add %esi, %ecx
              # Emitting (c + d)
                # Emitting c
                movl var_c, %esi
                # Emitting d
                movl var_d, %ebx
              add %esi, %ebx
            add %ecx, %ebx
          imul %edx, %ebx
        add %edi, %ebx
      movl %ebx, var_c
      # Emitting d = ((((a + b) + (c + d)) * ((a + b) + (c + d))) + (((a + b) + (c + d)) * ((a + b) + (c + d))))
        # Emitting ((((a + b) + (c + d)) * ((a + b) + (c + d))) + (((a + b) + (c + d)) * ((a + b) + (c + d))))
          # Emitting (((a + b) + (c + d)) * ((a + b) + (c + d)))
            # Emitting ((a + b) + (c + d))
              # Emitting (a + b)
                # Emitting a
                movl var_a, %ebx
                # Emitting b
                movl var_b, %edi
              add %ebx, %edi
              # Emitting (c + d)
                # Emitting c
                movl var_c, %ebx
                # Emitting d
                movl var_d, %edx
              add %ebx, %edx
            add %edi, %edx
            # Emitting ((a + b) + (c + d))
              # Emitting (a + b)
                # Emitting a
                movl var_a, %edi
                # Emitting b
                movl var_b, %ebx
              add %edi, %ebx
              # Emitting (c + d)
                # Emitting c
                movl var_c, %edi
                # Emitting d
                movl var_d, %ecx
              add %edi, %ecx
            add %ebx, %ecx
          imul %edx, %ecx
          # Emitting (((a + b) + (c + d)) * ((a + b) + (c + d)))
            # Emitting ((a + b) + (c + d))
              # Emitting (a + b)
                # Emitting a
                movl var_a, %edx
                # Emitting b
                movl var_b, %ebx
              add %edx, %ebx
              # Emitting (c + d)
                # Emitting c
                movl var_c, %edx
                # Emitting d
                movl var_d, %edi
              add %edx, %edi
            add %ebx, %edi
            # Emitting ((a + b) + (c + d))
              # Emitting (a + b)
                # Emitting a
                movl var_a, %ebx
                # Emitting b
                movl var_b, %edx
              add %ebx, %edx
              # Emitting (c + d)
                # Emitting c
                movl var_c, %ebx
                # Emitting d
                movl var_d, %esi
              add %ebx, %esi
            add %edx, %esi
          imul %edi, %esi
        add %ecx, %esi
      movl %esi, var_d
      # Emitting write(((a * b) + (c * d)))
        # Emitting ((a * b) + (c * d))
          # Emitting (a * b)
            # Emitting a
            movl var_a, %esi
            # Emitting b
            movl var_b, %ecx
          imul %esi, %ecx
          # Emitting (c * d)
            # Emitting c
            movl var_c, %esi
            # Emitting d
            movl var_d, %edi
          imul %esi, %edi
        add %ecx, %edi
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
      # Emitting write((c * 0))
        # Emitting (c * 0)
          # Emitting c
          movl var_c, %edi
          # Emitting 0
          movl $0, %ecx
        imul %edi, %ecx
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
