.section .data
	vtable_A:
		.int vtable_Object
	vtable_B:
		.int vtable_A
	vtable_Main_array:
		.int vtable_Object
	vtable_A_array:
		.int vtable_Object
	vtable_int_array:
		.int vtable_Object
	vtable_B_array:
		.int vtable_Object
	vtable_Object:
		.int 0
	vtable_Main:
		.int vtable_Object
		.int Main_main
		.int Main_method
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
  # Emitting class A {...}
  # Emitting class B {...}
  # Emitting class Main {...}
    # Emitting void main(...) {...}
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    # Emitting int method(...) {...}
Main_method:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting if (true) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting true
          movl $1, %edi
        cmpl $0, %edi
        je .L2
          # Emitting (...)
            # Emitting return 1
              # Emitting 1
              movl $1, %edi
            movl %edi, 12(%ebp)
        jmp .L3
.L2:
          # Emitting (...)
            # Emitting if (false) {...} else {...}
# ____________ifElse__________________________________________________
              # Emitting false
              movl $0, %edi
            cmpl $0, %edi
            je .L4
              # Emitting (...)
                # Emitting return 1
                  # Emitting 1
                  movl $1, %edi
                movl %edi, 12(%ebp)
            jmp .L5
.L4:
              # Emitting (...)
.L5:
.L3:
        # Emitting return 1
          # Emitting 1
          movl $1, %edi
        movl %edi, 12(%ebp)
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
