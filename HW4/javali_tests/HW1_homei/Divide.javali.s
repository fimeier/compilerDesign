.section .data
	vtable_Main_array:
		.int vtable_Object
	vtable_int_array:
		.int vtable_Object
	vtable_Object:
		.int 0
	vtable_Main:
		.int vtable_Object
		.int Main_main
	vtable_boolean_array:
		.int vtable_Object
	STR_NL:
		.string "\n"
	STR_D:
		.string "%d"
	BASE_PT:
	.int 0
	STACK_PT:
	.int 0
.section .text
# start: Main-Class___________________________________________________
.global main

main:
# start: prolog
movl %esp, STACK_PT
movl %ebp, BASE_PT
pushl %ebp
movl %esp, %ebp
# end: prolog
# Create Main object and safe its address to %eax
pushl $4
pushl $1
call calloc
addl $8, %esp
# copy the pinter to the vtable to the Main Object
movl $vtable_Main, (%eax)
pushl %eax
call Main_main
addl $4, %esp
movl %ebp, %esp
popl %ebp
movl $0, %eax
ret
# end: Main-Class_____________________________________________________
.ERROR_EXIT:
movl STACK_PT, %esp
movl BASE_PT, %ebp
ret
  # Emitting class Main {...}
    # Emitting void main(...) {...}
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    # variable a
    pushl $0
    # variable b
    pushl $0
    # variable c
    pushl $0
      # Emitting (...)
        # Emitting a = 8
# ________assign______________________________________________________
          # Emitting 8
          movl $8, %edi
        movl %edi, -4(%ebp)
        # Emitting b = 2
# ________assign______________________________________________________
          # Emitting 2
          movl $2, %edi
        movl %edi, -8(%ebp)
        # Emitting c = 9
# ________assign______________________________________________________
          # Emitting 9
          movl $9, %edi
        movl %edi, -12(%ebp)
        # Emitting write(((a / b) / c))
          # Emitting ((a / b) / c)
            # Emitting (a / b)
              # Emitting b
# ______________var___________________________________________________
              movl -8(%ebp), %edi
              # Emitting a
# ______________var___________________________________________________
              movl -4(%ebp), %esi
            cmpl $0, %edi
            jne .L2
            movl $7, %eax
            jmp .ERROR_EXIT
.L2:
            pushl %edi
            pushl %esi
            popl %eax
            popl %ebx
            cltd
            idivl %ebx
            movl %eax, %esi
            # Emitting c
# ____________var_____________________________________________________
            movl -12(%ebp), %edi
          cmpl $0, %edi
          jne .L3
          movl $7, %eax
          jmp .ERROR_EXIT
.L3:
          pushl %edi
          pushl %esi
          popl %eax
          popl %ebx
          cltd
          idivl %ebx
          movl %eax, %esi
        sub $16, %esp
        movl %esi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        # Emitting write((c / b))
          # Emitting (c / b)
            # Emitting b
# ____________var_____________________________________________________
            movl -8(%ebp), %esi
            # Emitting c
# ____________var_____________________________________________________
            movl -12(%ebp), %edi
          cmpl $0, %esi
          jne .L4
          movl $7, %eax
          jmp .ERROR_EXIT
.L4:
          pushl %esi
          pushl %edi
          popl %eax
          popl %ebx
          cltd
          idivl %ebx
          movl %eax, %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        # Emitting b = (a * c)
# ________assign______________________________________________________
          # Emitting (a * c)
            # Emitting c
# ____________var_____________________________________________________
            movl -12(%ebp), %edi
            # Emitting a
# ____________var_____________________________________________________
            movl -4(%ebp), %esi
          imul %edi, %esi
        movl %esi, -8(%ebp)
        # Emitting write(((a + b) + c))
          # Emitting ((a + b) + c)
            # Emitting (a + b)
              # Emitting b
# ______________var___________________________________________________
              movl -8(%ebp), %esi
              # Emitting a
# ______________var___________________________________________________
              movl -4(%ebp), %edi
            add %esi, %edi
            # Emitting c
# ____________var_____________________________________________________
            movl -12(%ebp), %esi
          add %esi, %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        # Emitting write(b)
          # Emitting b
