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
        # Emitting b = 300
          # Emitting 300
          movl $300, %edi
        movl 8(%ebp), %esi
        movl %edi, 4(%esi)
        # Emitting a = 400
          # Emitting 400
          movl $400, %edi
        movl %edi, -16(%ebp)
        # Emitting if ((a == b)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting (a == b)
            # Emitting b
            movl 8(%ebp), %edi
            movl 4(%edi), %edi
            # Emitting a
            movl -16(%ebp), %esi
          cmpl %edi, %esi
        jne .L2
          # Emitting (...)
            # Emitting write(a)
              # Emitting a
              movl -16(%ebp), %edi
            sub $16, %esp
            movl %edi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
        jmp .L3
.L2:
          # Emitting nop
.L3:
    # method suffix
    movl $0, %eax
    leave
    ret
