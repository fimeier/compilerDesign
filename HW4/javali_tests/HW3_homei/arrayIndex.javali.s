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
pushl $3
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
    # Emitting int[] a
    # Emitting int b
    # Emitting void main(...) {...}
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting a[1] = 0
# ________assign______________________________________________________
          # Emitting 0
          movl $0, %edi
          # Emitting a
          pushl $0
          pushl %edi
# __________var_______________________________________________________
          movl 8(%ebp), %edi
          movl 4(%edi), %edi
# __________swap needed_______________________________________________
          movl %edi, 4(%esp)
          popl %edi
          popl %esi
          # Emitting 1
          pushl $0
          pushl %esi
          pushl %edi
          movl $1, %edi
# __________swap needed_______________________________________________
          movl %edi, 8(%esp)
          popl %edi
          popl %esi
          popl %edx
        cmpl $0, %esi
        jne .L2
        movl $4, %eax
        jmp .ERROR_EXIT
.L2:
        cmpl $0, %edx
        jge .L3
        movl $3, %eax
        jmp .ERROR_EXIT
.L3:
        cmpl 4(%esi), %edx
        jl .L4
        movl $3, %eax
        jmp .ERROR_EXIT
.L4:
        imul $4, %edx
        addl $8, %edx
        addl %edx, %esi
        movl %edi, (%esi)
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
