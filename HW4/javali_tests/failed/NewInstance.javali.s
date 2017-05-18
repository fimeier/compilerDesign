.section .data
	vtable_A:
		.int vtable_Object
		.int A_m
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
		.int Main_k
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
Main_k:
# store old ebp, set uf new ebp
pushl %ebp
movl %esp, %ebp
# set local variables:
  # Emitting 5
  movl $5, %edi
movl %edi, 12(%ebp)
# restore old ebp
movl %ebp, %esp
popl %ebp
ret
addl $0, %esp
# restore old ebp
movl %ebp, %esp
popl %ebp
ret
Main_main:
# store old ebp, set uf new ebp
pushl %ebp
movl %esp, %ebp
# set local variables:
# variable ab
pushl $0
  # Emitting this
  pushl %edi
  movl 8(%ebp), %edi
# __swap needed_______________________________________________________
  movl %edi, %esi
  popl %edi
cmpl $0, %esi
jne .L2
movl $4, %eax
jmp .ERROR_EXIT
.L2:
movl 0(%esi), %edi
movl 4(%edi), %edi
subl $4, %esp
pushl %esi
call %edi
addl $4, %esp
popl %edi
# assign______________________________________________________________
  # Emitting new A()
# __newObject_________________________________________________________
  pushl $4
  pushl $4
  call calloc
  addl $8, %esp
  movl $vtable_A, (%eax)
  movl %eax, %edi
movl %edi, -4(%ebp)
# assign______________________________________________________________
  # Emitting new A[][15]
    # Emitting 15
    movl $15, %edi
  cmpl $0, %edi
  jge .L3
  movl $5, %eax
  jmp .ERROR_EXIT
.L3:
  addl $2, %edi
  pushl $4
  pushl %edi
  call calloc
  addl $8, %esp
  movl $vtable_Object, (%eax)
  movl %edi, 4(%eax)
  movl %eax, %esi
movl 8(%ebp), %edx
movl %esi, 4(%edx)
  # Emitting this
  pushl %esi
  pushl %edi
  movl 8(%ebp), %edi
# __swap needed_______________________________________________________
  movl %edi, %esi
  popl %esi
  popl %edi
cmpl $0, %esi
jne .L4
movl $4, %eax
jmp .ERROR_EXIT
.L4:
movl 0(%esi), %esi
movl 4(%esi), %esi
subl $4, %esp
pushl %esi
call %esi
