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
      # Emitting int e
var_e:
      	.int 0
    	.section .text
    	.globl main
main:
    pushl %ebp
    movl %esp, %ebp
      # Emitting a = b
        # Emitting b
        movl var_b, %edi
      movl %edi, var_a
      # Emitting c = (a / 1)
        # Emitting (a / 1)
          # Emitting a
          movl var_a, %edi
          # Emitting 1
          movl $1, %esi
        subl $12, %esp
        movl %eax, 8(%esp)
        movl %edx, 4(%esp)
        movl %edi, %eax
        cltd
        idiv %esi
        movl %eax, %esi
        movl 8(%esp), %eax
        movl 4(%esp), %edx
        movl %esi, %edi
        addl $12, %esp
      movl %esi, var_c
      # Emitting a = (((b / (c + 1)) / (d + 2)) / -(-(3)))
        # Emitting (((b / (c + 1)) / (d + 2)) / -(-(3)))
          # Emitting ((b / (c + 1)) / (d + 2))
            # Emitting (b / (c + 1))
              # Emitting (c + 1)
                # Emitting c
                movl var_c, %esi
                # Emitting 1
                movl $1, %edi
              add %esi, %edi
              # Emitting b
              movl var_b, %esi
            subl $12, %esp
            movl %eax, 8(%esp)
            movl %edx, 4(%esp)
            movl %esi, %eax
            cltd
            idiv %edi
            movl %eax, %edi
            movl 8(%esp), %eax
            movl 4(%esp), %edx
            movl %edi, %esi
            addl $12, %esp
            # Emitting (d + 2)
              # Emitting d
              movl var_d, %esi
              # Emitting 2
              movl $2, %edx
            add %esi, %edx
          subl $12, %esp
          movl %ebx, 0(%esp)
          movl %edx, %ebx
          movl %eax, 8(%esp)
          movl %edx, 4(%esp)
          movl %edi, %eax
          cltd
          idiv %ebx
          movl %eax, %ebx
          movl 8(%esp), %eax
          movl 4(%esp), %edx
          movl %ebx, %edx
          movl 0(%esp), %ebx
          movl %edx, %edi
          addl $12, %esp
          # Emitting -(-(3))
            # Emitting -(3)
              # Emitting 3
              movl $3, %edi
            neg %edi
          neg %edi
        subl $12, %esp
        movl %eax, 8(%esp)
        movl %edx, 4(%esp)
        movl %edx, %eax
        cltd
        idiv %edi
        movl %eax, %edi
        movl 8(%esp), %eax
        movl 4(%esp), %edx
        movl %edi, %edx
        addl $12, %esp
      movl %edi, var_a
      # Emitting e = -(-(-(-(-(-(+(+(+(0)))))))))
        # Emitting -(-(-(-(-(-(+(+(+(0)))))))))
          # Emitting -(-(-(-(-(+(+(+(0))))))))
            # Emitting -(-(-(-(+(+(+(0)))))))
              # Emitting -(-(-(+(+(+(0))))))
                # Emitting -(-(+(+(+(0)))))
                  # Emitting -(+(+(+(0))))
                    # Emitting +(+(+(0)))
                      # Emitting +(+(0))
                        # Emitting +(0)
                          # Emitting 0
                          movl $0, %edi
                  neg %edi
                neg %edi
              neg %edi
            neg %edi
          neg %edi
        neg %edi
      movl %edi, var_e
      # Emitting write(-(-(0)))
        # Emitting -(-(0))
          # Emitting -(0)
            # Emitting 0
            movl $0, %edi
          neg %edi
        neg %edi
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
      # Emitting write(-(0))
        # Emitting -(0)
          # Emitting 0
          movl $0, %edi
        neg %edi
      sub $16, %esp
      movl %edi, 4(%esp)
      movl $STR_D, 0(%esp)
      call printf
      add $16, %esp
    movl $0, %eax
    leave
    ret
