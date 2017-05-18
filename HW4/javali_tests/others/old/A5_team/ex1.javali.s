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
        # Emitting a = 1
# ________assign______________________________________________________
          # Emitting 1
          movl $1, %edi
        movl %edi, -4(%ebp)
        # Emitting b = 2
# ________assign______________________________________________________
          # Emitting 2
          movl $2, %edi
        movl %edi, -8(%ebp)
        # Emitting if ((4 > 7)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting (4 > 7)
            # Emitting 7
            movl $7, %edi
            # Emitting 4
            movl $4, %esi
          cmpl %edi, %esi
          setg %al
          movzbl %al, %esi
        jle .L3
          # Emitting (...)
            # Emitting b = (a + 3)
# ____________assign__________________________________________________
              # Emitting (a + 3)
                # Emitting 3
                movl $3, %esi
                # Emitting a
# ________________var_________________________________________________
                movl -4(%ebp), %edi
              add %esi, %edi
            movl %edi, -8(%ebp)
        jmp .L4
.L3:
          # Emitting (...)
            # Emitting b = (a + (a * 3))
# ____________assign__________________________________________________
              # Emitting (a + (a * 3))
                # Emitting (a * 3)
                  # Emitting 3
                  movl $3, %edi
                  # Emitting a
# __________________var_______________________________________________
                  movl -4(%ebp), %esi
                imul %edi, %esi
                # Emitting a
# ________________var_________________________________________________
                movl -4(%ebp), %edi
              add %esi, %edi
            movl %edi, -8(%ebp)
.L4:
        # Emitting c = b
# ________assign______________________________________________________
          # Emitting b
# __________var_______________________________________________________
          movl -8(%ebp), %edi
        movl %edi, -12(%ebp)
        # Emitting write(a)
          # Emitting a
# __________var_______________________________________________________
          movl -4(%ebp), %edi
        sub $16, %esp
        movl %edi, 4(%esp)
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
          movl -8(%ebp), %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        # Emitting write(c)
          # Emitting c
# __________var_______________________________________________________
          movl -12(%ebp), %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
    addl $12, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
