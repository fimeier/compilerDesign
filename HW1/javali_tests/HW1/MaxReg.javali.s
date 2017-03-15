  # Emitting class Main {...}
    # Emitting void main(...) {...}
    .section .data
STR_D:
    .string "%d"
      # Emitting int b
var_b:
      	.int 0
      # Emitting int a
var_a:
      	.int 0
    	.section .text
    	.globl main
main:
    pushl %ebp
    movl %esp, %ebp
      # Emitting a = 0
        # Emitting 0
        movl $0, %edi
      movl %edi, var_a
      # Emitting b = 2
        # Emitting 2
        movl $2, %edi
      movl %edi, var_b
      # Emitting write(((100 * ((((b + 1) + (1 + 1)) * ((1 + 1) + (1 + 1))) + (((1 + 1) + (1 + 1)) * ((1 + 1) + (1 + 1))))) * ((((1 + 1) + (1 + 1)) * ((1 + 1) + (1 + a))) + (((1 + 1) + (1 + 1)) * ((1 + 1) + (1 + 1))))))
        # Emitting ((100 * ((((b + 1) + (1 + 1)) * ((1 + 1) + (1 + 1))) + (((1 + 1) + (1 + 1)) * ((1 + 1) + (1 + 1))))) * ((((1 + 1) + (1 + 1)) * ((1 + 1) + (1 + a))) + (((1 + 1) + (1 + 1)) * ((1 + 1) + (1 + 1)))))
          # Emitting (100 * ((((b + 1) + (1 + 1)) * ((1 + 1) + (1 + 1))) + (((1 + 1) + (1 + 1)) * ((1 + 1) + (1 + 1)))))
            # Emitting ((((b + 1) + (1 + 1)) * ((1 + 1) + (1 + 1))) + (((1 + 1) + (1 + 1)) * ((1 + 1) + (1 + 1))))
              # Emitting (((b + 1) + (1 + 1)) * ((1 + 1) + (1 + 1)))
                # Emitting ((b + 1) + (1 + 1))
                  # Emitting (b + 1)
                    # Emitting b
                    movl var_b, %edi
                    # Emitting 1
                    movl $1, %esi
                  add %edi, %esi
                  # Emitting (1 + 1)
                    # Emitting 1
                    movl $1, %edi
                    # Emitting 1
                    movl $1, %edx
                  add %edi, %edx
                add %esi, %edx
                # Emitting ((1 + 1) + (1 + 1))
                  # Emitting (1 + 1)
                    # Emitting 1
                    movl $1, %esi
                    # Emitting 1
                    movl $1, %edi
                  add %esi, %edi
                  # Emitting (1 + 1)
                    # Emitting 1
                    movl $1, %esi
                    # Emitting 1
                    movl $1, %ecx
                  add %esi, %ecx
                add %edi, %ecx
              imul %edx, %ecx
              # Emitting (((1 + 1) + (1 + 1)) * ((1 + 1) + (1 + 1)))
                # Emitting ((1 + 1) + (1 + 1))
                  # Emitting (1 + 1)
                    # Emitting 1
                    movl $1, %edx
                    # Emitting 1
                    movl $1, %edi
                  add %edx, %edi
                  # Emitting (1 + 1)
                    # Emitting 1
                    movl $1, %edx
                    # Emitting 1
                    movl $1, %esi
                  add %edx, %esi
                add %edi, %esi
                # Emitting ((1 + 1) + (1 + 1))
                  # Emitting (1 + 1)
                    # Emitting 1
                    movl $1, %edi
                    # Emitting 1
                    movl $1, %edx
                  add %edi, %edx
                  # Emitting (1 + 1)
                    # Emitting 1
                    movl $1, %edi
                    # Emitting 1
                    movl $1, %ebx
                  add %edi, %ebx
                add %edx, %ebx
              imul %esi, %ebx
            add %ecx, %ebx
            # Emitting 100
            movl $100, %ecx
          imul %ecx, %ebx
          # Emitting ((((1 + 1) + (1 + 1)) * ((1 + 1) + (1 + a))) + (((1 + 1) + (1 + 1)) * ((1 + 1) + (1 + 1))))
            # Emitting (((1 + 1) + (1 + 1)) * ((1 + 1) + (1 + a)))
              # Emitting ((1 + 1) + (1 + 1))
                # Emitting (1 + 1)
                  # Emitting 1
                  movl $1, %ecx
                  # Emitting 1
                  movl $1, %esi
                add %ecx, %esi
                # Emitting (1 + 1)
                  # Emitting 1
                  movl $1, %ecx
                  # Emitting 1
                  movl $1, %edx
                add %ecx, %edx
              add %esi, %edx
              # Emitting ((1 + 1) + (1 + a))
                # Emitting (1 + 1)
                  # Emitting 1
                  movl $1, %esi
                  # Emitting 1
                  movl $1, %ecx
                add %esi, %ecx
                # Emitting (1 + a)
                  # Emitting 1
                  movl $1, %esi
                  # Emitting a
                  movl var_a, %edi
                add %esi, %edi
              add %ecx, %edi
            imul %edx, %edi
            # Emitting (((1 + 1) + (1 + 1)) * ((1 + 1) + (1 + 1)))
              # Emitting ((1 + 1) + (1 + 1))
                # Emitting (1 + 1)
                  # Emitting 1
                  movl $1, %edx
                  # Emitting 1
                  movl $1, %ecx
                add %edx, %ecx
                # Emitting (1 + 1)
                  # Emitting 1
                  movl $1, %edx
                  # Emitting 1
                  movl $1, %esi
                add %edx, %esi
              add %ecx, %esi
              # Emitting ((1 + 1) + (1 + 1))
                # Emitting (1 + 1)
                  # Emitting 1
                  movl $1, %ecx
                  # Emitting 1
                  movl $1, %edx
                add %ecx, %edx
                # Emitting (1 + 1)
                  # Emitting 1
                  movl $1, %ecx
                  # Emitting 1
                  movl $1, %eax
                add %ecx, %eax
              add %edx, %eax
            imul %esi, %eax
          add %edi, %eax
        imul %ebx, %eax
      sub $16, %esp
      movl %eax, 4(%esp)
      movl $STR_D, 0(%esp)
      call printf
      add $16, %esp
    movl $0, %eax
    leave
    ret
