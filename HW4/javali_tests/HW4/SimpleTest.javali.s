.section .data
	vtable_Object:
		.int 0
	vtable_Main:
		.int vtable_Object
		.int Main_main
	STR_NL:
		.string "\n"
	STR_D:
		.string "%d"
.section .text
.global main

main:
pushl $4
call malloc
movl $vtable_Main, (%eax)
movl %eax, (%esp)
call Main_main
addl $4, %esp
ret
  # Emitting class Main {...}
    # Emitting void main(...) {...}
Main_main:
    # store old ebp
    pushl %ebp
    # set new ebp
    movl %esp, %ebp
    # save callee-saved registers to stack
    pushl %esi
    pushl %edi
    pushl %ebx
    # set local variables:
    # variable b
    pushl $0
    # variable a
    pushl $0
    # variable c
    pushl $0
      # Emitting (...)
        # Emitting a = 1
          # Emitting a
          movl a, %edi
          # Emitting 1
          movl $1, %esi
        movl %esi, %edi
    # method suffix
    movl $0, %eax
    leave
    ret
