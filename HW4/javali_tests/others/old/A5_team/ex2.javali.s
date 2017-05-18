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
        # Emitting a = 1
# ________assign______________________________________________________
          # Emitting 1
          movl $1, %edi
        movl %edi, -4(%ebp)
        # Emitting if ((3 == 3)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting (3 == 3)
            # Emitting 3
            movl $3, %edi
            # Emitting 3
            movl $3, %esi
          cmpl %edi, %esi
          je .L3
          movl $0, %esi
          jmp .L4
.L3:
          movl $1, %esi
.L4:
        jne .L5
          # Emitting (...)
            # Emitting a = 4
# ____________assign__________________________________________________
              # Emitting 4
              movl $4, %esi
            movl %esi, -4(%ebp)
        jmp .L6
.L5:
          # Emitting (...)
            # Emitting a = 5
# ____________assign__________________________________________________
              # Emitting 5
              movl $5, %esi
            movl %esi, -4(%ebp)
.L6:
        # Emitting b = a
# ________assign______________________________________________________
          # Emitting a
# __________var_______________________________________________________
          movl -4(%ebp), %esi
        movl %esi, -8(%ebp)
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
        # Emitting write(b)
          # Emitting b
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
