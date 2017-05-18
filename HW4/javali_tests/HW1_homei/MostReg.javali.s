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
    # variable d
    pushl $0
      # Emitting (...)
        # Emitting a = (((((1000 * a) + b) + (c + d)) * ((a + b) + (c + d))) + (((a + b) + (c + d)) * ((a + b) + (c + d))))
# ________assign______________________________________________________
          # Emitting (((((1000 * a) + b) + (c + d)) * ((a + b) + (c + d))) + (((a + b) + (c + d)) * ((a + b) + (c + d))))
            # Emitting (((a + b) + (c + d)) * ((a + b) + (c + d)))
              # Emitting ((a + b) + (c + d))
                # Emitting (c + d)
                  # Emitting d
# __________________var_______________________________________________
                  movl -16(%ebp), %edi
                  # Emitting c
                  pushl $0
                  pushl %edi
# __________________var_______________________________________________
                  movl -12(%ebp), %edi
# __________________swap needed_______________________________________
                  movl %edi, 4(%esp)
                  popl %edi
                  popl %esi
                add %edi, %esi
                # Emitting (a + b)
                pushl $0
                pushl %esi
                  # Emitting b
# __________________var_______________________________________________
                  movl -8(%ebp), %esi
                  # Emitting a
                  pushl $0
                  pushl %esi
# __________________var_______________________________________________
                  movl -4(%ebp), %esi
# __________________swap needed_______________________________________
                  movl %esi, 4(%esp)
                  popl %esi
                  popl %edi
                add %esi, %edi
                popl %esi
                addl $4, %esp
              add %esi, %edi
              # Emitting ((a + b) + (c + d))
              pushl $0
              pushl %edi
                # Emitting (c + d)
                  # Emitting d
# __________________var_______________________________________________
                  movl -16(%ebp), %edi
                  # Emitting c
                  pushl $0
                  pushl %edi
# __________________var_______________________________________________
                  movl -12(%ebp), %edi
# __________________swap needed_______________________________________
                  movl %edi, 4(%esp)
                  popl %edi
                  popl %esi
                add %edi, %esi
                # Emitting (a + b)
                pushl $0
                pushl %esi
                  # Emitting b
# __________________var_______________________________________________
                  movl -8(%ebp), %esi
                  # Emitting a
                  pushl $0
                  pushl %esi
# __________________var_______________________________________________
                  movl -4(%ebp), %esi
# __________________swap needed_______________________________________
                  movl %esi, 4(%esp)
                  popl %esi
                  popl %edi
                add %esi, %edi
                popl %esi
                addl $4, %esp
              add %esi, %edi
# ______________swap needed___________________________________________
              movl %edi, 4(%esp)
              popl %edi
              popl %esi
            imul %edi, %esi
            # Emitting ((((1000 * a) + b) + (c + d)) * ((a + b) + (c + d)))
            pushl $0
            pushl %esi
              # Emitting ((a + b) + (c + d))
                # Emitting (c + d)
                  # Emitting d
# __________________var_______________________________________________
                  movl -16(%ebp), %esi
                  # Emitting c
                  pushl $0
                  pushl %esi
# __________________var_______________________________________________
                  movl -12(%ebp), %esi
# __________________swap needed_______________________________________
                  movl %esi, 4(%esp)
                  popl %esi
                  popl %edi
                add %esi, %edi
                # Emitting (a + b)
                pushl $0
                pushl %edi
                  # Emitting b
# __________________var_______________________________________________
                  movl -8(%ebp), %edi
                  # Emitting a
                  pushl $0
                  pushl %edi
# __________________var_______________________________________________
                  movl -4(%ebp), %edi
# __________________swap needed_______________________________________
                  movl %edi, 4(%esp)
                  popl %edi
                  popl %esi
                add %edi, %esi
                popl %edi
                addl $4, %esp
              add %edi, %esi
              # Emitting (((1000 * a) + b) + (c + d))
              pushl $0
              pushl %esi
                # Emitting (c + d)
                  # Emitting d
# __________________var_______________________________________________
                  movl -16(%ebp), %esi
                  # Emitting c
                  pushl $0
                  pushl %esi
# __________________var_______________________________________________
                  movl -12(%ebp), %esi
