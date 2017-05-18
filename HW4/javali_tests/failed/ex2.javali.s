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
  pushl $0
    # Emitting void main(...) {...}
    pushl $0
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
      pushl $0
        # Emitting a = 1
        pushl $0
# ________assign______________________________________________________
          # Emitting 1
          pushl $0
          movl $1, %edi
          popl %esi
        movl %esi, -4(%ebp)
        addl $4, %esp
        # Emitting if ((3 == 3)) {...} else {...}
        pushl $0
        pushl %edi
# ________ifElse______________________________________________________
          # Emitting (3 == 3)
          pushl $0
            # Emitting 3
            pushl $0
            movl $3, %edi
            popl %esi
            # Emitting 3
            pushl $0
            pushl %esi
            pushl %edi
            movl $3, %edi
# ____________swap needed_____________________________________________
            movl %edi, 8(%esp)
            popl %esi
            popl %edi
            popl %edx
          cmpl %esi, %edx
          je .L3
          movl $0, %edx
          jmp .L4
.L3:
          movl $1, %edx
.L4:
          popl %esi
        jne .L5
          # Emitting (...)
          pushl $0
          pushl %edx
          pushl %edi
            # Emitting a = 4
            pushl $0
# ____________assign__________________________________________________
              # Emitting 4
              pushl $0
              movl $4, %edi
              popl %edx
            movl %edx, -4(%ebp)
            addl $4, %esp
          popl %edx
          popl %edi
          addl $4, %esp
        jmp .L6
.L5:
          # Emitting (...)
          pushl $0
          pushl %edx
          pushl %edi
            # Emitting a = 5
            pushl $0
# ____________assign__________________________________________________
              # Emitting 5
              pushl $0
              movl $5, %edi
              popl %edx
            movl %edx, -4(%ebp)
            addl $4, %esp
          popl %edx
          popl %edi
          addl $4, %esp
.L6:
        popl %edi
        addl $4, %esp
        # Emitting b = a
        pushl $0
        pushl %edx
        pushl %edi
# ________assign______________________________________________________
          # Emitting a
          pushl $0
# __________var_______________________________________________________
          movl -4(%ebp), %edi
          popl %edx
        movl %edx, -8(%ebp)
        popl %edx
        popl %edi
        addl $4, %esp
        # Emitting write(a)
        pushl $0
        pushl %edx
        pushl %edi
          # Emitting a
          pushl $0
# __________var_______________________________________________________
          movl -4(%ebp), %edi
          popl %edx
        sub $16, %esp
        movl %edx, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        popl %edx
        popl %edi
        addl $4, %esp
        # Emitting writeln()
        pushl $0
        pushl %edx
        pushl %edi
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        popl %edx
        popl %edi
        addl $4, %esp
        # Emitting write(b)
        pushl $0
        pushl %edx
        pushl %edi
          # Emitting b
          pushl $0
# __________var_______________________________________________________
          movl -8(%ebp), %edi
          popl %edx
        sub $16, %esp
        movl %edx, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        popl %edx
        popl %edi
        addl $4, %esp
        # Emitting writeln()
        pushl $0
        pushl %edx
        pushl %edi
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        popl %edx
        popl %edi
        addl $4, %esp
      addl $4, %esp
    addl $8, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    addl $4, %esp
  addl $4, %esp
