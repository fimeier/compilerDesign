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
    # variable r1
    pushl $0
    # variable r2
    pushl $0
    # variable r3
    pushl $0
      # Emitting (...)
        # Emitting r1 = 8
# ________assign______________________________________________________
          # Emitting 8
          movl $8, %edi
        movl %edi, -4(%ebp)
        # Emitting r2 = 2
# ________assign______________________________________________________
          # Emitting 2
          movl $2, %edi
        movl %edi, -8(%ebp)
        # Emitting r3 = 9
# ________assign______________________________________________________
          # Emitting 9
          movl $9, %edi
        movl %edi, -12(%ebp)
        # Emitting write(((r1 / r2) / r2))
          # Emitting ((r1 / r2) / r2)
            # Emitting (r1 / r2)
              # Emitting r2
# ______________var___________________________________________________
              movl -8(%ebp), %edi
              # Emitting r1
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
            # Emitting r2
            pushl $0
            pushl %esi
# ____________var_____________________________________________________
            movl -8(%ebp), %esi
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
        # Emitting write((r3 / r2))
          # Emitting (r3 / r2)
            # Emitting r2
# ____________var_____________________________________________________
            movl -8(%ebp), %esi
            # Emitting r3
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
        # Emitting r2 = (r1 * r3)
# ________assign______________________________________________________
          # Emitting (r1 * r3)
            # Emitting r3
# ____________var_____________________________________________________
            movl -12(%ebp), %edi
            # Emitting r1
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
        # Emitting write(r2)
          # Emitting r2
# __________var_______________________________________________________
          movl -8(%ebp), %esi
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
        # Emitting write((((3 * 4) / (2 * 3)) - ((4 + 7) + (9 + 13))))
          # Emitting (((3 * 4) / (2 * 3)) - ((4 + 7) + (9 + 13)))
            # Emitting ((4 + 7) + (9 + 13))
              # Emitting (9 + 13)
                # Emitting 13
                movl $13, %esi
                # Emitting 9
                pushl $0
                pushl %esi
                movl $9, %esi
# ________________swap needed_________________________________________
                movl %esi, 4(%esp)
                popl %esi
                popl %edi
              add %esi, %edi
              # Emitting (4 + 7)
              pushl $0
              pushl %edi
                # Emitting 7
                movl $7, %edi
                # Emitting 4
                pushl $0
                pushl %edi
                movl $4, %edi
# ________________swap needed_________________________________________
                movl %edi, 4(%esp)
                popl %edi
                popl %esi
              add %edi, %esi
              popl %edi
              addl $4, %esp
            add %edi, %esi
            # Emitting ((3 * 4) / (2 * 3))
            pushl $0
            pushl %esi
              # Emitting (2 * 3)
                # Emitting 3
                movl $3, %esi
                # Emitting 2
                pushl $0
                pushl %esi
                movl $2, %esi
# ________________swap needed_________________________________________
                movl %esi, 4(%esp)
                popl %esi
                popl %edi
              imul %esi, %edi
              # Emitting (3 * 4)
              pushl $0
              pushl %edi
                # Emitting 4
                movl $4, %edi
                # Emitting 3
                pushl $0
                pushl %edi
                movl $3, %edi
# ________________swap needed_________________________________________
                movl %edi, 4(%esp)
                popl %edi
                popl %esi
              imul %edi, %esi
              popl %edi
              addl $4, %esp
            cmpl $0, %edi
            jne .L5
            movl $7, %eax
            jmp .ERROR_EXIT