# __________var_______________________________________________________
          movl -8(%ebp), %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        # Emitting write((((6 * 7) / (4 * 3)) - ((3 + 2) + (6 + 3))))
          # Emitting (((6 * 7) / (4 * 3)) - ((3 + 2) + (6 + 3)))
            # Emitting ((3 + 2) + (6 + 3))
              # Emitting (6 + 3)
                # Emitting 3
                movl $3, %edi
                # Emitting 6
                movl $6, %esi
              add %edi, %esi
              # Emitting (3 + 2)
                # Emitting 2
                movl $2, %edi
                # Emitting 3
                movl $3, %edx
              add %edi, %edx
            add %esi, %edx
            # Emitting ((6 * 7) / (4 * 3))
              # Emitting (4 * 3)
                # Emitting 3
                movl $3, %esi
                # Emitting 4
                movl $4, %edi
              imul %esi, %edi
              # Emitting (6 * 7)
                # Emitting 7
                movl $7, %esi
                # Emitting 6
                movl $6, %ecx
              imul %esi, %ecx
            pushl %edx
            cmpl $0, %edi
            jne .L5
            movl $7, %eax
            jmp .ERROR_EXIT
.L5:
            pushl %edi
            pushl %ecx
            popl %eax
            popl %ebx
            cltd
            idivl %ebx
            movl %eax, %ecx
            popl %edx
          sub %edx, %ecx
        sub $16, %esp
        movl %ecx, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        # Emitting write((((((6 * 54) / (5 * 3)) / ((18 / 18) / (34 / 34))) / (((2 * 12) / (3 * 2)) / ((15 / 2) / (10 / 2)))) / ((((6 * 54) / (5 * 3)) / ((18 / 18) / (34 / 34))) / (((2 * 12) / (3 * 2)) / ((15 / 2) / (10 / 2))))))
          # Emitting (((((6 * 54) / (5 * 3)) / ((18 / 18) / (34 / 34))) / (((2 * 12) / (3 * 2)) / ((15 / 2) / (10 / 2)))) / ((((6 * 54) / (5 * 3)) / ((18 / 18) / (34 / 34))) / (((2 * 12) / (3 * 2)) / ((15 / 2) / (10 / 2)))))
            # Emitting ((((6 * 54) / (5 * 3)) / ((18 / 18) / (34 / 34))) / (((2 * 12) / (3 * 2)) / ((15 / 2) / (10 / 2))))
              # Emitting (((2 * 12) / (3 * 2)) / ((15 / 2) / (10 / 2)))
                # Emitting ((15 / 2) / (10 / 2))
                  # Emitting (10 / 2)
                    # Emitting 2
                    movl $2, %ecx
                    # Emitting 10
                    movl $10, %edx
                  cmpl $0, %ecx
                  jne .L6
                  movl $7, %eax
                  jmp .ERROR_EXIT
.L6:
                  pushl %ecx
                  pushl %edx
                  popl %eax
                  popl %ebx
                  cltd
                  idivl %ebx
                  movl %eax, %edx
                  # Emitting (15 / 2)
                    # Emitting 2
                    movl $2, %ecx
                    # Emitting 15
                    movl $15, %edi
                  pushl %edx
                  cmpl $0, %ecx
                  jne .L7
                  movl $7, %eax
                  jmp .ERROR_EXIT
.L7:
                  pushl %ecx
                  pushl %edi
                  popl %eax
                  popl %ebx
                  cltd
                  idivl %ebx
                  movl %eax, %edi
                  popl %edx
                cmpl $0, %edx
                jne .L8
                movl $7, %eax
                jmp .ERROR_EXIT
.L8:
                pushl %edx
                pushl %edi
                popl %eax
                popl %ebx
                cltd
                idivl %ebx
                movl %eax, %edi
                # Emitting ((2 * 12) / (3 * 2))
                  # Emitting (3 * 2)
                    # Emitting 2
                    movl $2, %edx
                    # Emitting 3
                    movl $3, %ecx
                  imul %edx, %ecx
                  # Emitting (2 * 12)
                    # Emitting 12
                    movl $12, %edx
                    # Emitting 2
                    movl $2, %esi
                  imul %edx, %esi
                cmpl $0, %ecx
                jne .L9
                movl $7, %eax
                jmp .ERROR_EXIT
.L9:
                pushl %ecx
                pushl %esi
                popl %eax
                popl %ebx
                cltd
                idivl %ebx
                movl %eax, %esi
              cmpl $0, %edi
              jne .L10
              movl $7, %eax
              jmp .ERROR_EXIT
