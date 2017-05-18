.section .data
	vtable_A:
		.int vtable_Object
		.int A_fun1
	vtable_S:
		.int vtable_A
		.int S_fun1
	vtable_S_array:
		.int vtable_Object
	vtable_Main_array:
		.int vtable_Object
	vtable_A_array:
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
pushl $4
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
  # Emitting a.i
    # Emitting a
# ____var_____________________________________________________________
    movl 8(%ebp), %edi
    movl 8(%edi), %edi
  cmpl $0, %edi
  jne .L2
  movl $4, %eax
  jmp .ERROR_EXIT
.L2:
  movl 4(%edi), %edi
movl 8(%ebp), %esi
movl %edi, 4(%esi)
# assign______________________________________________________________
  # Emitting s.s
    # Emitting s
# ____var_____________________________________________________________
    movl 8(%ebp), %edi
    movl 12(%edi), %edi
  cmpl $0, %edi
  jne .L3
  movl $4, %eax
  jmp .ERROR_EXIT
.L3:
  movl 12(%edi), %edi
movl 8(%ebp), %esi
movl %edi, 4(%esi)
# assign______________________________________________________________
  # Emitting s.i
    # Emitting s
# ____var_____________________________________________________________
    movl 8(%ebp), %edi
    movl 12(%edi), %edi
  cmpl $0, %edi
  jne .L4
  movl $4, %eax
  jmp .ERROR_EXIT
.L4:
  movl 4(%edi), %edi
movl 8(%ebp), %esi
movl %edi, 4(%esi)
  # Emitting a
  pushl %edi
# __var_______________________________________________________________
  movl 8(%ebp), %edi
  movl 8(%edi), %edi
# __swap needed_______________________________________________________
  movl %edi, %esi
  popl %edi
cmpl $0, %esi
jne .L5
movl $4, %eax
jmp .ERROR_EXIT
.L5:
movl 0(%esi), %edi
movl 4(%edi), %edi
subl $4, %esp
  # Emitting 1
  pushl %edx
  pushl %esi
  pushl %edi
  movl $1, %edi
# __swap needed_______________________________________________________
  movl %edi, %esi
  popl %edx
  popl %esi
  popl %edi
pushl %esi
pushl %esi
