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
        # Emitting a = 3
# ________assign______________________________________________________
          # Emitting 3
          movl $3, %edi
        movl %edi, -4(%ebp)
        # Emitting b = 1
# ________assign______________________________________________________
          # Emitting 1
          movl $1, %edi
        movl %edi, -8(%ebp)
        # Emitting c = (a == b)
# ________assign______________________________________________________
          # Emitting (a == b)
            # Emitting b
# ____________var_____________________________________________________
            movl -8(%ebp), %edi
            # Emitting a
# ____________var_____________________________________________________
            movl -4(%ebp), %esi
          cmpl %edi, %esi
          je .L2
          movl $0, %esi
          jmp .L3
.L2:
          movl $1, %esi
.L3:
        movl %esi, -12(%ebp)
        # Emitting if (c) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting c
# __________var_______________________________________________________
          movl -12(%ebp), %esi
        cmpl $0, %esi
        je .L4
          # Emitting (...)
            # Emitting write(1)
              # Emitting 1
              movl $1, %esi
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
        jmp .L5
.L4:
          # Emitting (...)
            # Emitting write(0)
              # Emitting 0
              movl $0, %esi
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
.L5:
    addl $12, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