.L10:
              pushl %edi
              pushl %esi
              popl %eax
              popl %ebx
              cltd
              idivl %ebx
              movl %eax, %esi
              # Emitting (((6 * 54) / (5 * 3)) / ((18 / 18) / (34 / 34)))
                # Emitting ((18 / 18) / (34 / 34))
                  # Emitting (34 / 34)
                    # Emitting 34
                    movl $34, %edi
                    # Emitting 34
                    movl $34, %ecx
                  cmpl $0, %edi
                  jne .L11
                  movl $7, %eax
                  jmp .ERROR_EXIT
.L11:
                  pushl %edi
                  pushl %ecx
                  popl %eax
                  popl %ebx
                  cltd
                  idivl %ebx
                  movl %eax, %ecx
                  # Emitting (18 / 18)
                    # Emitting 18
                    movl $18, %edi
                    # Emitting 18
                    movl $18, %edx
                  cmpl $0, %edi
                  jne .L12
                  movl $7, %eax
                  jmp .ERROR_EXIT
.L12:
                  pushl %edi
                  pushl %edx
                  popl %eax
                  popl %ebx
                  cltd
                  idivl %ebx
                  movl %eax, %edx
                cmpl $0, %ecx
                jne .L13
                movl $7, %eax
                jmp .ERROR_EXIT
.L13:
                pushl %ecx
                pushl %edx
                popl %eax
                popl %ebx
                cltd
                idivl %ebx
                movl %eax, %edx
                # Emitting ((6 * 54) / (5 * 3))
                  # Emitting (5 * 3)
                    # Emitting 3
                    movl $3, %ecx
                    # Emitting 5
                    movl $5, %edi
                  imul %ecx, %edi
                  # Emitting (6 * 54)
                    # Emitting 54
                    movl $54, %ecx
                    # Emitting 6
                    movl $6, %ebx
                  imul %ecx, %ebx
                pushl %edx
                cmpl $0, %edi
                jne .L14
                movl $7, %eax
                jmp .ERROR_EXIT
.L14:
                pushl %edi
                pushl %ebx
                popl %eax
                popl %ebx
                cltd
                idivl %ebx
                movl %eax, %ebx
                popl %edx
              cmpl $0, %edx
              jne .L15
              movl $7, %eax
              jmp .ERROR_EXIT
.L15:
              pushl %edx
              pushl %ebx
              popl %eax
              popl %ebx
              cltd
              idivl %ebx
              movl %eax, %ebx
            cmpl $0, %esi
            jne .L16
            movl $7, %eax
            jmp .ERROR_EXIT
.L16:
            pushl %esi
            pushl %ebx
            popl %eax
            popl %ebx
            cltd
            idivl %ebx
            movl %eax, %ebx
            # Emitting ((((6 * 54) / (5 * 3)) / ((18 / 18) / (34 / 34))) / (((2 * 12) / (3 * 2)) / ((15 / 2) / (10 / 2))))
              # Emitting (((2 * 12) / (3 * 2)) / ((15 / 2) / (10 / 2)))
                # Emitting ((15 / 2) / (10 / 2))
                  # Emitting (10 / 2)
                    # Emitting 2
                    movl $2, %esi
                    # Emitting 10
                    movl $10, %edx
                  pushl %ebx
                  cmpl $0, %esi
                  jne .L17
                  movl $7, %eax
                  jmp .ERROR_EXIT
.L17:
                  pushl %esi
                  pushl %edx
                  popl %eax
                  popl %ebx
                  cltd
                  idivl %ebx
                  movl %eax, %edx
                  popl %ebx
                  # Emitting (15 / 2)
                    # Emitting 2
                    movl $2, %esi
                    # Emitting 15
                    movl $15, %edi
                  pushl %ebx
                  pushl %edx
                  cmpl $0, %esi
                  jne .L18
                  movl $7, %eax
                  jmp .ERROR_EXIT
.L18:
                  pushl %esi
                  pushl %edi
                  popl %eax
                  popl %ebx
                  cltd
                  idivl %ebx
                  movl %eax, %edi
                  popl %edx
                  popl %ebx
                pushl %ebx
                cmpl $0, %edx
                jne .L19
                movl $7, %eax
                jmp .ERROR_EXIT
