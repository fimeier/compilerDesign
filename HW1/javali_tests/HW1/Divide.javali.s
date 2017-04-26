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
    pushl %ebp
    movl %esp, %ebp
      # Emitting a = 8
        # Emitting 8
        movl $8, %edi
      movl %edi, var_a
      # Emitting b = 2
        # Emitting 2
        movl $2, %edi
      movl %edi, var_b
      # Emitting c = 9
        # Emitting 9
        movl $9, %edi
      movl %edi, var_c
      # Emitting write(((a / b) / c))
        # Emitting ((a / b) / c)
          # Emitting (a / b)
            # Emitting a
            movl var_a, %edi
            # Emitting b
            movl var_b, %esi
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
          # Emitting c
          movl var_c, %edi
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
      # Emitting write((c / b))
        # Emitting (c / b)
          # Emitting c
          movl var_c, %edi
          # Emitting b
          movl var_b, %esi
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
      # Emitting b = (a * c)
        # Emitting (a * c)
          # Emitting a
          movl var_a, %esi
          # Emitting c
          movl var_c, %edi
        imul %esi, %edi
      movl %edi, var_b
      # Emitting write(((a + b) + c))
        # Emitting ((a + b) + c)
          # Emitting (a + b)
            # Emitting a
            movl var_a, %edi
            # Emitting b
            movl var_b, %esi
          add %edi, %esi
          # Emitting c
          movl var_c, %edi
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
      # Emitting write((((6 * 7) / (4 * 3)) - ((3 + 2) + (6 + 3))))
        # Emitting (((6 * 7) / (4 * 3)) - ((3 + 2) + (6 + 3)))
          # Emitting ((6 * 7) / (4 * 3))
            # Emitting (6 * 7)
              # Emitting 6
              movl $6, %edi
              # Emitting 7
              movl $7, %esi
            imul %edi, %esi
            # Emitting (4 * 3)
              # Emitting 4
              movl $4, %edi
              # Emitting 3
              movl $3, %edx
            imul %edi, %edx
          subl $12, %esp
          movl %ebx, 0(%esp)
          movl %edx, %ebx
          movl %eax, 8(%esp)
          movl %edx, 4(%esp)
          movl %esi, %eax
          cltd
          idiv %ebx
          movl %eax, %ebx
          movl 8(%esp), %eax
          movl 4(%esp), %edx
          movl %ebx, %edx
          movl 0(%esp), %ebx
          movl %edx, %esi
          addl $12, %esp
          # Emitting ((3 + 2) + (6 + 3))
            # Emitting (3 + 2)
              # Emitting 3
              movl $3, %esi
              # Emitting 2
              movl $2, %edi
            add %esi, %edi
            # Emitting (6 + 3)
              # Emitting 6
              movl $6, %esi
              # Emitting 3
              movl $3, %ecx
            add %esi, %ecx
          add %edi, %ecx
        sub %ecx, %edx
      sub $16, %esp
      movl %edx, 4(%esp)
      movl $STR_D, 0(%esp)
      call printf
      add $16, %esp
      # Emitting writeln()
      sub $12, %esp
      pushl $10
      call putchar
      add $16, %esp
      # Emitting write((((((6 * 54) / (5 * 3)) / ((18 / 18) / (34 / 34))) / (((2 * 12) / (3 * 2)) / ((15 / 2) / (10 / 2)))) / ((((6 * 54) / (5 * 3)) / ((18 / 18) / (34 / 34))) / (((2 * 12) / (3 * 2)) / ((15 / 2) / (10 / 2))))))
        # Emitting (((((6 * 54) / (5 * 3)) / ((18 / 18) / (34 / 34))) / (((2 * 12) / (3 * 2)) / ((15 / 2) / (10 / 2)))) / ((((6 * 54) / (5 * 3)) / ((18 / 18) / (34 / 34))) / (((2 * 12) / (3 * 2)) / ((15 / 2) / (10 / 2)))))
          # Emitting ((((6 * 54) / (5 * 3)) / ((18 / 18) / (34 / 34))) / (((2 * 12) / (3 * 2)) / ((15 / 2) / (10 / 2))))
            # Emitting (((6 * 54) / (5 * 3)) / ((18 / 18) / (34 / 34)))
              # Emitting ((6 * 54) / (5 * 3))
                # Emitting (6 * 54)
                  # Emitting 6
                  movl $6, %edx
                  # Emitting 54
                  movl $54, %ecx
                imul %edx, %ecx
                # Emitting (5 * 3)
                  # Emitting 5
                  movl $5, %edx
                  # Emitting 3
                  movl $3, %edi
                imul %edx, %edi
              subl $12, %esp
              movl %eax, 8(%esp)
              movl %edx, 4(%esp)
              movl %ecx, %eax
              cltd
              idiv %edi
              movl %eax, %edi
              movl 8(%esp), %eax
              movl 4(%esp), %edx
              movl %edi, %ecx
              addl $12, %esp
              # Emitting ((18 / 18) / (34 / 34))
                # Emitting (18 / 18)
                  # Emitting 18
                  movl $18, %ecx
                  # Emitting 18
                  movl $18, %edx
                subl $12, %esp
                movl %ebx, 0(%esp)
                movl %edx, %ebx
                movl %eax, 8(%esp)
                movl %edx, 4(%esp)
                movl %ecx, %eax
                cltd
                idiv %ebx
                movl %eax, %ebx
                movl 8(%esp), %eax
                movl 4(%esp), %edx
                movl %ebx, %edx
                movl 0(%esp), %ebx
                movl %edx, %ecx
                addl $12, %esp
                # Emitting (34 / 34)
                  # Emitting 34
                  movl $34, %ecx
                  # Emitting 34
                  movl $34, %esi
                subl $12, %esp
                movl %eax, 8(%esp)
                movl %edx, 4(%esp)
                movl %ecx, %eax
                cltd
                idiv %esi
                movl %eax, %esi
                movl 8(%esp), %eax
                movl 4(%esp), %edx
                movl %esi, %ecx
                addl $12, %esp
              subl $12, %esp
              movl %eax, 8(%esp)
              movl %edx, 4(%esp)
              movl %edx, %eax
              cltd
              idiv %esi
              movl %eax, %esi
              movl 8(%esp), %eax
              movl 4(%esp), %edx
              movl %esi, %edx
              addl $12, %esp
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
            # Emitting (((2 * 12) / (3 * 2)) / ((15 / 2) / (10 / 2)))
              # Emitting ((2 * 12) / (3 * 2))
                # Emitting (2 * 12)
                  # Emitting 2
                  movl $2, %edi
                  # Emitting 12
                  movl $12, %edx
                imul %edi, %edx
                # Emitting (3 * 2)
                  # Emitting 3
                  movl $3, %edi
                  # Emitting 2
                  movl $2, %ecx
                imul %edi, %ecx
              subl $12, %esp
              movl %eax, 8(%esp)
              movl %edx, 4(%esp)
              movl %edx, %eax
              cltd
              idiv %ecx
              movl %eax, %ecx
              movl 8(%esp), %eax
              movl 4(%esp), %edx
              movl %ecx, %edx
              addl $12, %esp
              # Emitting ((15 / 2) / (10 / 2))
                # Emitting (15 / 2)
                  # Emitting 15
                  movl $15, %edx
                  # Emitting 2
                  movl $2, %edi
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
                # Emitting (10 / 2)
                  # Emitting 10
                  movl $10, %edx
                  # Emitting 2
                  movl $2, %ebx
                subl $12, %esp
                movl %eax, 8(%esp)
                movl %edx, 4(%esp)
                movl %edx, %eax
                cltd
                idiv %ebx
                movl %eax, %ebx
                movl 8(%esp), %eax
                movl 4(%esp), %edx
                movl %ebx, %edx
                addl $12, %esp
              subl $12, %esp
              movl %eax, 8(%esp)
              movl %edx, 4(%esp)
              movl %edi, %eax
              cltd
              idiv %ebx
              movl %eax, %ebx
              movl 8(%esp), %eax
              movl 4(%esp), %edx
              movl %ebx, %edi
              addl $12, %esp
            subl $12, %esp
            movl %eax, 8(%esp)
            movl %edx, 4(%esp)
            movl %ecx, %eax
            cltd
            idiv %ebx
            movl %eax, %ebx
            movl 8(%esp), %eax
            movl 4(%esp), %edx
            movl %ebx, %ecx
            addl $12, %esp
          subl $12, %esp
          movl %eax, 8(%esp)
          movl %edx, 4(%esp)
          movl %esi, %eax
          cltd
          idiv %ebx
          movl %eax, %ebx
          movl 8(%esp), %eax
          movl 4(%esp), %edx
          movl %ebx, %esi
          addl $12, %esp
          # Emitting ((((6 * 54) / (5 * 3)) / ((18 / 18) / (34 / 34))) / (((2 * 12) / (3 * 2)) / ((15 / 2) / (10 / 2))))
            # Emitting (((6 * 54) / (5 * 3)) / ((18 / 18) / (34 / 34)))
              # Emitting ((6 * 54) / (5 * 3))
                # Emitting (6 * 54)
                  # Emitting 6
                  movl $6, %esi
                  # Emitting 54
                  movl $54, %ecx
                imul %esi, %ecx
                # Emitting (5 * 3)
                  # Emitting 5
                  movl $5, %esi
                  # Emitting 3
                  movl $3, %edi
                imul %esi, %edi
              subl $12, %esp
              movl %eax, 8(%esp)
              movl %edx, 4(%esp)
              movl %ecx, %eax
              cltd
              idiv %edi
              movl %eax, %edi
              movl 8(%esp), %eax
              movl 4(%esp), %edx
              movl %edi, %ecx
              addl $12, %esp
              # Emitting ((18 / 18) / (34 / 34))
                # Emitting (18 / 18)
                  # Emitting 18
                  movl $18, %ecx
                  # Emitting 18
                  movl $18, %esi
                subl $12, %esp
                movl %eax, 8(%esp)
                movl %edx, 4(%esp)
                movl %ecx, %eax
                cltd
                idiv %esi
                movl %eax, %esi
                movl 8(%esp), %eax
                movl 4(%esp), %edx
                movl %esi, %ecx
                addl $12, %esp
                # Emitting (34 / 34)
                  # Emitting 34
                  movl $34, %ecx
                  # Emitting 34
                  movl $34, %edx
                subl $12, %esp
                movl %ebx, 0(%esp)
                movl %edx, %ebx
                movl %eax, 8(%esp)
                movl %edx, 4(%esp)
                movl %ecx, %eax
                cltd
                idiv %ebx
                movl %eax, %ebx
                movl 8(%esp), %eax
                movl 4(%esp), %edx
                movl %ebx, %edx
                movl 0(%esp), %ebx
                movl %edx, %ecx
                addl $12, %esp
              subl $12, %esp
              movl %ebx, 0(%esp)
              movl %edx, %ebx
              movl %eax, 8(%esp)
              movl %edx, 4(%esp)
              movl %esi, %eax
              cltd
              idiv %ebx
              movl %eax, %ebx
              movl 8(%esp), %eax
              movl 4(%esp), %edx
              movl %ebx, %edx
              movl 0(%esp), %ebx
              movl %edx, %esi
              addl $12, %esp
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
            # Emitting (((2 * 12) / (3 * 2)) / ((15 / 2) / (10 / 2)))
              # Emitting ((2 * 12) / (3 * 2))
                # Emitting (2 * 12)
                  # Emitting 2
                  movl $2, %edi
                  # Emitting 12
                  movl $12, %esi
                imul %edi, %esi
                # Emitting (3 * 2)
                  # Emitting 3
                  movl $3, %edi
                  # Emitting 2
                  movl $2, %ecx
                imul %edi, %ecx
              subl $12, %esp
              movl %eax, 8(%esp)
              movl %edx, 4(%esp)
              movl %esi, %eax
              cltd
              idiv %ecx
              movl %eax, %ecx
              movl 8(%esp), %eax
              movl 4(%esp), %edx
              movl %ecx, %esi
              addl $12, %esp
              # Emitting ((15 / 2) / (10 / 2))
                # Emitting (15 / 2)
                  # Emitting 15
                  movl $15, %esi
                  # Emitting 2
                  movl $2, %edi
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
                # Emitting (10 / 2)
                  # Emitting 10
                  movl $10, %esi
                  # Emitting 2
                  movl $2, %eax
                subl $12, %esp
                movl %ebx, 0(%esp)
                movl %eax, %ebx
                movl %eax, 8(%esp)
                movl %edx, 4(%esp)
                movl %esi, %eax
                cltd
                idiv %ebx
                movl %eax, %ebx
                movl 8(%esp), %eax
                movl 4(%esp), %edx
                movl %ebx, %eax
                movl 0(%esp), %ebx
                movl %eax, %esi
                addl $12, %esp
              subl $12, %esp
              movl %ebx, 0(%esp)
              movl %eax, %ebx
              movl %eax, 8(%esp)
              movl %edx, 4(%esp)
              movl %edi, %eax
              cltd
              idiv %ebx
              movl %eax, %ebx
              movl 8(%esp), %eax
              movl 4(%esp), %edx
              movl %ebx, %eax
              movl 0(%esp), %ebx
              movl %eax, %edi
              addl $12, %esp
            subl $12, %esp
            movl %ebx, 0(%esp)
            movl %eax, %ebx
            movl %eax, 8(%esp)
            movl %edx, 4(%esp)
            movl %ecx, %eax
            cltd
            idiv %ebx
            movl %eax, %ebx
            movl 8(%esp), %eax
            movl 4(%esp), %edx
            movl %ebx, %eax
            movl 0(%esp), %ebx
            movl %eax, %ecx
            addl $12, %esp
          subl $12, %esp
          movl %ebx, 0(%esp)
          movl %eax, %ebx
          movl %eax, 8(%esp)
          movl %edx, 4(%esp)
          movl %edx, %eax
          cltd
          idiv %ebx
          movl %eax, %ebx
          movl 8(%esp), %eax
          movl 4(%esp), %edx
          movl %ebx, %eax
          movl 0(%esp), %ebx
          movl %eax, %edx
          addl $12, %esp
        subl $12, %esp
        movl %ebx, 0(%esp)
        movl %eax, %ebx
        movl %eax, 8(%esp)
        movl %edx, 4(%esp)
        movl 0(%esp), %eax
        cltd
        idiv %ebx
        movl %eax, %ebx
        movl 8(%esp), %eax
        movl 4(%esp), %edx
        movl %ebx, %eax
        movl 0(%esp), %ebx
        movl %eax, %ebx
        addl $12, %esp
      sub $16, %esp
      movl %eax, 4(%esp)
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
