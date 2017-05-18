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
    # variable i
    pushl $0
      # Emitting (...)
        # Emitting i = 0
# ________assign______________________________________________________
          # Emitting 0
          movl $0, %edi
        movl %edi, -4(%ebp)
        # Emitting while ((i < 5)) {...}
# ________whileLoop___________________________________________________
.L2:
          # Emitting (i < 5)
            # Emitting 5
            movl $5, %edi
            # Emitting i
            pushl %edi
# ____________var_____________________________________________________
            movl -4(%ebp), %esi
            popl %edi
          cmpl %edi, %esi
          setl %al
          movzbl %al, %esi
        jge .L3
          # Emitting (...)
            # Emitting i = (i + 1)
# ____________assign__________________________________________________
              # Emitting (i + 1)
                # Emitting 1
                movl $1, %esi
                # Emitting i
                pushl %esi
# ________________var_________________________________________________
                movl -4(%ebp), %edi
                popl %esi
              add %esi, %edi
            movl %edi, -4(%ebp)
            # Emitting write(i)
              # Emitting i
# ______________var___________________________________________________
              movl -4(%ebp), %edi
            sub $16, %esp
            movl %edi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
        jmp .L2
.L3:
.L4:
    addl $4, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
