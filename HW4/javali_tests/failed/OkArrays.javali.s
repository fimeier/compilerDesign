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
# variable a
pushl $0
# variable b
pushl $0
# variable i
pushl $0
# variable bools
pushl $0
# assign______________________________________________________________
  # Emitting new A[][1]
    # Emitting 1
    movl $1, %edi
  cmpl $0, %edi
  jge .L2
  movl $5, %eax
  jmp .ERROR_EXIT
.L2:
  addl $2, %edi
  pushl $4
  pushl %edi
  call calloc
  addl $8, %esp
  movl $vtable_Object, (%eax)
  movl %edi, 4(%eax)
  movl %eax, %esi
movl %esi, -4(%ebp)
# assign______________________________________________________________
  # Emitting new B[][1]
  pushl %edi
    # Emitting 1
    movl $1, %edi
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
  popl %edi
movl %esi, -8(%ebp)
# assign______________________________________________________________
  # Emitting new int[][2]
  pushl %edi
    # Emitting 2
    movl $2, %edi
  cmpl $0, %edi
  jge .L4
  movl $5, %eax
  jmp .ERROR_EXIT
.L4:
  addl $2, %edi
  pushl $4
  pushl %edi
  call calloc
  addl $8, %esp
  movl $vtable_Object, (%eax)
  movl %edi, 4(%eax)
  movl %eax, %esi
  popl %edi
movl %esi, -12(%ebp)
# assign______________________________________________________________
  # Emitting new boolean[][2]
  pushl %edi
    # Emitting 2
    movl $2, %edi
  cmpl $0, %edi
  jge .L5
  movl $5, %eax
  jmp .ERROR_EXIT
.L5:
  addl $2, %edi
  pushl $4
  pushl %edi
  call calloc
  addl $8, %esp
  movl $vtable_Object, (%eax)
  movl %edi, 4(%eax)
  movl %eax, %esi
  popl %edi
movl %esi, -16(%ebp)
# assign______________________________________________________________
  # Emitting new B()
  pushl %edi
# __newObject_________________________________________________________
  pushl $4
  pushl $1
  call calloc
  addl $8, %esp
  movl $vtable_B, (%eax)
  movl %eax, %edi
# __swap needed_______________________________________________________
  movl %edi, %esi
  popl %edi
  # Emitting b
  pushl %esi
  pushl %edi
# __var_______________________________________________________________
  movl -8(%ebp), %edi
# __swap needed_______________________________________________________
  movl %edi, %esi
  popl %esi
  popl %edi
  # Emitting 0
  pushl %esi
  pushl %edi
  movl $0, %edi
# __swap needed_______________________________________________________
  movl %edi, %esi
  popl %esi
  popl %edi
cmpl $0, %esi
jne .L6
movl $4, %eax
jmp .ERROR_EXIT
.L6:
cmpl $0, %esi
jge .L7
movl $3, %eax
jmp .ERROR_EXIT
.L7:
cmpl 4(%esi), %esi
jl .L8
movl $3, %eax
jmp .ERROR_EXIT
.L8:
imul $4, %esi
addl $8, %esi
addl %esi, %esi
movl %esi, (%esi)