.L5:
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
          sub %esi, %edi
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
        # Emitting write((((((3 * 4) / (2 * 3)) / ((18 / 4) / (13 / 9))) / (((17 * 12) / (2 * 3)) / ((18 / 4) / (13 / 9)))) / ((((700 * 4) / (2 * 3)) / ((18 / 4) / (13 / 9))) / (((17 * 12) / (2 * 3)) / ((18 / 4) / (13 / 9))))))
          # Emitting (((((3 * 4) / (2 * 3)) / ((18 / 4) / (13 / 9))) / (((17 * 12) / (2 * 3)) / ((18 / 4) / (13 / 9)))) / ((((700 * 4) / (2 * 3)) / ((18 / 4) / (13 / 9))) / (((17 * 12) / (2 * 3)) / ((18 / 4) / (13 / 9)))))
            # Emitting ((((700 * 4) / (2 * 3)) / ((18 / 4) / (13 / 9))) / (((17 * 12) / (2 * 3)) / ((18 / 4) / (13 / 9))))
              # Emitting (((17 * 12) / (2 * 3)) / ((18 / 4) / (13 / 9)))
                # Emitting ((18 / 4) / (13 / 9))
                  # Emitting (13 / 9)
                    # Emitting 9
                    movl $9, %edi
                    # Emitting 13
                    pushl $0
                    pushl %edi
                    movl $13, %edi
# ____________________swap needed_____________________________________
                    movl %edi, 4(%esp)
                    popl %edi
                    popl %esi
                  cmpl $0, %edi
                  jne .L6
                  movl $7, %eax
                  jmp .ERROR_EXIT
.L6:
                  pushl %edi
                  pushl %esi
                  popl %eax
                  popl %ebx
                  cltd
                  idivl %ebx
                  movl %eax, %esi
                  # Emitting (18 / 4)
                  pushl $0
                  pushl %esi
                    # Emitting 4
                    movl $4, %esi
                    # Emitting 18
                    pushl $0
                    pushl %esi
                    movl $18, %esi
# ____________________swap needed_____________________________________
                    movl %esi, 4(%esp)
                    popl %esi
                    popl %edi
                  cmpl $0, %esi
                  jne .L7
                  movl $7, %eax
                  jmp .ERROR_EXIT
.L7:
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
                jne .L8
                movl $7, %eax
                jmp .ERROR_EXIT
.L8:
                pushl %esi
                pushl %edi
                popl %eax
                popl %ebx
                cltd
                idivl %ebx
                movl %eax, %edi
                # Emitting ((17 * 12) / (2 * 3))
                pushl $0
                pushl %edi
                  # Emitting (2 * 3)
                    # Emitting 3
                    movl $3, %edi
                    # Emitting 2
                    pushl $0
                    pushl %edi
                    movl $2, %edi
# ____________________swap needed_____________________________________
                    movl %edi, 4(%esp)
                    popl %edi
                    popl %esi
                  imul %edi, %esi
                  # Emitting (17 * 12)
                  pushl $0
                  pushl %esi
                    # Emitting 12
                    movl $12, %esi
                    # Emitting 17
                    pushl $0
                    pushl %esi
                    movl $17, %esi
# ____________________swap needed_____________________________________
                    movl %esi, 4(%esp)
                    popl %esi
                    popl %edi
                  imul %esi, %edi
                  popl %esi
                  addl $4, %esp
                cmpl $0, %esi
                jne .L9
                movl $7, %eax
                jmp .ERROR_EXIT
.L9:
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
              # Emitting (((700 * 4) / (2 * 3)) / ((18 / 4) / (13 / 9)))
              pushl $0
              pushl %esi
                # Emitting ((18 / 4) / (13 / 9))
                  # Emitting (13 / 9)
                    # Emitting 9
                    movl $9, %esi
                    # Emitting 13
                    pushl $0
                    pushl %esi
                    movl $13, %esi
# ____________________swap needed_____________________________________
                    movl %esi, 4(%esp)
                    popl %esi
                    popl %edi
                  cmpl $0, %esi
                  jne .L11
                  movl $7, %eax
                  jmp .ERROR_EXIT
