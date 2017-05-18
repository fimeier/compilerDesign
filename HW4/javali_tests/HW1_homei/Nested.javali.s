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
      # Emitting (...)
        # Emitting a = (((4 + 5) + (3 - 2)) + ((3 - 1) + (7 + 8)))
# ________assign______________________________________________________
          # Emitting (((4 + 5) + (3 - 2)) + ((3 - 1) + (7 + 8)))
            # Emitting ((3 - 1) + (7 + 8))
              # Emitting (7 + 8)
                # Emitting 8
                movl $8, %edi
                # Emitting 7
                pushl $0
                pushl %edi
                movl $7, %edi
# ________________swap needed_________________________________________
                movl %edi, 4(%esp)
                popl %edi
                popl %esi
              add %edi, %esi
              # Emitting (3 - 1)
              pushl $0
              pushl %esi
                # Emitting 1
                movl $1, %esi
                # Emitting 3
                pushl $0
                pushl %esi
                movl $3, %esi
# ________________swap needed_________________________________________
                movl %esi, 4(%esp)
                popl %esi
                popl %edi
              sub %esi, %edi
              popl %esi
              addl $4, %esp
            add %esi, %edi
            # Emitting ((4 + 5) + (3 - 2))
            pushl $0
            pushl %edi
              # Emitting (3 - 2)
                # Emitting 2
                movl $2, %edi
                # Emitting 3
                pushl $0
                pushl %edi
                movl $3, %edi
# ________________swap needed_________________________________________
                movl %edi, 4(%esp)
                popl %edi
                popl %esi
              sub %edi, %esi
              # Emitting (4 + 5)
              pushl $0
              pushl %esi
                # Emitting 5
                movl $5, %esi
                # Emitting 4
                pushl $0
                pushl %esi
                movl $4, %esi
# ________________swap needed_________________________________________
                movl %esi, 4(%esp)
                popl %esi
                popl %edi
              add %esi, %edi
              popl %esi
              addl $4, %esp
            add %esi, %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          add %edi, %esi
        movl %esi, -4(%ebp)
        # Emitting write(a)
          # Emitting a
# __________var_______________________________________________________
          movl -4(%ebp), %esi
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
        # Emitting b = ((8 - 5) + (4 + (7 - 1)))
# ________assign______________________________________________________
          # Emitting ((8 - 5) + (4 + (7 - 1)))
            # Emitting (4 + (7 - 1))
              # Emitting (7 - 1)
                # Emitting 1
                movl $1, %esi
                # Emitting 7
                pushl $0
                pushl %esi
                movl $7, %esi
# ________________swap needed_________________________________________
                movl %esi, 4(%esp)
                popl %esi
                popl %edi
              sub %esi, %edi
              # Emitting 4
              pushl $0
              pushl %edi
              movl $4, %edi
# ______________swap needed___________________________________________
              movl %edi, 4(%esp)
              popl %edi
              popl %esi
            add %edi, %esi
            # Emitting (8 - 5)
            pushl $0
            pushl %esi
              # Emitting 5
              movl $5, %esi
              # Emitting 8
              pushl $0
              pushl %esi
              movl $8, %esi
# ______________swap needed___________________________________________
              movl %esi, 4(%esp)
              popl %esi
              popl %edi
            sub %esi, %edi
            popl %esi
            addl $4, %esp
          add %esi, %edi
        movl %edi, -8(%ebp)
        # Emitting write(((a + b) - a))
          # Emitting ((a + b) - a)
            # Emitting (a + b)
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
            add %edi, %esi
            # Emitting a
            pushl $0
            pushl %esi
# ____________var_____________________________________________________
            movl -4(%ebp), %esi
# ____________swap needed_____________________________________________
            movl %esi, 4(%esp)
            popl %esi
            popl %edi
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
    addl $8, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