# __________________swap needed_______________________________________
                  movl %esi, 4(%esp)
                  popl %esi
                  popl %edi
                add %esi, %edi
                # Emitting ((1000 * a) + b)
                pushl $0
                pushl %edi
                  # Emitting (1000 * a)
                    # Emitting a
# ____________________var_____________________________________________
                    movl -4(%ebp), %edi
                    # Emitting 1000
                    pushl $0
                    pushl %edi
                    movl $1000, %edi
# ____________________swap needed_____________________________________
                    movl %edi, 4(%esp)
                    popl %edi
                    popl %esi
                  imul %edi, %esi
                  # Emitting b
                  pushl $0
                  pushl %esi
# __________________var_______________________________________________
                  movl -8(%ebp), %esi
# __________________swap needed_______________________________________
                  movl %esi, 4(%esp)
                  popl %esi
                  popl %edi
                add %edi, %esi
                popl %edi
                addl $4, %esp
              add %edi, %esi
# ______________swap needed___________________________________________
              movl %esi, 4(%esp)
              popl %esi
              popl %edi
            imul %esi, %edi
            popl %esi
            addl $4, %esp
          add %esi, %edi
        movl %edi, -4(%ebp)
        # Emitting b = ((((a + b) + (c + d)) * ((a + b) + (c + d))) + (((a + b) + (c + d)) * ((a + b) + (c + d))))
# ________assign______________________________________________________
          # Emitting ((((a + b) + (c + d)) * ((a + b) + (c + d))) + (((a + b) + (c + d)) * ((a + b) + (c + d))))
            # Emitting (((a + b) + (c + d)) * ((a + b) + (c + d)))
              # Emitting ((a + b) + (c + d))
                # Emitting (c + d)
                  # Emitting d
# __________________var_______________________________________________
                  movl -16(%ebp), %edi
                  # Emitting c
                  pushl $0
                  pushl %edi
# __________________var_______________________________________________
                  movl -12(%ebp), %edi
# __________________swap needed_______________________________________
                  movl %edi, 4(%esp)
                  popl %edi
                  popl %esi
                add %edi, %esi
                # Emitting (a + b)
                pushl $0
                pushl %esi
                  # Emitting b
# __________________var_______________________________________________
                  movl -8(%ebp), %esi
                  # Emitting a
                  pushl $0
                  pushl %esi
# __________________var_______________________________________________
                  movl -4(%ebp), %esi
# __________________swap needed_______________________________________
                  movl %esi, 4(%esp)
                  popl %esi
                  popl %edi
                add %esi, %edi
                popl %esi
                addl $4, %esp
              add %esi, %edi
              # Emitting ((a + b) + (c + d))
              pushl $0
              pushl %edi
                # Emitting (c + d)
                  # Emitting d
# __________________var_______________________________________________
                  movl -16(%ebp), %edi
                  # Emitting c
                  pushl $0
                  pushl %edi
# __________________var_______________________________________________
                  movl -12(%ebp), %edi
# __________________swap needed_______________________________________
                  movl %edi, 4(%esp)
                  popl %edi
                  popl %esi
                add %edi, %esi
                # Emitting (a + b)
                pushl $0
                pushl %esi
                  # Emitting b
# __________________var_______________________________________________
                  movl -8(%ebp), %esi
                  # Emitting a
                  pushl $0
                  pushl %esi
# __________________var_______________________________________________
                  movl -4(%ebp), %esi
# __________________swap needed_______________________________________
                  movl %esi, 4(%esp)
                  popl %esi
                  popl %edi
                add %esi, %edi
                popl %esi
                addl $4, %esp
              add %esi, %edi
# ______________swap needed___________________________________________
              movl %edi, 4(%esp)
              popl %edi
              popl %esi
            imul %edi, %esi
            # Emitting (((a + b) + (c + d)) * ((a + b) + (c + d)))
            pushl $0
            pushl %esi
              # Emitting ((a + b) + (c + d))
                # Emitting (c + d)
                  # Emitting d
# __________________var_______________________________________________
                  movl -16(%ebp), %esi
                  # Emitting c
                  pushl $0
                  pushl %esi
# __________________var_______________________________________________
                  movl -12(%ebp), %esi