.L11:
                  pushl %esi
                  pushl %edi
                  popl %eax
                  popl %ebx
                  cltd
                  idivl %ebx
                  movl %eax, %edi
                  # Emitting (18 / 4)
                  pushl $0
                  pushl %edi
                    # Emitting 4
                    movl $4, %edi
                    # Emitting 18
                    pushl $0
                    pushl %edi
                    movl $18, %edi
# ____________________swap needed_____________________________________
                    movl %edi, 4(%esp)
                    popl %edi
                    popl %esi
                  cmpl $0, %edi
                  jne .L12
                  movl $7, %eax
                  jmp .ERROR_EXIT
.L12:
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
                jne .L13
                movl $7, %eax
                jmp .ERROR_EXIT
.L13:
                pushl %edi
                pushl %esi
                popl %eax
                popl %ebx
                cltd
                idivl %ebx
                movl %eax, %esi
                # Emitting ((700 * 4) / (2 * 3))
                pushl $0
                pushl %esi
                  # Emitting (2 * 3)
                    # Emitting 3
                    movl $3, %esi
                    # Emitting 2
                    pushl $0
                    pushl %esi
                    movl $2, %esi
# ____________________swap needed_____________________________________
                    movl %esi, 4(%esp)
                    popl %esi
                    popl %edi
                  imul %esi, %edi
                  # Emitting (700 * 4)
                  pushl $0
                  pushl %edi
                    # Emitting 4
                    movl $4, %edi
                    # Emitting 700
                    pushl $0
                    pushl %edi
                    movl $700, %edi
# ____________________swap needed_____________________________________
                    movl %edi, 4(%esp)
                    popl %edi
                    popl %esi
                  imul %edi, %esi
                  popl %edi
                  addl $4, %esp
                cmpl $0, %edi
                jne .L14
                movl $7, %eax
                jmp .ERROR_EXIT
.L14:
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
              jne .L15
              movl $7, %eax
              jmp .ERROR_EXIT
.L15:
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
            jne .L16
            movl $7, %eax
            jmp .ERROR_EXIT
.L16:
            pushl %esi
            pushl %edi
            popl %eax
            popl %ebx
            cltd
            idivl %ebx
            movl %eax, %edi
            # Emitting ((((3 * 4) / (2 * 3)) / ((18 / 4) / (13 / 9))) / (((17 * 12) / (2 * 3)) / ((18 / 4) / (13 / 9))))
            pushl $0
            pushl %edi
              # Emitting (((17 * 12) / (2 * 3)) / ((18 / 4) / (13 / 9)))
                # Emitting ((18 / 4) / (13 / 9))
                  # Emitting (13 / 9)
                    # Emitting 9
                    movl $9, %edi
                    # Emitting 13
                    pushl $0
                    pushl %edi
                    movl $13, %edi
# ____________________swap needed_____________________________________
                    movl %edi, 4(%esp)
                    popl %edi
                    popl %esi
                  cmpl $0, %edi
                  jne .L17
                  movl $7, %eax
                  jmp .ERROR_EXIT
.L17:
                  pushl %edi
                  pushl %esi
                  popl %eax
                  popl %ebx
                  cltd
                  idivl %ebx
                  movl %eax, %esi
                  # Emitting (18 / 4)
                  pushl $0
                  pushl %esi
                    # Emitting 4
                    movl $4, %esi
                    # Emitting 18
                    pushl $0
                    pushl %esi
                    movl $18, %esi
# ____________________swap needed_____________________________________
                    movl %esi, 4(%esp)
                    popl %esi
                    popl %edi
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
                  popl %esi
                  addl $4, %esp
                cmpl $0, %esi
                jne .L19
                movl $7, %eax
                jmp .ERROR_EXIT
.L19:
                pushl %esi
                pushl %edi
                popl %eax
                popl %ebx
                cltd
                idivl %ebx
                movl %eax, %edi
                # Emitting ((17 * 12) / (2 * 3))
                pushl $0
                pushl %edi
                  # Emitting (2 * 3)
                    # Emitting 3
                    movl $3, %edi
                    # Emitting 2
                    pushl $0
                    pushl %edi
                    movl $2, %edi
