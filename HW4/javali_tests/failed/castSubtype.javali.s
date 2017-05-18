.section .data
	vtable_A:
		.int vtable_Object
	vtable_R:
		.int vtable_C
	vtable_C:
		.int vtable_Object
	vtable_Main_array:
		.int vtable_Object
	vtable_A_array:
		.int vtable_Object
	vtable_int_array:
		.int vtable_Object
	vtable_C_array:
		.int vtable_Object
	vtable_Object:
		.int 0
	vtable_R_array:
		.int vtable_Object
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
Main_main:
# store old ebp, set uf new ebp
pushl %ebp
movl %esp, %ebp
# set local variables:
# assign______________________________________________________________
  # Emitting new R()
# __newObject_________________________________________________________
  pushl $4
  pushl $1
  call calloc
  addl $8, %esp
  movl $vtable_R, (%eax)
  movl %eax, %edi
movl 8(%ebp), %esi
movl %edi, 8(%esi)
# assign______________________________________________________________
  # Emitting r
# __var_______________________________________________________________
  movl 8(%ebp), %edi
  movl 8(%edi), %edi
movl 8(%ebp), %esi
movl %edi, 4(%esi)
# assign______________________________________________________________
  # Emitting (R)(c)
# __cast______________________________________________________________
# __castTypeName______________________________________________________
  movl $vtable_R, %edi
    # Emitting c
    pushl %esi
    pushl %edi
# ____var_____________________________________________________________
    movl 8(%ebp), %edi
    movl 4(%edi), %edi
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
movl 8(%ebp), %esi
movl %esi, 8(%esi)
