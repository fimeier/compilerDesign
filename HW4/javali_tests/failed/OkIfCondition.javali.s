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
    # variable b
    pushl $0
      # Emitting (...)
        # Emitting b = true
# ________assign______________________________________________________
          # Emitting true
          movl $1, %edi
        movl %edi, -4(%ebp)
        # Emitting if (!(false)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting !(false)
            # Emitting false
            movl $0, %edi
          negl %edi
          incl %edi
          cmpl $0, %edi
        je .L3
          # Emitting (...)
        jmp .L4
.L3:
          # Emitting nop
.L4:
        # Emitting if ((b == false)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting (b == false)
            # Emitting false
            movl $0, %edi
            # Emitting b
# ____________var_____________________________________________________
            movl -4(%ebp), %esi
          cmpl %edi, %esi
          je .L6
          movl $0, %esi
          jmp .L7
.L6:
          movl $1, %esi
.L7:
        jne .L8
          # Emitting (...)
        jmp .L9
.L8:
          # Emitting nop
.L9:
    addl $4, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
