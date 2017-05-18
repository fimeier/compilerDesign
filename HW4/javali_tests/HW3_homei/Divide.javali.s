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
            # Emitting r2
# ____________var_____________________________________________________
            movl -8(%ebp), %edi
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
        # Emitting r2 = (r1 * r3)
# ________assign______________________________________________________
          # Emitting (r1 * r3)
            # Emitting r3
# ____________var_____________________________________________________
            movl -12(%ebp), %edi
            # Emitting r1
# ____________var_____________________________________________________
            movl -4(%ebp), %esi
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
                movl $9, %edi
              add %esi, %edi
              # Emitting (4 + 7)
                # Emitting 7
                movl $7, %esi
                # Emitting 4
                movl $4, %edx
              add %esi, %edx
            add %edi, %edx
            # Emitting ((3 * 4) / (2 * 3))
              # Emitting (2 * 3)
                # Emitting 3
                movl $3, %edi
                # Emitting 2
                movl $2, %esi
              imul %edi, %esi
              # Emitting (3 * 4)
                # Emitting 4
                movl $4, %edi
                # Emitting 3
                movl $3, %ecx
              imul %edi, %ecx
            pushl %edx
            cmpl $0, %esi
            jne .L5
            movl $7, %eax
            jmp .ERROR_EXIT
.L5:
            pushl %esi
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
        # Emitting write((((((3 * 4) / (2 * 3)) / ((18 / 4) / (13 / 9))) / (((17 * 12) / (2 * 3)) / ((18 / 4) / (13 / 9)))) / ((((700 * 4) / (2 * 3)) / ((18 / 4) / (13 / 9))) / (((17 * 12) / (2 * 3)) / ((18 / 4) / (13 / 9))))))
          # Emitting (((((3 * 4) / (2 * 3)) / ((18 / 4) / (13 / 9))) / (((17 * 12) / (2 * 3)) / ((18 / 4) / (13 / 9)))) / ((((700 * 4) / (2 * 3)) / ((18 / 4) / (13 / 9))) / (((17 * 12) / (2 * 3)) / ((18 / 4) / (13 / 9)))))
            # Emitting ((((700 * 4) / (2 * 3)) / ((18 / 4) / (13 / 9))) / (((17 * 12) / (2 * 3)) / ((18 / 4) / (13 / 9))))
              # Emitting (((17 * 12) / (2 * 3)) / ((18 / 4) / (13 / 9)))
                # Emitting ((18 / 4) / (13 / 9))
                  # Emitting (13 / 9)
                    # Emitting 9
                    movl $9, %ecx
                    # Emitting 13
                    movl $13, %edx
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
                  # Emitting (18 / 4)
                    # Emitting 4
                    movl $4, %ecx
                    # Emitting 18
                    movl $18, %esi
                  pushl %edx
                  cmpl $0, %ecx
                  jne .L7
                  movl $7, %eax
                  jmp .ERROR_EXIT
.L7:
                  pushl %ecx
                  pushl %esi
                  popl %eax
                  popl %ebx
                  cltd
                  idivl %ebx
                  movl %eax, %esi
                  popl %edx
                cmpl $0, %edx
                jne .L8
                movl $7, %eax
                jmp .ERROR_EXIT
.L8:
                pushl %edx
                pushl %esi
                popl %eax
                popl %ebx
                cltd
                idivl %ebx
                movl %eax, %esi
                # Emitting ((17 * 12) / (2 * 3))
                  # Emitting (2 * 3)
                    # Emitting 3
                    movl $3, %edx
                    # Emitting 2
                    movl $2, %ecx
                  imul %edx, %ecx
                  # Emitting (17 * 12)
                    # Emitting 12
                    movl $12, %edx
                    # Emitting 17
                    movl $17, %edi
                  imul %edx, %edi
                cmpl $0, %ecx
                jne .L9
                movl $7, %eax
                jmp .ERROR_EXIT
.L9:
                pushl %ecx
                pushl %edi
                popl %eax
                popl %ebx
                cltd
                idivl %ebx
                movl %eax, %edi
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
              # Emitting (((700 * 4) / (2 * 3)) / ((18 / 4) / (13 / 9)))
                # Emitting ((18 / 4) / (13 / 9))
                  # Emitting (13 / 9)
                    # Emitting 9
                    movl $9, %esi
                    # Emitting 13
                    movl $13, %ecx
                  cmpl $0, %esi
                  jne .L11
                  movl $7, %eax
                  jmp .ERROR_EXIT
.L11:
                  pushl %esi
                  pushl %ecx
                  popl %eax
                  popl %ebx
                  cltd
                  idivl %ebx
                  movl %eax, %ecx
                  # Emitting (18 / 4)
                    # Emitting 4
                    movl $4, %esi
                    # Emitting 18
                    movl $18, %edx
                  cmpl $0, %esi
                  jne .L12
                  movl $7, %eax
                  jmp .ERROR_EXIT
