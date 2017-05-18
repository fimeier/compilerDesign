.section .data
	vtable_Main_array:
		.int vtable_Object
	vtable_int_array:
		.int vtable_Object
	vtable_Object:
		.int 0
	vtable_Main:
		.int vtable_Object
		.int Main_m
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
Main_m:
# store old ebp, set uf new ebp
pushl %ebp
movl %esp, %ebp
# set local variables:
  # Emitting ((a + b) + 1)
    # Emitting (a + b)
      # Emitting b
# ______var___________________________________________________________
      movl 16(%ebp), %edi
      # Emitting a
      pushl %edi
# ______var___________________________________________________________
      movl 12(%ebp), %edi
# ______swap needed___________________________________________________
      movl %edi, %esi
      popl %edi
    add %edi, %esi
    # Emitting 1
    pushl %esi
    movl $1, %esi
# ____swap needed_____________________________________________________
    movl %esi, %edi
    popl %esi
  add %edi, %esi
movl %esi, 20(%ebp)
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
# variable a
pushl $0
# variable res
pushl $0
# assign______________________________________________________________
  # Emitting -(1)
    # Emitting 1
    movl $1, %esi
  negl %esi
movl %esi, -8(%ebp)
# assign______________________________________________________________
  # Emitting this.m(...)
    # Emitting this
    pushl %esi
    movl 8(%ebp), %esi
# ____swap needed_____________________________________________________
    movl %esi, %edi
    popl %esi
  cmpl $0, %edi
  jne .L2
  movl $4, %eax
  jmp .ERROR_EXIT
.L2:
  movl 0(%edi), %esi
  movl 4(%esi), %esi
  subl $4, %esp
    # Emitting a
    pushl %edx
    pushl %esi
    pushl %edi
# ____var_____________________________________________________________
    movl -4(%ebp), %edi
# ____swap needed_____________________________________________________
    movl %edi, %esi
    popl %edx
    popl %esi
    popl %edi
  pushl %esi
    # Emitting a
    pushl %edx
    pushl %esi
    pushl %edi
# ____var_____________________________________________________________
    movl -4(%ebp), %edi
# ____swap needed_____________________________________________________
    movl %edi, %esi
    popl %edx
    popl %esi
    popl %edi
  pushl %esi
  pushl %edi
  call %esi