# ____________________swap needed_____________________________________
                    movl %edi, 4(%esp)
                    popl %edi
                    popl %esi
                  imul %edi, %esi
                  # Emitting (17 * 12)
                  pushl $0
                  pushl %esi
                    # Emitting 12
                    movl $12, %esi
                    # Emitting 17
                    pushl $0
                    pushl %esi
                    movl $17, %esi
# ____________________swap needed_____________________________________
                    movl %esi, 4(%esp)
                    popl %esi
                    popl %edi
                  imul %esi, %edi
                  popl %esi
                  addl $4, %esp
                cmpl $0, %esi
                jne .L20
                movl $7, %eax
                jmp .ERROR_EXIT
.L20:
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
              jne .L21
              movl $7, %eax
              jmp .ERROR_EXIT
.L21:
              pushl %edi
              pushl %esi
              popl %eax
              popl %ebx
              cltd
              idivl %ebx
              movl %eax, %esi
              # Emitting (((3 * 4) / (2 * 3)) / ((18 / 4) / (13 / 9)))
              pushl $0
              pushl %esi
                # Emitting ((18 / 4) / (13 / 9))
                  # Emitting (13 / 9)
                    # Emitting 9
                    movl $9, %esi
                    # Emitting 13
                    pushl $0
                    pushl %esi
                    movl $13, %esi
# ____________________swap needed_____________________________________
                    movl %esi, 4(%esp)
                    popl %esi
                    popl %edi
                  cmpl $0, %esi
                  jne .L22
                  movl $7, %eax
                  jmp .ERROR_EXIT
.L22:
                  pushl %esi
                  pushl %edi
                  popl %eax
                  popl %ebx
                  cltd
                  idivl %ebx
                  movl %eax, %edi
                  # Emitting (18 / 4)
                  pushl $0
                  pushl %edi
                    # Emitting 4
                    movl $4, %edi
                    # Emitting 18
                    pushl $0
                    pushl %edi
                    movl $18, %edi
# ____________________swap needed_____________________________________
                    movl %edi, 4(%esp)
                    popl %edi
                    popl %esi
                  cmpl $0, %edi
                  jne .L23
                  movl $7, %eax
                  jmp .ERROR_EXIT
.L23:
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
                jne .L24
                movl $7, %eax
                jmp .ERROR_EXIT
.L24:
                pushl %edi
                pushl %esi
                popl %eax
                popl %ebx
                cltd
                idivl %ebx
                movl %eax, %esi
                # Emitting ((3 * 4) / (2 * 3))
                pushl $0
                pushl %esi
                  # Emitting (2 * 3)
                    # Emitting 3
                    movl $3, %esi
                    # Emitting 2
                    pushl $0
                    pushl %esi
                    movl $2, %esi
# ____________________swap needed_____________________________________
                    movl %esi, 4(%esp)
                    popl %esi
                    popl %edi
                  imul %esi, %edi
                  # Emitting (3 * 4)
                  pushl $0
                  pushl %edi
                    # Emitting 4
                    movl $4, %edi
                    # Emitting 3
                    pushl $0
                    pushl %edi
                    movl $3, %edi
# ____________________swap needed_____________________________________
                    movl %edi, 4(%esp)
                    popl %edi
                    popl %esi
                  imul %edi, %esi
                  popl %edi
                  addl $4, %esp
                cmpl $0, %edi
                jne .L25
                movl $7, %eax
                jmp .ERROR_EXIT
.L25:
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
              jne .L26
              movl $7, %eax
              jmp .ERROR_EXIT
.L26:
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
            jne .L27
            movl $7, %eax
            jmp .ERROR_EXIT
.L27:
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
          cmpl $0, %edi
          jne .L28
          movl $7, %eax
          jmp .ERROR_EXIT
.L28:
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
    addl $12, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
