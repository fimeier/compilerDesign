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
    # Emitting int g
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
    # set local variables:
      # Emitting (...)
        # Emitting g = 1
          # Emitting 1
          movl $1, %edi
        movl 8(%ebp), %esi
        movl %edi, 4(%esi)
        # Emitting b = true
          # Emitting true
          movl $1, %edi
        movl %edi, -16(%ebp)
        # Emitting a = g
          # Emitting g
          movl 8(%ebp), %edi
          movl 4(%edi), %edi
        movl %edi, -20(%ebp)
        # Emitting c = a
          # Emitting a
          movl -20(%ebp), %edi
        movl %edi, -24(%ebp)
        # Emitting write(a)
          # Emitting a
          movl -20(%ebp), %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
    # method suffix
    movl $0, %eax
    leave
    ret