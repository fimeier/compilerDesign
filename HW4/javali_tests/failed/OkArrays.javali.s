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
  # Emitting class A {...}
  # Emitting class B {...}
  # Emitting class Main {...}
    # Emitting void main(...) {...}
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
      # Emitting (...)
        # Emitting a = new A[][1]
# ________assign______________________________________________________
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
        # Emitting b = new B[][1]
        pushl %edi
# ________assign______________________________________________________
          # Emitting new B[][1]
          pushl %edi
            # Emitting 1
            pushl %edi
            movl $1, %esi
            popl %edi
          cmpl $0, %esi
          jge .L3
          movl $5, %eax
          jmp .ERROR_EXIT
.L3:
          addl $2, %esi
          pushl $4
          pushl %esi
          call calloc
          addl $8, %esp
          movl $vtable_Object, (%eax)
          movl %esi, 4(%eax)
          movl %eax, %edx
          popl %edi
        movl %edx, -8(%ebp)
        popl %edi
        # Emitting i = new int[][2]
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting new int[][2]
          pushl %esi
          pushl %edi
            # Emitting 2
            pushl %esi
            pushl %edi
            movl $2, %edx
            popl %edi
            popl %esi
          cmpl $0, %edx
          jge .L4
          movl $5, %eax
          jmp .ERROR_EXIT
.L4:
          addl $2, %edx
          pushl $4
          pushl %edx
          call calloc
          addl $8, %esp
          movl $vtable_Object, (%eax)
          movl %edx, 4(%eax)
          movl %eax, %ecx
          popl %edi
          popl %esi
        movl %ecx, -12(%ebp)
        popl %edi
        popl %esi
        # Emitting bools = new boolean[][2]
        pushl %edx
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting new boolean[][2]
          pushl %edx
          pushl %esi
          pushl %edi
            # Emitting 2
            pushl %edx
            pushl %esi
            pushl %edi
            movl $2, %ecx
            popl %edi
            popl %esi
            popl %edx
          cmpl $0, %ecx
          jge .L5
          movl $5, %eax
          jmp .ERROR_EXIT
.L5:
          addl $2, %ecx
          pushl $4
          pushl %ecx
          call calloc
          addl $8, %esp
          movl $vtable_Object, (%eax)
          movl %ecx, 4(%eax)
          movl %eax, %ebx
          popl %edi
          popl %esi
          popl %edx
        movl %ebx, -16(%ebp)
        popl %edi
        popl %esi
        popl %edx
        # Emitting b[0] = new B()
        pushl %ecx
        pushl %edx
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting new B()
          pushl %ecx
          pushl %edx
          pushl %esi
          pushl %edi
# __________newObject_________________________________________________
          pushl $4
          pushl $1
          call calloc
          addl $8, %esp
          movl $vtable_B, (%eax)
          movl %eax, %ebx
          popl %edi
          popl %esi
          popl %edx
          popl %ecx
          # Emitting b
          pushl %ebx
          pushl %ecx
          pushl %edx
          pushl %esi
          pushl %edi
# __________var_______________________________________________________
          movl -8(%ebp), %eax
          popl %edi
          popl %esi
          popl %edx
          popl %ecx
          popl %ebx
          # Emitting 0
          pushl %eax
          pushl %ebx
          pushl %ecx
          pushl %edx
          pushl %esi
          pushl %edi
