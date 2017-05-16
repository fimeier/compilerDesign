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
movl %ebp, %esp
popl %ebp
movl $0, %eax
ret
  # Emitting class Main {...}
    # Emitting int b
    # Emitting void main(...) {...}
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    # variable a
    pushl $0
      # Emitting (...)
        # Emitting b = 300
          # Emitting 300
          movl $300, %edi
        movl 8(%ebp), %esi
        movl %edi, 4(%esi)
        # Emitting a = 200
          # Emitting 200
          movl $200, %edi
        movl %edi, -4(%ebp)
        # Emitting if ((a < b)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting (a < b)
            # Emitting b
            movl 8(%ebp), %edi
            movl 4(%edi), %edi
            # Emitting a
            movl -4(%ebp), %esi
          cmpl %edi, %esi
        jne .L2
          # Emitting (...)
            # Emitting write(a)
              # Emitting a
              movl -4(%ebp), %edi
            sub $16, %esp
            movl %edi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
        jmp .L3
.L2:
          # Emitting (...)
            # Emitting write(666)
              # Emitting 666
              movl $666, %edi
            sub $16, %esp
            movl %edi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
.L3:
    addl $4, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
