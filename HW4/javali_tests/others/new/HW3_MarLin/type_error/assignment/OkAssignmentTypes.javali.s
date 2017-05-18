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
    # variable i
    pushl $0
    # variable j
    pushl $0
    # variable a1
    pushl $0
    # variable a2
    pushl $0
    # variable b
    pushl $0
      # Emitting (...)
        # Emitting j = 1
# ________assign______________________________________________________
          # Emitting 1
          movl $1, %edi
        movl %edi, -8(%ebp)
        # Emitting i = (j + 1)
# ________assign______________________________________________________
          # Emitting (j + 1)
            # Emitting 1
            movl $1, %edi
            # Emitting j
# ____________var_____________________________________________________
            movl -8(%ebp), %esi
          add %edi, %esi
        movl %esi, -4(%ebp)
        # Emitting a1 = new A()
# ________assign______________________________________________________
          # Emitting new A()
# __________newObject_________________________________________________
          pushl $4
          pushl $1
          call calloc
          addl $8, %esp
          movl $vtable_A, (%eax)
          movl %eax, %esi
        movl %esi, -12(%ebp)
        # Emitting a2 = new A()
# ________assign______________________________________________________
          # Emitting new A()
# __________newObject_________________________________________________
          pushl $4
          pushl $1
          call calloc
          addl $8, %esp
          movl $vtable_A, (%eax)
          movl %eax, %esi
        movl %esi, -16(%ebp)
        # Emitting b = new B()
# ________assign______________________________________________________
          # Emitting new B()
# __________newObject_________________________________________________
          pushl $4
          pushl $1
          call calloc
          addl $8, %esp
          movl $vtable_B, (%eax)
          movl %eax, %esi
        movl %esi, -20(%ebp)
        # Emitting a1 = a2
# ________assign______________________________________________________
          # Emitting a2
# __________var_______________________________________________________
          movl -16(%ebp), %esi
        movl %esi, -12(%ebp)
        # Emitting a1 = b
# ________assign______________________________________________________
          # Emitting b
# __________var_______________________________________________________
          movl -20(%ebp), %esi
        movl %esi, -12(%ebp)
        # Emitting a1 = null
# ________assign______________________________________________________
          # Emitting null
          movl $0, %esi
        movl %esi, -12(%ebp)
    addl $20, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