.L12:
                  pushl %esi
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
                # Emitting ((700 * 4) / (2 * 3))
                  # Emitting (2 * 3)
                    # Emitting 3
                    movl $3, %ecx
                    # Emitting 2
                    movl $2, %esi
                  imul %ecx, %esi
                  # Emitting (700 * 4)
                    # Emitting 4
                    movl $4, %ecx
                    # Emitting 700
                    movl $700, %ebx
                  imul %ecx, %ebx
                pushl %edx
                cmpl $0, %esi
                jne .L14
                movl $7, %eax
                jmp .ERROR_EXIT
.L14:
                pushl %esi
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
            cmpl $0, %edi
            jne .L16
            movl $7, %eax
            jmp .ERROR_EXIT
.L16:
            pushl %edi
            pushl %ebx
            popl %eax
            popl %ebx
            cltd
            idivl %ebx
            movl %eax, %ebx
            # Emitting ((((3 * 4) / (2 * 3)) / ((18 / 4) / (13 / 9))) / (((17 * 12) / (2 * 3)) / ((18 / 4) / (13 / 9))))
              # Emitting (((17 * 12) / (2 * 3)) / ((18 / 4) / (13 / 9)))
                # Emitting ((18 / 4) / (13 / 9))
                  # Emitting (13 / 9)
                    # Emitting 9
                    movl $9, %edi
                    # Emitting 13
                    movl $13, %edx
                  pushl %ebx
                  cmpl $0, %edi
                  jne .L17
                  movl $7, %eax
                  jmp .ERROR_EXIT
.L17:
                  pushl %edi
                  pushl %edx
                  popl %eax
                  popl %ebx
                  cltd
                  idivl %ebx
                  movl %eax, %edx
                  popl %ebx
                  # Emitting (18 / 4)
                    # Emitting 4
                    movl $4, %edi
                    # Emitting 18
                    movl $18, %esi
                  pushl %ebx
                  pushl %edx
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
                  popl %edx
                  popl %ebx
                pushl %ebx
                cmpl $0, %edx
                jne .L19
                movl $7, %eax
                jmp .ERROR_EXIT
.L19:
                pushl %edx
                pushl %esi
                popl %eax
                popl %ebx
                cltd
                idivl %ebx
                movl %eax, %esi
                popl %ebx
                # Emitting ((17 * 12) / (2 * 3))
                  # Emitting (2 * 3)
                    # Emitting 3
                    movl $3, %edx
                    # Emitting 2
                    movl $2, %edi
                  imul %edx, %edi
                  # Emitting (17 * 12)
                    # Emitting 12
                    movl $12, %edx
                    # Emitting 17
                    movl $17, %ecx
                  imul %edx, %ecx
                pushl %ebx
                cmpl $0, %edi
                jne .L20
                movl $7, %eax
                jmp .ERROR_EXIT
.L20:
                pushl %edi
                pushl %ecx
                popl %eax
                popl %ebx
                cltd
                idivl %ebx
                movl %eax, %ecx
                popl %ebx
              pushl %ebx
              cmpl $0, %esi
              jne .L21
              movl $7, %eax
              jmp .ERROR_EXIT
.L21:
              pushl %esi
              pushl %ecx
              popl %eax
              popl %ebx
              cltd
              idivl %ebx
              movl %eax, %ecx
              popl %ebx
              # Emitting (((3 * 4) / (2 * 3)) / ((18 / 4) / (13 / 9)))
                # Emitting ((18 / 4) / (13 / 9))
                  # Emitting (13 / 9)
                    # Emitting 9
                    movl $9, %esi
                    # Emitting 13
                    movl $13, %edi
                  pushl %ebx
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
                  popl %ebx
                  # Emitting (18 / 4)
                    # Emitting 4
                    movl $4, %esi
                    # Emitting 18
                    movl $18, %edx
                  pushl %ebx
                  cmpl $0, %esi
                  jne .L23
                  movl $7, %eax
                  jmp .ERROR_EXIT
.L23:
                  pushl %esi
                  pushl %edx
                  popl %eax
                  popl %ebx
                  cltd
                  idivl %ebx
                  movl %eax, %edx
                  popl %ebx
                pushl %ebx
                cmpl $0, %edi
                jne .L24
                movl $7, %eax
                jmp .ERROR_EXIT
.L24:
                pushl %edi
                pushl %edx
                popl %eax
                popl %ebx
                cltd
                idivl %ebx
                movl %eax, %edx
                popl %ebx
                # Emitting ((3 * 4) / (2 * 3))
                  # Emitting (2 * 3)
                    # Emitting 3
                    movl $3, %edi
                    # Emitting 2
                    movl $2, %esi
                  imul %edi, %esi
                  # Emitting (3 * 4)
                    # Emitting 4
                    movl $4, %edi
                    # Emitting 3
                    movl $3, %eax
                  imul %edi, %eax
                pushl %ebx
                pushl %edx
                cmpl $0, %esi
                jne .L25
                movl $7, %eax
                jmp .ERROR_EXIT
.L25:
                pushl %esi
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
    addl $12, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
