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
    # variable r0
    pushl $0
    # variable r1
    pushl $0
      # Emitting (...)
        # Emitting r0 = (((4 + 5) + (3 - 2)) + ((3 - 1) + (7 + 8)))
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
        # Emitting write(r0)
          # Emitting r0
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
        # Emitting r1 = ((9 - 1) + (6 + 6))
# ________assign______________________________________________________
          # Emitting ((9 - 1) + (6 + 6))
            # Emitting (6 + 6)
              # Emitting 6
              movl $6, %esi
              # Emitting 6
              pushl $0
              pushl %esi
              movl $6, %esi
# ______________swap needed___________________________________________
              movl %esi, 4(%esp)
              popl %esi
              popl %edi
            add %esi, %edi
            # Emitting (9 - 1)
            pushl $0
            pushl %edi
              # Emitting 1
              movl $1, %edi
              # Emitting 9
              pushl $0
              pushl %edi
              movl $9, %edi
# ______________swap needed___________________________________________
              movl %edi, 4(%esp)
              popl %edi
              popl %esi
            sub %edi, %esi
            popl %edi
            addl $4, %esp
          add %edi, %esi
        movl %esi, -8(%ebp)
        # Emitting write(r1)
          # Emitting r1
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
    addl $8, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