.L19:
                pushl %edx
                pushl %edi
                popl %eax
                popl %ebx
                cltd
                idivl %ebx
                movl %eax, %edi
                popl %ebx
                # Emitting ((2 * 12) / (3 * 2))
                  # Emitting (3 * 2)
                    # Emitting 2
                    movl $2, %edx
                    # Emitting 3
                    movl $3, %esi
                  imul %edx, %esi
                  # Emitting (2 * 12)
                    # Emitting 12
                    movl $12, %edx
                    # Emitting 2
                    movl $2, %ecx
                  imul %edx, %ecx
                pushl %ebx
                cmpl $0, %esi
                jne .L20
                movl $7, %eax
                jmp .ERROR_EXIT
.L20:
                pushl %esi
                pushl %ecx
                popl %eax
                popl %ebx
                cltd
                idivl %ebx
                movl %eax, %ecx
                popl %ebx
              pushl %ebx
              cmpl $0, %edi
              jne .L21
              movl $7, %eax
              jmp .ERROR_EXIT
.L21:
              pushl %edi
              pushl %ecx
              popl %eax
              popl %ebx
              cltd
              idivl %ebx
              movl %eax, %ecx
              popl %ebx
              # Emitting (((6 * 54) / (5 * 3)) / ((18 / 18) / (34 / 34)))
                # Emitting ((18 / 18) / (34 / 34))
                  # Emitting (34 / 34)
                    # Emitting 34
                    movl $34, %edi
                    # Emitting 34
                    movl $34, %esi
                  pushl %ebx
                  cmpl $0, %edi
                  jne .L22
                  movl $7, %eax
                  jmp .ERROR_EXIT
.L22:
                  pushl %edi
                  pushl %esi
                  popl %eax
                  popl %ebx
                  cltd
                  idivl %ebx
                  movl %eax, %esi
                  popl %ebx
                  # Emitting (18 / 18)
                    # Emitting 18
                    movl $18, %edi
                    # Emitting 18
                    movl $18, %edx
                  pushl %ebx
                  cmpl $0, %edi
                  jne .L23
                  movl $7, %eax
                  jmp .ERROR_EXIT
.L23:
                  pushl %edi
                  pushl %edx
                  popl %eax
                  popl %ebx
                  cltd
                  idivl %ebx
                  movl %eax, %edx
                  popl %ebx
                pushl %ebx
                cmpl $0, %esi
                jne .L24
                movl $7, %eax
                jmp .ERROR_EXIT
.L24:
                pushl %esi
                pushl %edx
                popl %eax
                popl %ebx
                cltd
                idivl %ebx
                movl %eax, %edx
                popl %ebx
                # Emitting ((6 * 54) / (5 * 3))
                  # Emitting (5 * 3)
                    # Emitting 3
                    movl $3, %esi
                    # Emitting 5
                    movl $5, %edi
                  imul %esi, %edi
                  # Emitting (6 * 54)
                    # Emitting 54
                    movl $54, %esi
                    # Emitting 6
                    movl $6, %eax
                  imul %esi, %eax
                pushl %ebx
                pushl %edx
                cmpl $0, %edi
                jne .L25
                movl $7, %eax
                jmp .ERROR_EXIT
.L25:
                pushl %edi
                pushl %eax
                popl %eax
                popl %ebx
                cltd
                idivl %ebx
                movl %eax, %eax
                popl %edx
                popl %ebx
              pushl %ebx
              cmpl $0, %edx
              jne .L26
              movl $7, %eax
              jmp .ERROR_EXIT
.L26:
              pushl %edx
              pushl %eax
              popl %eax
              popl %ebx
              cltd
              idivl %ebx
              movl %eax, %eax
              popl %ebx
            pushl %ebx
            cmpl $0, %ecx
            jne .L27
            movl $7, %eax
            jmp .ERROR_EXIT
.L27:
            pushl %ecx
            pushl %eax
            popl %eax
            popl %ebx
            cltd
            idivl %ebx
            movl %eax, %eax
            popl %ebx
          cmpl $0, %ebx
          jne .L28
          movl $7, %eax
          jmp .ERROR_EXIT
.L28:
          pushl %ebx
          pushl %eax
          popl %eax
          popl %ebx
          cltd
          idivl %ebx
          movl %eax, %eax
        sub $16, %esp
        movl %eax, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
    addl $12, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
