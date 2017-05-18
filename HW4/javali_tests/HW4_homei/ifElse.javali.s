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
      # Emitting (...)
        # Emitting a = 8
# ________assign______________________________________________________
          # Emitting 8
          movl $8, %edi
        movl %edi, -4(%ebp)
        # Emitting if ((1 < 4)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting (1 < 4)
            # Emitting 4
            movl $4, %edi
            # Emitting 1
            pushl $0
            pushl %edi
            movl $1, %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          cmpl %edi, %esi
          setl %al
          movzbl %al, %esi
        jge .L3
          # Emitting (...)
            # Emitting if ((1 < 7)) {...} else {...}
# ____________ifElse__________________________________________________
              # Emitting (1 < 7)
                # Emitting 7
                movl $7, %esi
                # Emitting 1
                pushl $0
                pushl %esi
                movl $1, %esi
# ________________swap needed_________________________________________
                movl %esi, 4(%esp)
                popl %esi
                popl %edi
              cmpl %esi, %edi
              setl %al
              movzbl %al, %edi
            jge .L6
              # Emitting (...)
                # Emitting a = 2
# ________________assign______________________________________________
                  # Emitting 2
                  movl $2, %edi
                movl %edi, -4(%ebp)
            jmp .L7
.L6:
              # Emitting (...)
                # Emitting a = 9
# ________________assign______________________________________________
                  # Emitting 9
                  movl $9, %edi
                movl %edi, -4(%ebp)
.L7:
        jmp .L4
.L3:
          # Emitting (...)
            # Emitting a = 7
# ____________assign__________________________________________________
              # Emitting 7
              movl $7, %edi
            movl %edi, -4(%ebp)
.L4:
        # Emitting write(a)
          # Emitting a
# __________var_______________________________________________________
          movl -4(%ebp), %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
    addl $4, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
