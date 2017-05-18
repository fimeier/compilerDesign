.section .data
	vtable_A:
		.int vtable_Object
	vtable_C:
		.int vtable_Object
	vtable_S:
		.int vtable_A
	vtable_S_array:
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
  # Emitting class Main {...}
    # Emitting A a
    # Emitting S s
    # Emitting C c
    # Emitting void main(...) {...}
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    # variable b
    pushl $0
      # Emitting (...)
        # Emitting b = (s != s)
# ________assign______________________________________________________
          # Emitting (s != s)
            # Emitting s
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 8(%edi), %edi
            # Emitting s
# ____________var_____________________________________________________
            movl 8(%ebp), %esi
            movl 8(%esi), %esi
          cmpl %edi, %esi
          jne .L2
          movl $0, %esi
          jmp .L3
.L2:
          movl $1, %esi
.L3:
        movl %esi, -4(%ebp)
    addl $4, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
  # Emitting class C {...}
  # Emitting class A {...}
  # Emitting class S {...}