# __________________swap needed_______________________________________
                  movl %esi, 4(%esp)
                  popl %esi
                  popl %edi
                add %esi, %edi
                # Emitting (a + b)
                pushl $0
                pushl %edi
                  # Emitting b
# __________________var_______________________________________________
                  movl -8(%ebp), %edi
                  # Emitting a
                  pushl $0
                  pushl %edi
# __________________var_______________________________________________
                  movl -4(%ebp), %edi
# __________________swap needed_______________________________________
                  movl %edi, 4(%esp)
                  popl %edi
                  popl %esi
                add %edi, %esi
                popl %edi
                addl $4, %esp
              add %edi, %esi
              # Emitting ((a + b) + (c + d))
              pushl $0
              pushl %esi
                # Emitting (c + d)
                  # Emitting d
# __________________var_______________________________________________
                  movl -16(%ebp), %esi
                  # Emitting c
                  pushl $0
                  pushl %esi
# __________________var_______________________________________________
                  movl -12(%ebp), %esi
# __________________swap needed_______________________________________
                  movl %esi, 4(%esp)
                  popl %esi
                  popl %edi
                add %esi, %edi
                # Emitting (a + b)
                pushl $0
                pushl %edi
                  # Emitting b
# __________________var_______________________________________________
                  movl -8(%ebp), %edi
                  # Emitting a
                  pushl $0
                  pushl %edi
# __________________var_______________________________________________
                  movl -4(%ebp), %edi
# __________________swap needed_______________________________________
                  movl %edi, 4(%esp)
                  popl %edi
                  popl %esi
                add %edi, %esi
                popl %edi
                addl $4, %esp
              add %edi, %esi
# ______________swap needed___________________________________________
              movl %esi, 4(%esp)
              popl %esi
              popl %edi
            imul %esi, %edi
            popl %esi
            addl $4, %esp
          add %esi, %edi
        movl %edi, -8(%ebp)
        # Emitting c = ((((a + b) + (c + d)) * ((a + b) + (c + d))) + (((a + b) + (c + d)) * ((a + b) + (c + d))))
# ________assign______________________________________________________
          # Emitting ((((a + b) + (c + d)) * ((a + b) + (c + d))) + (((a + b) + (c + d)) * ((a + b) + (c + d))))
            # Emitting (((a + b) + (c + d)) * ((a + b) + (c + d)))
              # Emitting ((a + b) + (c + d))
                # Emitting (c + d)
                  # Emitting d
# __________________var_______________________________________________
                  movl -16(%ebp), %edi
                  # Emitting c
                  pushl $0
                  pushl %edi
# __________________var_______________________________________________
                  movl -12(%ebp), %edi
# __________________swap needed_______________________________________
                  movl %edi, 4(%esp)
                  popl %edi
                  popl %esi
                add %edi, %esi
                # Emitting (a + b)
                pushl $0
                pushl %esi
                  # Emitting b
# __________________var_______________________________________________
                  movl -8(%ebp), %esi
                  # Emitting a
                  pushl $0
                  pushl %esi
# __________________var_______________________________________________
                  movl -4(%ebp), %esi
# __________________swap needed_______________________________________
                  movl %esi, 4(%esp)
                  popl %esi
                  popl %edi
                add %esi, %edi
                popl %esi
                addl $4, %esp
              add %esi, %edi
              # Emitting ((a + b) + (c + d))
              pushl $0
              pushl %edi
                # Emitting (c + d)
                  # Emitting d
# __________________var_______________________________________________
                  movl -16(%ebp), %edi
                  # Emitting c
                  pushl $0
                  pushl %edi
# __________________var_______________________________________________
                  movl -12(%ebp), %edi
# __________________swap needed_______________________________________
                  movl %edi, 4(%esp)
                  popl %edi
                  popl %esi
                add %edi, %esi
                # Emitting (a + b)
                pushl $0
                pushl %esi
                  # Emitting b
# __________________var_______________________________________________
                  movl -8(%ebp), %esi
                  # Emitting a
                  pushl $0
                  pushl %esi
# __________________var_______________________________________________
                  movl -4(%ebp), %esi
