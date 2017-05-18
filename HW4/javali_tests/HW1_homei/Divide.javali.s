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
              pushl $0
              pushl %edi
# ______________var___________________________________________________
              movl -4(%ebp), %edi
# ______________swap needed___________________________________________
              movl %edi, 4(%esp)
              popl %edi
              popl %esi
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
            pushl $0
            pushl %esi
# ____________var_____________________________________________________
            movl -12(%ebp), %esi
# ____________swap needed_____________________________________________
            movl %esi, 4(%esp)
            popl %esi
            popl %edi
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
            pushl $0
            pushl %esi
# ____________var_____________________________________________________
            movl -12(%ebp), %esi
# ____________swap needed_____________________________________________
            movl %esi, 4(%esp)
            popl %esi
            popl %edi
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
            pushl $0
            pushl %edi
# ____________var_____________________________________________________
            movl -4(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          imul %edi, %esi
        movl %esi, -8(%ebp)
        # Emitting write(((a + b) + c))
          # Emitting ((a + b) + c)
            # Emitting (a + b)
              # Emitting b
# ______________var___________________________________________________
              movl -8(%ebp), %esi
              # Emitting a
              pushl $0
              pushl %esi
# ______________var___________________________________________________
              movl -4(%ebp), %esi
# ______________swap needed___________________________________________
              movl %esi, 4(%esp)
              popl %esi
              popl %edi
            add %esi, %edi
            # Emitting c
            pushl $0
            pushl %edi
# ____________var_____________________________________________________
            movl -12(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
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
                pushl $0
                pushl %edi
                movl $6, %edi
# ________________swap needed_________________________________________
                movl %edi, 4(%esp)
                popl %edi
                popl %esi
              add %edi, %esi
              # Emitting (3 + 2)
              pushl $0
              pushl %esi
                # Emitting 2
                movl $2, %esi
                # Emitting 3
                pushl $0
                pushl %esi
                movl $3, %esi
# ________________swap needed_________________________________________
                movl %esi, 4(%esp)
                popl %esi
                popl %edi
              add %esi, %edi
              popl %esi
              addl $4, %esp
            add %esi, %edi
            # Emitting ((6 * 7) / (4 * 3))
            pushl $0
            pushl %edi
              # Emitting (4 * 3)
                # Emitting 3
                movl $3, %edi
                # Emitting 4
                pushl $0
                pushl %edi
                movl $4, %edi
# ________________swap needed_________________________________________
                movl %edi, 4(%esp)
                popl %edi
                popl %esi
              imul %edi, %esi
              # Emitting (6 * 7)
              pushl $0
              pushl %esi
                # Emitting 7
                movl $7, %esi
                # Emitting 6
                pushl $0
                pushl %esi
                movl $6, %esi
# ________________swap needed_________________________________________
                movl %esi, 4(%esp)
                popl %esi
                popl %edi
              imul %esi, %edi
              popl %esi
              addl $4, %esp
            cmpl $0, %esi
            jne .L5
            movl $7, %eax
            jmp .ERROR_EXIT
.L5:
            pushl %esi
            pushl %edi
            popl %eax
            popl %ebx
            cltd
            idivl %ebx
            movl %eax, %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          sub %edi, %esi
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
        # Emitting write((((((6 * 54) / (5 * 3)) / ((18 / 18) / (34 / 34))) / (((2 * 12) / (3 * 2)) / ((15 / 2) / (10 / 2)))) / ((((6 * 54) / (5 * 3)) / ((18 / 18) / (34 / 34))) / (((2 * 12) / (3 * 2)) / ((15 / 2) / (10 / 2))))))
          # Emitting (((((6 * 54) / (5 * 3)) / ((18 / 18) / (34 / 34))) / (((2 * 12) / (3 * 2)) / ((15 / 2) / (10 / 2)))) / ((((6 * 54) / (5 * 3)) / ((18 / 18) / (34 / 34))) / (((2 * 12) / (3 * 2)) / ((15 / 2) / (10 / 2)))))
            # Emitting ((((6 * 54) / (5 * 3)) / ((18 / 18) / (34 / 34))) / (((2 * 12) / (3 * 2)) / ((15 / 2) / (10 / 2))))
              # Emitting (((2 * 12) / (3 * 2)) / ((15 / 2) / (10 / 2)))
                # Emitting ((15 / 2) / (10 / 2))
                  # Emitting (10 / 2)
                    # Emitting 2
                    movl $2, %esi
                    # Emitting 10
                    pushl $0
                    pushl %esi
                    movl $10, %esi
# ____________________swap needed_____________________________________
                    movl %esi, 4(%esp)
                    popl %esi
                    popl %edi
                  cmpl $0, %esi
                  jne .L6
                  movl $7, %eax
                  jmp .ERROR_EXIT
.L6:
                  pushl %esi
                  pushl %edi
                  popl %eax
                  popl %ebx
                  cltd
                  idivl %ebx
                  movl %eax, %edi
                  # Emitting (15 / 2)
                  pushl $0
                  pushl %edi
                    # Emitting 2
                    movl $2, %edi
                    # Emitting 15
                    pushl $0
                    pushl %edi
                    movl $15, %edi
# ____________________swap needed_____________________________________
                    movl %edi, 4(%esp)
                    popl %edi
                    popl %esi
                  cmpl $0, %edi
                  jne .L7
                  movl $7, %eax
                  jmp .ERROR_EXIT
.L7:
                  pushl %edi
                  pushl %esi
                  popl %eax
                  popl %ebx
                  cltd
                  idivl %ebx
                  movl %eax, %esi
                  popl %edi
                  addl $4, %esp
                cmpl $0, %edi
                jne .L8
                movl $7, %eax
                jmp .ERROR_EXIT
.L8:
                pushl %edi
                pushl %esi
                popl %eax
                popl %ebx
                cltd
                idivl %ebx
                movl %eax, %esi
                # Emitting ((2 * 12) / (3 * 2))
                pushl $0
                pushl %esi
                  # Emitting (3 * 2)
                    # Emitting 2
                    movl $2, %esi
                    # Emitting 3
                    pushl $0
                    pushl %esi
                    movl $3, %esi
# ____________________swap needed_____________________________________
                    movl %esi, 4(%esp)
                    popl %esi
                    popl %edi
                  imul %esi, %edi
                  # Emitting (2 * 12)
                  pushl $0
                  pushl %edi
                    # Emitting 12
                    movl $12, %edi
                    # Emitting 2
                    pushl $0
                    pushl %edi
                    movl $2, %edi
# ____________________swap needed_____________________________________
                    movl %edi, 4(%esp)
                    popl %edi
                    popl %esi
                  imul %edi, %esi
                  popl %edi
                  addl $4, %esp
                cmpl $0, %edi
                jne .L9
                movl $7, %eax
                jmp .ERROR_EXIT
.L9:
                pushl %edi
                pushl %esi
                popl %eax
                popl %ebx
                cltd
                idivl %ebx
                movl %eax, %esi
# ________________swap needed_________________________________________
                movl %esi, 4(%esp)
                popl %esi
                popl %edi
              cmpl $0, %esi
              jne .L10
              movl $7, %eax
              jmp .ERROR_EXIT
.L10:
              pushl %esi
              pushl %edi
              popl %eax
              popl %ebx
              cltd
              idivl %ebx
              movl %eax, %edi
              # Emitting (((6 * 54) / (5 * 3)) / ((18 / 18) / (34 / 34)))
              pushl $0
              pushl %edi
                # Emitting ((18 / 18) / (34 / 34))
                  # Emitting (34 / 34)
                    # Emitting 34
                    movl $34, %edi
                    # Emitting 34
                    pushl $0
                    pushl %edi
                    movl $34, %edi
# ____________________swap needed_____________________________________
                    movl %edi, 4(%esp)
                    popl %edi
                    popl %esi
                  cmpl $0, %edi
                  jne .L11
                  movl $7, %eax
                  jmp .ERROR_EXIT
.L11:
                  pushl %edi
                  pushl %esi
                  popl %eax
                  popl %ebx
                  cltd
                  idivl %ebx
                  movl %eax, %esi
                  # Emitting (18 / 18)
                  pushl $0
                  pushl %esi
                    # Emitting 18
                    movl $18, %esi
                    # Emitting 18
                    pushl $0
                    pushl %esi
                    movl $18, %esi
# ____________________swap needed_____________________________________
                    movl %esi, 4(%esp)
                    popl %esi
                    popl %edi
                  cmpl $0, %esi
                  jne .L12
                  movl $7, %eax
                  jmp .ERROR_EXIT
.L12:
                  pushl %esi
                  pushl %edi
                  popl %eax
                  popl %ebx
                  cltd
                  idivl %ebx
                  movl %eax, %edi
                  popl %esi
                  addl $4, %esp
                cmpl $0, %esi
                jne .L13
                movl $7, %eax
                jmp .ERROR_EXIT
.L13:
                pushl %esi
                pushl %edi
                popl %eax
                popl %ebx
                cltd
                idivl %ebx
                movl %eax, %edi
                # Emitting ((6 * 54) / (5 * 3))
                pushl $0
                pushl %edi
                  # Emitting (5 * 3)
                    # Emitting 3
                    movl $3, %edi
                    # Emitting 5
                    pushl $0
                    pushl %edi
                    movl $5, %edi
# ____________________swap needed_____________________________________
                    movl %edi, 4(%esp)
                    popl %edi
                    popl %esi
                  imul %edi, %esi
                  # Emitting (6 * 54)
                  pushl $0
                  pushl %esi
                    # Emitting 54
                    movl $54, %esi
                    # Emitting 6
                    pushl $0
                    pushl %esi
                    movl $6, %esi
# ____________________swap needed_____________________________________
                    movl %esi, 4(%esp)
                    popl %esi
                    popl %edi
                  imul %esi, %edi
                  popl %esi
                  addl $4, %esp
                cmpl $0, %esi
                jne .L14
                movl $7, %eax
                jmp .ERROR_EXIT
.L14:
                pushl %esi
                pushl %edi
                popl %eax
                popl %ebx
                cltd
                idivl %ebx
                movl %eax, %edi
# ________________swap needed_________________________________________
                movl %edi, 4(%esp)
                popl %edi
                popl %esi
              cmpl $0, %edi
              jne .L15
              movl $7, %eax
              jmp .ERROR_EXIT
.L15:
              pushl %edi
              pushl %esi
              popl %eax
              popl %ebx
              cltd
              idivl %ebx
              movl %eax, %esi
              popl %edi
              addl $4, %esp
            cmpl $0, %edi
            jne .L16
            movl $7, %eax
            jmp .ERROR_EXIT
.L16:
            pushl %edi
            pushl %esi
            popl %eax
            popl %ebx
            cltd
            idivl %ebx
            movl %eax, %esi
            # Emitting ((((6 * 54) / (5 * 3)) / ((18 / 18) / (34 / 34))) / (((2 * 12) / (3 * 2)) / ((15 / 2) / (10 / 2))))
            pushl $0
            pushl %esi
              # Emitting (((2 * 12) / (3 * 2)) / ((15 / 2) / (10 / 2)))
                # Emitting ((15 / 2) / (10 / 2))
                  # Emitting (10 / 2)
                    # Emitting 2
                    movl $2, %esi
                    # Emitting 10
                    pushl $0
                    pushl %esi
                    movl $10, %esi
# ____________________swap needed_____________________________________
                    movl %esi, 4(%esp)
                    popl %esi
                    popl %edi
                  cmpl $0, %esi
                  jne .L17
                  movl $7, %eax
                  jmp .ERROR_EXIT
.L17:
                  pushl %esi
                  pushl %edi
                  popl %eax
                  popl %ebx
                  cltd
                  idivl %ebx
                  movl %eax, %edi
                  # Emitting (15 / 2)
                  pushl $0
                  pushl %edi
                    # Emitting 2
                    movl $2, %edi
                    # Emitting 15
                    pushl $0
                    pushl %edi
                    movl $15, %edi
# ____________________swap needed_____________________________________
                    movl %edi, 4(%esp)
                    popl %edi
                    popl %esi
                  cmpl $0, %edi
                  jne .L18
                  movl $7, %eax
                  jmp .ERROR_EXIT
.L18:
                  pushl %edi
                  pushl %esi
                  popl %eax
                  popl %ebx
                  cltd
                  idivl %ebx
                  movl %eax, %esi
                  popl %edi
                  addl $4, %esp
                cmpl $0, %edi
                jne .L19
                movl $7, %eax
                jmp .ERROR_EXIT
.L19:
                pushl %edi
                pushl %esi
                popl %eax
                popl %ebx
                cltd
                idivl %ebx
                movl %eax, %esi
                # Emitting ((2 * 12) / (3 * 2))
                pushl $0
                pushl %esi
                  # Emitting (3 * 2)
                    # Emitting 2
                    movl $2, %esi
                    # Emitting 3
                    pushl $0
                    pushl %esi
                    movl $3, %esi
# ____________________swap needed_____________________________________
                    movl %esi, 4(%esp)
                    popl %esi
                    popl %edi
                  imul %esi, %edi
                  # Emitting (2 * 12)
                  pushl $0
                  pushl %edi
                    # Emitting 12
                    movl $12, %edi
                    # Emitting 2
                    pushl $0
                    pushl %edi
                    movl $2, %edi
# ____________________swap needed_____________________________________
                    movl %edi, 4(%esp)
                    popl %edi
                    popl %esi
                  imul %edi, %esi
                  popl %edi
                  addl $4, %esp
                cmpl $0, %edi
                jne .L20
                movl $7, %eax
                jmp .ERROR_EXIT
.L20:
                pushl %edi
                pushl %esi
                popl %eax
                popl %ebx
                cltd
                idivl %ebx
                movl %eax, %esi
# ________________swap needed_________________________________________
                movl %esi, 4(%esp)
                popl %esi
                popl %edi
              cmpl $0, %esi
              jne .L21
              movl $7, %eax
              jmp .ERROR_EXIT
.L21:
              pushl %esi
              pushl %edi
              popl %eax
              popl %ebx
              cltd
              idivl %ebx
              movl %eax, %edi
              # Emitting (((6 * 54) / (5 * 3)) / ((18 / 18) / (34 / 34)))
              pushl $0
              pushl %edi
                # Emitting ((18 / 18) / (34 / 34))
                  # Emitting (34 / 34)
                    # Emitting 34
                    movl $34, %edi
                    # Emitting 34
                    pushl $0
                    pushl %edi
                    movl $34, %edi
# ____________________swap needed_____________________________________
                    movl %edi, 4(%esp)
                    popl %edi
                    popl %esi
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
                  # Emitting (18 / 18)
                  pushl $0
                  pushl %esi
                    # Emitting 18
                    movl $18, %esi
                    # Emitting 18
                    pushl $0
                    pushl %esi
                    movl $18, %esi
# ____________________swap needed_____________________________________
                    movl %esi, 4(%esp)
                    popl %esi
                    popl %edi
                  cmpl $0, %esi
                  jne .L23
                  movl $7, %eax
                  jmp .ERROR_EXIT
.L23:
                  pushl %esi
                  pushl %edi
                  popl %eax
                  popl %ebx
                  cltd
                  idivl %ebx
                  movl %eax, %edi
                  popl %esi
                  addl $4, %esp
                cmpl $0, %esi
                jne .L24
                movl $7, %eax
                jmp .ERROR_EXIT
.L24:
                pushl %esi
                pushl %edi
                popl %eax
                popl %ebx
                cltd
                idivl %ebx
                movl %eax, %edi
                # Emitting ((6 * 54) / (5 * 3))
                pushl $0
                pushl %edi
                  # Emitting (5 * 3)
                    # Emitting 3
                    movl $3, %edi
                    # Emitting 5
                    pushl $0
                    pushl %edi
                    movl $5, %edi
# ____________________swap needed_____________________________________
                    movl %edi, 4(%esp)
                    popl %edi
                    popl %esi
                  imul %edi, %esi
                  # Emitting (6 * 54)
                  pushl $0
                  pushl %esi
                    # Emitting 54
                    movl $54, %esi
                    # Emitting 6
                    pushl $0
                    pushl %esi
                    movl $6, %esi
# ____________________swap needed_____________________________________
                    movl %esi, 4(%esp)
                    popl %esi
                    popl %edi
                  imul %esi, %edi
                  popl %esi
                  addl $4, %esp
                cmpl $0, %esi
                jne .L25
                movl $7, %eax
                jmp .ERROR_EXIT
.L25:
                pushl %esi
                pushl %edi
                popl %eax
                popl %ebx
                cltd
                idivl %ebx
                movl %eax, %edi
# ________________swap needed_________________________________________
                movl %edi, 4(%esp)
                popl %edi
                popl %esi
              cmpl $0, %edi
              jne .L26
              movl $7, %eax
              jmp .ERROR_EXIT
.L26:
              pushl %edi
              pushl %esi
              popl %eax
              popl %ebx
              cltd
              idivl %ebx
              movl %eax, %esi
              popl %edi
              addl $4, %esp
            cmpl $0, %edi
            jne .L27
            movl $7, %eax
            jmp .ERROR_EXIT
.L27:
            pushl %edi
            pushl %esi
            popl %eax
            popl %ebx
            cltd
            idivl %ebx
            movl %eax, %esi
# ____________swap needed_____________________________________________
            movl %esi, 4(%esp)
            popl %esi
            popl %edi
          cmpl $0, %esi
          jne .L28
          movl $7, %eax
          jmp .ERROR_EXIT
.L28:
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
    addl $12, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
