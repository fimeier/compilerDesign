.section .data
	vtable_A:
		.int vtable_Object
	vtable_B:
		.int vtable_A
	vtable_Main_array:
		.int vtable_Object
	vtable_A_array:
		.int vtable_Object
	vtable_int_array:
		.int vtable_Object
	vtable_B_array:
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
Main_main:
# store old ebp, set uf new ebp
pushl %ebp
movl %esp, %ebp
# set local variables:
# variable x
pushl $0
# variable a
pushl $0
# variable b
pushl $0
# assign______________________________________________________________
  # Emitting (A)(b)
# __cast______________________________________________________________
# __castTypeName______________________________________________________
  movl $vtable_A, %edi
    # Emitting b
    pushl %esi
    pushl %edi
# ____var_____________________________________________________________
    movl -12(%ebp), %edi
# ____swap needed_____________________________________________________
    movl %edi, %esi
    popl %esi
    popl %edi
# __rTypeRegister_____________________________________________________
  movl %esi, %esi
  cmpl $0, %esi
  je .L3
  cmpl %edi, %esi
  je .L3
.L5:
  cmpl $0, %esi
  je .L2
  cmpl %edi, %esi
  je .L3
  movl (%esi), %esi
  jmp .L5
.L2:
  movl $1, %eax
  jmp .ERROR_EXIT
  jmp .L4
.L3:
.L4:
movl %esi, -8(%ebp)