# __________________swap needed_______________________________________
                  movl %esi, 4(%esp)
                  popl %esi
                  popl %edi
                add %esi, %edi
                popl %esi
                addl $4, %esp
              add %esi, %edi
# ______________swap needed___________________________________________
              movl %edi, 4(%esp)
              popl %edi
              popl %esi
            imul %edi, %esi
            # Emitting (((a + b) + (c + d)) * ((a + b) + (c + d)))
            pushl $0
            pushl %esi
              # Emitting ((a + b) + (c + d))
                # Emitting (c + d)
                  # Emitting d
# __________________var_______________________________________________
                  movl -16(%ebp), %esi
                  # Emitting c
                  pushl $0
                  pushl %esi
# __________________var_______________________________________________
                  movl -12(%ebp), %esi
# __________________swap needed_______________________________________
                  movl %esi, 4(%esp)
                  popl %esi
                  popl %edi
                add %esi, %edi
                # Emitting (a + b)
                pushl $0
                pushl %edi
                  # Emitting b
# __________________var_______________________________________________
                  movl -8(%ebp), %edi
                  # Emitting a
                  pushl $0
                  pushl %edi
# __________________var_______________________________________________
                  movl -4(%ebp), %edi
# __________________swap needed_______________________________________
                  movl %edi, 4(%esp)
                  popl %edi
                  popl %esi
                add %edi, %esi
                popl %edi
                addl $4, %esp
              add %edi, %esi
              # Emitting ((a + b) + (c + d))
              pushl $0
              pushl %esi
                # Emitting (c + d)
                  # Emitting d
# __________________var_______________________________________________
                  movl -16(%ebp), %esi
                  # Emitting c
                  pushl $0
                  pushl %esi
# __________________var_______________________________________________
                  movl -12(%ebp), %esi
# __________________swap needed_______________________________________
                  movl %esi, 4(%esp)
                  popl %esi
                  popl %edi
                add %esi, %edi
                # Emitting (a + b)
                pushl $0
                pushl %edi
                  # Emitting b
# __________________var_______________________________________________
                  movl -8(%ebp), %edi
                  # Emitting a
                  pushl $0
                  pushl %edi
# __________________var_______________________________________________
                  movl -4(%ebp), %edi
# __________________swap needed_______________________________________
                  movl %edi, 4(%esp)
                  popl %edi
                  popl %esi
                add %edi, %esi
                popl %edi
                addl $4, %esp
              add %edi, %esi
# ______________swap needed___________________________________________
              movl %esi, 4(%esp)
              popl %esi
              popl %edi
            imul %esi, %edi
            popl %esi
            addl $4, %esp
          add %esi, %edi
        movl %edi, -12(%ebp)
        # Emitting d = ((((a + b) + (c + d)) * ((a + b) + (c + d))) + (((a + b) + (c + d)) * ((a + b) + (c + d))))
# ________assign______________________________________________________
          # Emitting ((((a + b) + (c + d)) * ((a + b) + (c + d))) + (((a + b) + (c + d)) * ((a + b) + (c + d))))
            # Emitting (((a + b) + (c + d)) * ((a + b) + (c + d)))
              # Emitting ((a + b) + (c + d))
                # Emitting (c + d)
                  # Emitting d
# __________________var_______________________________________________
                  movl -16(%ebp), %edi
                  # Emitting c
                  pushl $0
                  pushl %edi
# __________________var_______________________________________________
                  movl -12(%ebp), %edi
# __________________swap needed_______________________________________
                  movl %edi, 4(%esp)
                  popl %edi
                  popl %esi
                add %edi, %esi
                # Emitting (a + b)
                pushl $0
                pushl %esi
                  # Emitting b
# __________________var_______________________________________________
                  movl -8(%ebp), %esi
                  # Emitting a
                  pushl $0
                  pushl %esi
# __________________var_______________________________________________
                  movl -4(%ebp), %esi
# __________________swap needed_______________________________________
                  movl %esi, 4(%esp)
                  popl %esi
                  popl %edi
                add %esi, %edi
                popl %esi
                addl $4, %esp
              add %esi, %edi
              # Emitting ((a + b) + (c + d))
              pushl $0
              pushl %edi
                # Emitting (c + d)
                  # Emitting d
