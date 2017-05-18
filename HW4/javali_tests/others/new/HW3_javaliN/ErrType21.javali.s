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
  # Emitting class Main {...}
    # Emitting void main(...) {...}
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
      # Emitting (...)
        # Emitting x = (a == b)
# ________assign______________________________________________________
          # Emitting (a == b)
            # Emitting b
# ____________var_____________________________________________________
            movl -12(%ebp), %edi
            # Emitting a
# ____________var_____________________________________________________
            movl -8(%ebp), %esi
          cmpl %edi, %esi
          je .L2
          movl $0, %esi
          jmp .L3
.L2:
          movl $1, %esi
.L3:
        movl %esi, -4(%ebp)
        # Emitting x = (b == a)
# ________assign______________________________________________________
          # Emitting (b == a)
            # Emitting a
# ____________var_____________________________________________________
            movl -8(%ebp), %esi
            # Emitting b
# ____________var_____________________________________________________
            movl -12(%ebp), %edi
          cmpl %esi, %edi
          je .L4
          movl $0, %edi
          jmp .L5
.L4:
          movl $1, %edi
.L5:
        movl %edi, -4(%ebp)
        # Emitting x = (b != a)
# ________assign______________________________________________________
          # Emitting (b != a)
            # Emitting a
# ____________var_____________________________________________________
            movl -8(%ebp), %edi
            # Emitting b
# ____________var_____________________________________________________
            movl -12(%ebp), %esi
          cmpl %edi, %esi
          jne .L6
          movl $0, %esi
          jmp .L7
.L6:
          movl $1, %esi
.L7:
        movl %esi, -4(%ebp)
        # Emitting x = (a != b)
# ________assign______________________________________________________
          # Emitting (a != b)
            # Emitting b
# ____________var_____________________________________________________
            movl -12(%ebp), %esi
            # Emitting a
# ____________var_____________________________________________________
            movl -8(%ebp), %edi
          cmpl %esi, %edi
          jne .L8
          movl $0, %edi
          jmp .L9
.L8:
          movl $1, %edi
.L9:
        movl %edi, -4(%ebp)
    addl $12, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
  # Emitting class A {...}
  # Emitting class B {...}
