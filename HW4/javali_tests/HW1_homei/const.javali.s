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
        # Emitting a = 30
# ________assign______________________________________________________
          # Emitting 30
          movl $30, %edi
        movl %edi, -4(%ebp)
        # Emitting b = -(20)
# ________assign______________________________________________________
          # Emitting -(20)
            # Emitting 20
            movl $20, %edi
          negl %edi
        movl %edi, -8(%ebp)
        # Emitting c = 2147483647
# ________assign______________________________________________________
          # Emitting 2147483647
          movl $2147483647, %edi
        movl %edi, -12(%ebp)
        # Emitting d = -(c)
# ________assign______________________________________________________
          # Emitting -(c)
            # Emitting c
# ____________var_____________________________________________________
            movl -12(%ebp), %edi
          negl %edi
        movl %edi, -16(%ebp)
        # Emitting c = +(c)
# ________assign______________________________________________________
          # Emitting +(c)
            # Emitting c
# ____________var_____________________________________________________
            movl -12(%ebp), %edi
        movl %edi, -12(%ebp)
        # Emitting d = (d - 2)
# ________assign______________________________________________________
          # Emitting (d - 2)
            # Emitting 2
            movl $2, %edi
            # Emitting d
# ____________var_____________________________________________________
            movl -16(%ebp), %esi
          sub %edi, %esi
        movl %esi, -16(%ebp)
        # Emitting write(d)
          # Emitting d
# __________var_______________________________________________________
          movl -16(%ebp), %esi
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
        # Emitting write(-(2147483645))
          # Emitting -(2147483645)
            # Emitting 2147483645
            movl $2147483645, %esi
          negl %esi
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
