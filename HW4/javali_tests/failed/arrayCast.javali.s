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
  # Emitting (B)(a[0])
# __cast______________________________________________________________
# __castTypeName______________________________________________________
  movl $vtable_B, %edi
    # Emitting a[0]
    pushl %esi
    pushl %edi
      # Emitting a
# ______var___________________________________________________________
      movl 8(%ebp), %edi
      movl 4(%edi), %edi
      # Emitting 0
      pushl %edi
      movl $0, %edi
# ______swap needed___________________________________________________
      movl %edi, %esi
      popl %edi
    cmpl $0, %edi
    jne .L6
    movl $4, %eax
    jmp .ERROR_EXIT
.L6:
    cmpl $0, %esi
    jge .L7
    movl $3, %eax
    jmp .ERROR_EXIT
.L7:
    cmpl 4(%edi), %esi
    jl .L8
    movl $3, %eax
    jmp .ERROR_EXIT
.L8:
    imul $4, %esi
    addl $8, %esi
    addl %esi, %edi
    movl (%edi), %edi
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
