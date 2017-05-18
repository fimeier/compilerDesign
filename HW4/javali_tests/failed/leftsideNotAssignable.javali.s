.section .data
	vtable_A:
		.int vtable_Object
		.int A_fun
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
		.int Main_foo
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
pushl $6
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
  # Emitting i2
# __var_______________________________________________________________
  movl 8(%ebp), %edi
  movl 8(%edi), %edi
movl 8(%ebp), %esi
movl %edi, 4(%esi)
# assign______________________________________________________________
  # Emitting a.a
    # Emitting a
# ____var_____________________________________________________________
    movl 8(%ebp), %edi
    movl 16(%edi), %edi
  cmpl $0, %edi
  jne .L2
  movl $4, %eax
  jmp .ERROR_EXIT
.L2:
  movl 4(%edi), %edi
movl 8(%ebp), %esi
movl %edi, 4(%esi)
# assign______________________________________________________________
  # Emitting arr[1]
    # Emitting arr
# ____var_____________________________________________________________
    movl 8(%ebp), %edi
    movl 20(%edi), %edi
    # Emitting 1
    pushl %edi
    movl $1, %edi
# ____swap needed_____________________________________________________
    movl %edi, %esi
    popl %edi
  cmpl $0, %edi
  jne .L3
  movl $4, %eax
  jmp .ERROR_EXIT
.L3:
  cmpl $0, %esi
  jge .L4
  movl $3, %eax
  jmp .ERROR_EXIT
.L4:
  cmpl 4(%edi), %esi
  jl .L5
  movl $3, %eax
  jmp .ERROR_EXIT
.L5:
  imul $4, %esi
  addl $8, %esi
  addl %esi, %edi
  movl (%edi), %edi
movl 8(%ebp), %esi
movl %edi, 8(%esi)
# assign______________________________________________________________
  # Emitting a.fun(...)
    # Emitting a
    pushl %edi
# ____var_____________________________________________________________
    movl 8(%ebp), %edi
    movl 16(%edi), %edi
# ____swap needed_____________________________________________________
    movl %edi, %esi
    popl %edi
  cmpl $0, %esi
  jne .L6
  movl $4, %eax
  jmp .ERROR_EXIT
.L6:
  movl 0(%esi), %edi
  movl 4(%edi), %edi
  subl $4, %esp
  pushl %esi
  call %edi
  addl $4, %esp
  popl %edi
movl 8(%ebp), %esi
movl %edi, 4(%esi)
# assign______________________________________________________________
  # Emitting this.foo(...)
    # Emitting this
    pushl %edi
    movl 8(%ebp), %edi
# ____swap needed_____________________________________________________
    movl %edi, %esi
    popl %edi
  cmpl $0, %esi
  jne .L7
  movl $4, %eax
  jmp .ERROR_EXIT
.L7:
  movl 0(%esi), %edi
  movl 8(%edi), %edi
  subl $4, %esp
  pushl %esi
  call %edi
  addl $4, %esp
  popl %edi
movl 8(%ebp), %esi
movl %edi, 4(%esi)
  # Emitting i2
# __var_______________________________________________________________
  movl 8(%ebp), %edi
  movl 8(%edi), %edi
sub $16, %esp
movl %edi, 4(%esp)
movl $STR_D, 0(%esp)
call printf
add $16, %esp
  # Emitting a.a
    # Emitting a
# ____var_____________________________________________________________
    movl 8(%ebp), %edi
    movl 16(%edi), %edi
  cmpl $0, %edi
  jne .L8
  movl $4, %eax
  jmp .ERROR_EXIT
.L8:
  movl 4(%edi), %edi
sub $16, %esp
movl %edi, 4(%esp)
movl $STR_D, 0(%esp)
call printf
add $16, %esp
  # Emitting arr[1]
    # Emitting arr
# ____var_____________________________________________________________
    movl 8(%ebp), %edi
    movl 20(%edi), %edi
    # Emitting 1
    pushl %edi
    movl $1, %edi
# ____swap needed_____________________________________________________
    movl %edi, %esi
    popl %edi
  cmpl $0, %edi
  jne .L9
  movl $4, %eax
  jmp .ERROR_EXIT
.L9:
  cmpl $0, %esi
  jge .L10
  movl $3, %eax
  jmp .ERROR_EXIT
.L10:
  cmpl 4(%edi), %esi
  jl .L11
  movl $3, %eax
  jmp .ERROR_EXIT
.L11:
  imul $4, %esi
  addl $8, %esi
  addl %esi, %edi
  movl (%edi), %edi
sub $16, %esp
movl %edi, 4(%esp)
movl $STR_D, 0(%esp)
call printf
add $16, %esp
  # Emitting a.fun(...)
    # Emitting a
    pushl %edi
# ____var_____________________________________________________________
    movl 8(%ebp), %edi
    movl 16(%edi), %edi
# ____swap needed_____________________________________________________
    movl %edi, %esi
    popl %edi
  cmpl $0, %esi
  jne .L12
  movl $4, %eax
  jmp .ERROR_EXIT
.L12:
  movl 0(%esi), %edi
  movl 4(%edi), %edi
  subl $4, %esp
  pushl %esi
  call %edi
  addl $4, %esp
  popl %edi
sub $16, %esp
movl %edi, 4(%esp)
movl $STR_D, 0(%esp)
call printf
add $16, %esp
  # Emitting this.foo(...)
    # Emitting this
    pushl %edi
    movl 8(%ebp), %edi
# ____swap needed_____________________________________________________
    movl %edi, %esi
    popl %edi
  cmpl $0, %esi
  jne .L13
  movl $4, %eax
  jmp .ERROR_EXIT
.L13:
  movl 0(%esi), %edi
  movl 8(%edi), %edi
  subl $4, %esp
  pushl %esi
  call %edi
  addl $4, %esp
  popl %edi
sub $16, %esp
movl %edi, 4(%esp)
movl $STR_D, 0(%esp)
call printf
add $16, %esp
# assign______________________________________________________________
  # Emitting i1
# __var_______________________________________________________________
  movl 8(%ebp), %edi
  movl 4(%edi), %edi
  # Emitting a
  pushl %edi
# __var_______________________________________________________________
  movl 8(%ebp), %edi
  movl 16(%edi), %edi
# __swap needed_______________________________________________________
  movl %edi, %esi
  popl %edi
cmpl $0, %esi
jne .L14
movl $4, %eax
jmp .ERROR_EXIT
.L14:
movl %edi, 4(%esi)
# assign______________________________________________________________
  # Emitting i2
# __var_______________________________________________________________
  movl 8(%ebp), %edi
  movl 8(%edi), %edi
  # Emitting arr
  pushl %edi
# __var_______________________________________________________________
  movl 8(%ebp), %edi
  movl 20(%edi), %edi
# __swap needed_______________________________________________________
  movl %edi, %esi
  popl %edi
  # Emitting 1
  pushl %esi
  pushl %edi
  movl $1, %edi
# __swap needed_______________________________________________________
  movl %edi, %esi
  popl %esi
  popl %edi
cmpl $0, %esi
jne .L15
movl $4, %eax
jmp .ERROR_EXIT
.L15:
cmpl $0, %esi
jge .L16
movl $3, %eax
jmp .ERROR_EXIT
.L16:
cmpl 4(%esi), %esi
jl .L17
movl $3, %eax
jmp .ERROR_EXIT
.L17:
imul $4, %esi
addl $8, %esi
addl %esi, %esi
movl %edi, (%esi)
