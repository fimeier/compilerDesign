.section .data
	vtable_A:
		.int vtable_B
		.int A_print
	vtable_B:
		.int vtable_C
	vtable_C:
		.int vtable_Object
	vtable_D:
		.int vtable_Object
		.int D_fun
	vtable_Main_array:
		.int vtable_Object
	vtable_A_array:
		.int vtable_Object
	vtable_int_array:
		.int vtable_Object
	vtable_D_array:
		.int vtable_Object
	vtable_C_array:
		.int vtable_Object
	vtable_B_array:
		.int vtable_Object
	vtable_Object:
		.int 0
	vtable_Main:
		.int vtable_D
		.int D_fun
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
pushl $2
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
D_fun:
# store old ebp, set uf new ebp
pushl %ebp
movl %esp, %ebp
# set local variables:
# variable a
pushl $0
  # Emitting a
# __var_______________________________________________________________
  movl -4(%ebp), %edi
movl %edi, 12(%ebp)
# restore old ebp
movl %ebp, %esp
popl %ebp
ret
addl $4, %esp
# restore old ebp
movl %ebp, %esp
popl %ebp
ret
Main_main:
# store old ebp, set uf new ebp
pushl %ebp
movl %esp, %ebp
# set local variables:
  # Emitting this.d.fun(...).foo
    # Emitting this.d.fun(...)
      # Emitting this.d
      pushl %edi
        # Emitting this
        movl 8(%ebp), %edi
      cmpl $0, %edi
      jne .L2
      movl $4, %eax
      jmp .ERROR_EXIT
.L2:
      movl 4(%edi), %edi
# ______swap needed___________________________________________________
      movl %edi, %esi
      popl %edi
    cmpl $0, %esi
    jne .L3
    movl $4, %eax
    jmp .ERROR_EXIT
.L3:
    movl 0(%esi), %edi
    movl 4(%edi), %edi
    subl $4, %esp
    pushl %esi
    call %edi
    addl $4, %esp
    popl %edi
  cmpl $0, %edi
  jne .L4
  movl $4, %eax
  jmp .ERROR_EXIT
.L4:
  movl 4(%edi), %edi
sub $16, %esp
movl %edi, 4(%esp)
movl $STR_D, 0(%esp)
call printf
add $16, %esp
addl $0, %esp
# restore old ebp
movl %ebp, %esp
popl %ebp
ret
A_print:
# store old ebp, set uf new ebp
pushl %ebp
movl %esp, %ebp
# set local variables:
  # Emitting 1
  movl $1, %edi
sub $16, %esp
movl %edi, 4(%esp)
movl $STR_D, 0(%esp)
call printf
add $16, %esp
addl $0, %esp
# restore old ebp
movl %ebp, %esp
popl %ebp
ret