# __________________var_______________________________________________
                  movl -16(%ebp), %edi
                  # Emitting c
                  pushl $0
                  pushl %edi
# __________________var_______________________________________________
                  movl -12(%ebp), %edi
# __________________swap needed_______________________________________
                  movl %edi, 4(%esp)
                  popl %edi
                  popl %esi
                add %edi, %esi
                # Emitting (a + b)
                pushl $0
                pushl %esi
                  # Emitting b
# __________________var_______________________________________________
                  movl -8(%ebp), %esi
                  # Emitting a
                  pushl $0
                  pushl %esi
# __________________var_______________________________________________
                  movl -4(%ebp), %esi
# __________________swap needed_______________________________________
                  movl %esi, 4(%esp)
                  popl %esi
                  popl %edi
                add %esi, %edi
                popl %esi
                addl $4, %esp
              add %esi, %edi
# ______________swap needed___________________________________________
              movl %edi, 4(%esp)
              popl %edi
              popl %esi
            imul %edi, %esi
            # Emitting (((a + b) + (c + d)) * ((a + b) + (c + d)))
            pushl $0
            pushl %esi
              # Emitting ((a + b) + (c + d))
                # Emitting (c + d)
                  # Emitting d
# __________________var_______________________________________________
                  movl -16(%ebp), %esi
                  # Emitting c
                  pushl $0
                  pushl %esi
# __________________var_______________________________________________
                  movl -12(%ebp), %esi
# __________________swap needed_______________________________________
                  movl %esi, 4(%esp)
                  popl %esi
                  popl %edi
                add %esi, %edi
                # Emitting (a + b)
                pushl $0
                pushl %edi
                  # Emitting b
# __________________var_______________________________________________
                  movl -8(%ebp), %edi
                  # Emitting a
                  pushl $0
                  pushl %edi
# __________________var_______________________________________________
                  movl -4(%ebp), %edi
# __________________swap needed_______________________________________
                  movl %edi, 4(%esp)
                  popl %edi
                  popl %esi
                add %edi, %esi
                popl %edi
                addl $4, %esp
              add %edi, %esi
              # Emitting ((a + b) + (c + d))
              pushl $0
              pushl %esi
                # Emitting (c + d)
                  # Emitting d
# __________________var_______________________________________________
                  movl -16(%ebp), %esi
                  # Emitting c
                  pushl $0
                  pushl %esi
# __________________var_______________________________________________
                  movl -12(%ebp), %esi
# __________________swap needed_______________________________________
                  movl %esi, 4(%esp)
                  popl %esi
                  popl %edi
                add %esi, %edi
                # Emitting (a + b)
                pushl $0
                pushl %edi
                  # Emitting b
# __________________var_______________________________________________
                  movl -8(%ebp), %edi
                  # Emitting a
                  pushl $0
                  pushl %edi
# __________________var_______________________________________________
                  movl -4(%ebp), %edi
# __________________swap needed_______________________________________
                  movl %edi, 4(%esp)
                  popl %edi
                  popl %esi
                add %edi, %esi
                popl %edi
                addl $4, %esp
              add %edi, %esi
# ______________swap needed___________________________________________
              movl %esi, 4(%esp)
              popl %esi
              popl %edi
            imul %esi, %edi
            popl %esi
            addl $4, %esp
          add %esi, %edi
        movl %edi, -16(%ebp)
        # Emitting write(((a * b) + (c * d)))
          # Emitting ((a * b) + (c * d))
            # Emitting (c * d)
              # Emitting d
# ______________var___________________________________________________
              movl -16(%ebp), %edi
              # Emitting c
              pushl $0
              pushl %edi
# ______________var___________________________________________________
              movl -12(%ebp), %edi
# ______________swap needed___________________________________________
              movl %edi, 4(%esp)
              popl %edi
              popl %esi
            imul %edi, %esi
            # Emitting (a * b)
            pushl $0
            pushl %esi
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
            imul %esi, %edi
            popl %esi
            addl $4, %esp
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
        # Emitting write((c * 0))
          # Emitting (c * 0)
            # Emitting 0
            movl $0, %edi
            # Emitting c
            pushl $0
            pushl %edi
# ____________var_____________________________________________________
            movl -12(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          imul %edi, %esi
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
    addl $16, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
