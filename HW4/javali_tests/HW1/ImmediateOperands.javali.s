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
    # variable i0
    pushl $0
      # Emitting (...)
        # Emitting i0 = 0
# ________assign______________________________________________________
          # Emitting 0
          movl $0, %edi
        movl %edi, -4(%ebp)
        # Emitting i0 = (5 + i0)
# ________assign______________________________________________________
          # Emitting (5 + i0)
            # Emitting i0
# ____________var_____________________________________________________
            movl -4(%ebp), %edi
            # Emitting 5
            pushl $0
            pushl %edi
            movl $5, %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          add %edi, %esi
        movl %esi, -4(%ebp)
        # Emitting write(i0)
          # Emitting i0
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
        # Emitting i0 = (i0 + 5)
# ________assign______________________________________________________
          # Emitting (i0 + 5)
            # Emitting 5
            movl $5, %esi
            # Emitting i0
            pushl $0
            pushl %esi
# ____________var_____________________________________________________
            movl -4(%ebp), %esi
# ____________swap needed_____________________________________________
            movl %esi, 4(%esp)
            popl %esi
            popl %edi
          add %esi, %edi
        movl %edi, -4(%ebp)
        # Emitting write(i0)
          # Emitting i0
# __________var_______________________________________________________
          movl -4(%ebp), %edi
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
        # Emitting i0 = ((i0 + 5) + 3)
# ________assign______________________________________________________
          # Emitting ((i0 + 5) + 3)
            # Emitting (i0 + 5)
              # Emitting 5
              movl $5, %edi
              # Emitting i0
              pushl $0
              pushl %edi
# ______________var___________________________________________________
              movl -4(%ebp), %edi
# ______________swap needed___________________________________________
              movl %edi, 4(%esp)
              popl %edi
              popl %esi
            add %edi, %esi
            # Emitting 3
            pushl $0
            pushl %esi
            movl $3, %esi
# ____________swap needed_____________________________________________
            movl %esi, 4(%esp)
            popl %esi
            popl %edi
          add %edi, %esi
        movl %esi, -4(%ebp)
        # Emitting write(i0)
          # Emitting i0
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
    addl $4, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
