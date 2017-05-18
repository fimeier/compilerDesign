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
    # variable i0
    pushl $0
    # variable i1
    pushl $0
    # variable i2
    pushl $0
    # variable i3
    pushl $0
    # variable i4
    pushl $0
    # variable i5
    pushl $0
    # variable i6
    pushl $0
    # variable i7
    pushl $0
      # Emitting (...)
        # Emitting i0 = 0
# ________assign______________________________________________________
          # Emitting 0
          movl $0, %edi
        movl %edi, -16(%ebp)
        # Emitting i1 = 1
# ________assign______________________________________________________
          # Emitting 1
          movl $1, %edi
        movl %edi, -20(%ebp)
        # Emitting i2 = 2
# ________assign______________________________________________________
          # Emitting 2
          movl $2, %edi
        movl %edi, -24(%ebp)
        # Emitting i3 = 3
# ________assign______________________________________________________
          # Emitting 3
          movl $3, %edi
        movl %edi, -28(%ebp)
        # Emitting i4 = 4
# ________assign______________________________________________________
          # Emitting 4
          movl $4, %edi
        movl %edi, -32(%ebp)
        # Emitting i5 = 5
# ________assign______________________________________________________
          # Emitting 5
          movl $5, %edi
        movl %edi, -36(%ebp)
        # Emitting i6 = 6
# ________assign______________________________________________________
          # Emitting 6
          movl $6, %edi
        movl %edi, -40(%ebp)
        # Emitting i7 = 7
# ________assign______________________________________________________
          # Emitting 7
          movl $7, %edi
        movl %edi, -44(%ebp)
        # Emitting r1 = (i0 + (i1 + (i2 + (i3 + (i4 + (i5 + (i6 + i7)))))))
# ________assign______________________________________________________
          # Emitting (i0 + (i1 + (i2 + (i3 + (i4 + (i5 + (i6 + i7)))))))
            # Emitting (i1 + (i2 + (i3 + (i4 + (i5 + (i6 + i7))))))
              # Emitting (i2 + (i3 + (i4 + (i5 + (i6 + i7)))))
                # Emitting (i3 + (i4 + (i5 + (i6 + i7))))
                  # Emitting (i4 + (i5 + (i6 + i7)))
                    # Emitting (i5 + (i6 + i7))
                      # Emitting (i6 + i7)
                        # Emitting i7
# ________________________var_________________________________________
                        movl -44(%ebp), %edi
                        # Emitting i6
# ________________________var_________________________________________
                        movl -40(%ebp), %esi
                      add %edi, %esi
                      # Emitting i5
# ______________________var___________________________________________
                      movl -36(%ebp), %edi
                    add %esi, %edi
                    # Emitting i4
# ____________________var_____________________________________________
                    movl -32(%ebp), %esi
                  add %edi, %esi
                  # Emitting i3
# __________________var_______________________________________________
                  movl -28(%ebp), %edi
                add %esi, %edi
                # Emitting i2
# ________________var_________________________________________________
                movl -24(%ebp), %esi
              add %edi, %esi
              # Emitting i1
# ______________var___________________________________________________
              movl -20(%ebp), %edi
            add %esi, %edi
            # Emitting i0
# ____________var_____________________________________________________
            movl -16(%ebp), %esi
          add %edi, %esi
        movl %esi, -4(%ebp)
        # Emitting r2 = (((((((i0 + i1) + i2) + i3) + i4) + i5) + i6) + i7)
# ________assign______________________________________________________
          # Emitting (((((((i0 + i1) + i2) + i3) + i4) + i5) + i6) + i7)
            # Emitting ((((((i0 + i1) + i2) + i3) + i4) + i5) + i6)
              # Emitting (((((i0 + i1) + i2) + i3) + i4) + i5)
                # Emitting ((((i0 + i1) + i2) + i3) + i4)
                  # Emitting (((i0 + i1) + i2) + i3)
                    # Emitting ((i0 + i1) + i2)
                      # Emitting (i0 + i1)
                        # Emitting i1
# ________________________var_________________________________________
                        movl -20(%ebp), %esi
                        # Emitting i0
# ________________________var_________________________________________
                        movl -16(%ebp), %edi
                      add %esi, %edi
                      # Emitting i2
# ______________________var___________________________________________
                      movl -24(%ebp), %esi
                    add %esi, %edi
                    # Emitting i3
# ____________________var_____________________________________________
                    movl -28(%ebp), %esi
                  add %esi, %edi
                  # Emitting i4
# __________________var_______________________________________________
                  movl -32(%ebp), %esi
                add %esi, %edi
                # Emitting i5
# ________________var_________________________________________________
                movl -36(%ebp), %esi
              add %esi, %edi
              # Emitting i6
# ______________var___________________________________________________
              movl -40(%ebp), %esi
            add %esi, %edi
            # Emitting i7
# ____________var_____________________________________________________
            movl -44(%ebp), %esi
          add %esi, %edi
        movl %edi, -8(%ebp)
        # Emitting r3 = (((i0 + i1) + (i2 + i3)) + ((i4 + i5) + (i6 + i7)))
# ________assign______________________________________________________
          # Emitting (((i0 + i1) + (i2 + i3)) + ((i4 + i5) + (i6 + i7)))
            # Emitting ((i4 + i5) + (i6 + i7))
              # Emitting (i6 + i7)
                # Emitting i7
# ________________var_________________________________________________
                movl -44(%ebp), %edi
                # Emitting i6
# ________________var_________________________________________________
                movl -40(%ebp), %esi
              add %edi, %esi
              # Emitting (i4 + i5)
                # Emitting i5
# ________________var_________________________________________________
                movl -36(%ebp), %edi
                # Emitting i4
# ________________var_________________________________________________
                movl -32(%ebp), %edx
              add %edi, %edx
            add %esi, %edx
            # Emitting ((i0 + i1) + (i2 + i3))
              # Emitting (i2 + i3)
                # Emitting i3
# ________________var_________________________________________________
                movl -28(%ebp), %esi
                # Emitting i2
# ________________var_________________________________________________
                movl -24(%ebp), %edi
              add %esi, %edi
              # Emitting (i0 + i1)
                # Emitting i1
# ________________var_________________________________________________
                movl -20(%ebp), %esi
                # Emitting i0
# ________________var_________________________________________________
                movl -16(%ebp), %ecx
              add %esi, %ecx
            add %edi, %ecx
          add %edx, %ecx
        movl %ecx, -12(%ebp)
        # Emitting write(r1)
          # Emitting r1
# __________var_______________________________________________________
          movl -4(%ebp), %ecx
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
        # Emitting write(r2)
          # Emitting r2
# __________var_______________________________________________________
          movl -8(%ebp), %ecx
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
        # Emitting write(r3)
          # Emitting r3
# __________var_______________________________________________________
          movl -12(%ebp), %ecx
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
    addl $44, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
