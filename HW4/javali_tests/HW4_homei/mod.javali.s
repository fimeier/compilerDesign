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
      # Emitting (...)
        # Emitting a = 10
# ________assign______________________________________________________
          # Emitting 10
          movl $10, %edi
        movl %edi, -4(%ebp)
        # Emitting b = 3
# ________assign______________________________________________________
          # Emitting 3
          movl $3, %edi
        movl %edi, -8(%ebp)
        # Emitting write((a % b))
          # Emitting (a % b)
            # Emitting b
# ____________var_____________________________________________________
            movl -8(%ebp), %edi
            # Emitting a
            pushl $0
            pushl %edi
# ____________var_____________________________________________________
            movl -4(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          cmpl $0, %edi
          jne .L2
          movl $7, %eax
          jmp .ERROR_EXIT
.L2:
          pushl %edi
          pushl %esi
          popl %eax
          popl %ebx
          cltd
          idivl %ebx
          movl %edx, %esi
        sub $16, %esp
        movl %esi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting write((100 % 4))
          # Emitting (100 % 4)
            # Emitting 4
            movl $4, %esi
            # Emitting 100
            pushl $0
            pushl %esi
            movl $100, %esi
# ____________swap needed_____________________________________________
            movl %esi, 4(%esp)
            popl %esi
            popl %edi
          cmpl $0, %esi
          jne .L3
          movl $7, %eax
          jmp .ERROR_EXIT
.L3:
          pushl %esi
          pushl %edi
          popl %eax
          popl %ebx
          cltd
          idivl %ebx
          movl %edx, %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
    addl $8, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
