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
pushl %ebp
movl %esp, %ebp
pushl $4
pushl $2
call calloc
addl $8, %esp
movl $vtable_Main, (%eax)
pushl %eax
call Main_main
addl $4, %esp
popl %ebp
ret
  # Emitting class Main {...}
    # Emitting int b
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
    # variable a
    pushl $0
    # set local variables:
      # Emitting (...)
        # Emitting a = 3
          # Emitting 3
          movl $3, %edi
        movl %edi, 
        # Emitting write(a)
          # Emitting a
          movl -16(%ebp), %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
    # method suffix
    movl $0, %eax
    leave
    ret