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
      # Emitting int r3
var_r3:
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
      # Emitting int i3
var_i3:
      	.int 0
      # Emitting int i4
var_i4:
      	.int 0
      # Emitting int i5
var_i5:
      	.int 0
      # Emitting int i6
var_i6:
      	.int 0
      # Emitting int i7
var_i7:
      	.int 0
    	.section .text
    	.globl main
main:
    pushl %ebp
    movl %esp, %ebp
      # Emitting i0 = 0
        # Emitting 0
        movl $0, %edi
      movl %edi, var_i0
      # Emitting i1 = 1
        # Emitting 1
        movl $1, %edi
      movl %edi, var_i1
      # Emitting i2 = 2
        # Emitting 2
        movl $2, %edi
      movl %edi, var_i2
      # Emitting i3 = 3
        # Emitting 3
        movl $3, %edi
      movl %edi, var_i3
      # Emitting i4 = 4
        # Emitting 4
        movl $4, %edi
      movl %edi, var_i4
      # Emitting i5 = 5
        # Emitting 5
        movl $5, %edi
      movl %edi, var_i5
      # Emitting i6 = 6
        # Emitting 6
        movl $6, %edi
      movl %edi, var_i6
      # Emitting i7 = 7
        # Emitting 7
        movl $7, %edi
      movl %edi, var_i7
      # Emitting r1 = (i0 + (i1 + (i2 + (i3 + (i4 + (i5 + (i6 + i7)))))))
        # Emitting (i0 + (i1 + (i2 + (i3 + (i4 + (i5 + (i6 + i7)))))))
          # Emitting (i1 + (i2 + (i3 + (i4 + (i5 + (i6 + i7))))))
            # Emitting (i2 + (i3 + (i4 + (i5 + (i6 + i7)))))
              # Emitting (i3 + (i4 + (i5 + (i6 + i7))))
                # Emitting (i4 + (i5 + (i6 + i7)))
                  # Emitting (i5 + (i6 + i7))
                    # Emitting (i6 + i7)
                      # Emitting i6
                      movl var_i6, %edi
                      # Emitting i7
                      movl var_i7, %esi
                    add %edi, %esi
                    # Emitting i5
                    movl var_i5, %edi
                  add %edi, %esi
                  # Emitting i4
                  movl var_i4, %edi
                add %edi, %esi
                # Emitting i3
                movl var_i3, %edi
              add %edi, %esi
              # Emitting i2
              movl var_i2, %edi
            add %edi, %esi
            # Emitting i1
            movl var_i1, %edi
          add %edi, %esi
          # Emitting i0
          movl var_i0, %edi
        add %edi, %esi
      movl %esi, var_r1
      # Emitting r2 = (((((((i0 + i1) + i2) + i3) + i4) + i5) + i6) + i7)
        # Emitting (((((((i0 + i1) + i2) + i3) + i4) + i5) + i6) + i7)
          # Emitting ((((((i0 + i1) + i2) + i3) + i4) + i5) + i6)
            # Emitting (((((i0 + i1) + i2) + i3) + i4) + i5)
              # Emitting ((((i0 + i1) + i2) + i3) + i4)
                # Emitting (((i0 + i1) + i2) + i3)
                  # Emitting ((i0 + i1) + i2)
                    # Emitting (i0 + i1)
                      # Emitting i0
                      movl var_i0, %esi
                      # Emitting i1
                      movl var_i1, %edi
                    add %esi, %edi
                    # Emitting i2
                    movl var_i2, %esi
                  add %edi, %esi
                  # Emitting i3
                  movl var_i3, %edi
                add %esi, %edi
                # Emitting i4
                movl var_i4, %esi
              add %edi, %esi
              # Emitting i5
              movl var_i5, %edi
            add %esi, %edi
            # Emitting i6
            movl var_i6, %esi
          add %edi, %esi
          # Emitting i7
          movl var_i7, %edi
        add %esi, %edi
      movl %edi, var_r2
      # Emitting r3 = (((i0 + i1) + (i2 + i3)) + ((i4 + i5) + (i6 + i7)))
        # Emitting (((i0 + i1) + (i2 + i3)) + ((i4 + i5) + (i6 + i7)))
          # Emitting ((i0 + i1) + (i2 + i3))
            # Emitting (i0 + i1)
              # Emitting i0
              movl var_i0, %edi
              # Emitting i1
              movl var_i1, %esi
            add %edi, %esi
            # Emitting (i2 + i3)
              # Emitting i2
              movl var_i2, %edi
              # Emitting i3
              movl var_i3, %edx
            add %edi, %edx
          add %esi, %edx
          # Emitting ((i4 + i5) + (i6 + i7))
            # Emitting (i4 + i5)
              # Emitting i4
              movl var_i4, %esi
              # Emitting i5
              movl var_i5, %edi
            add %esi, %edi
            # Emitting (i6 + i7)
              # Emitting i6
              movl var_i6, %esi
              # Emitting i7
              movl var_i7, %ecx
            add %esi, %ecx
          add %edi, %ecx
        add %edx, %ecx
      movl %ecx, var_r3
      # Emitting write(r1)
        # Emitting r1
        movl var_r1, %ecx
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
      # Emitting write(r2)
        # Emitting r2
        movl var_r2, %ecx
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
      # Emitting write(r3)
        # Emitting r3
        movl var_r3, %ecx
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
