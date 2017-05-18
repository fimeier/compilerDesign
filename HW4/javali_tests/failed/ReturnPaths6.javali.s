.section .data
	vtable_A:
		.int vtable_Object
		.int A_foo
	vtable_B:
		.int vtable_A
		.int A_foo
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
    # variable a
    pushl $0
    # variable b
    pushl $0
      # Emitting (...)
        # Emitting a = b.foo(...)
# ________assign______________________________________________________
          # Emitting b.foo(...)
            # Emitting b
            pushl %edi
# ____________var_____________________________________________________
            movl -8(%ebp), %esi
            popl %edi
          cmpl $0, %esi
          jne .L2
          movl $4, %eax
          jmp .ERROR_EXIT
.L2:
          movl 0(%esi), %edi
          movl 4(%edi), %edi
          subl $4, %esp
            # Emitting b
            pushl %edx
            pushl %esi
            pushl %edi
# ____________var_____________________________________________________
            movl -8(%ebp), %ecx
            popl %edi
            popl %esi
            popl %edx
          pushl %ecx
            # Emitting a
            pushl %ecx
            pushl %edx
            pushl %esi
            pushl %edi
# ____________var_____________________________________________________
            movl -4(%ebp), %ebx
            popl %edi
            popl %esi
            popl %edx
            popl %ecx
          pushl %ebx
          pushl %esi
          call %edi
          addl $12, %esp
          popl %edi
        movl %edi, -4(%ebp)
    addl $8, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
  # Emitting class A {...}
  pushl %ecx
  pushl %edx
    # Emitting A foo(...) {...}
    pushl %ecx
    pushl %edx
A_foo:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
      pushl %ecx
      pushl %edx
        # Emitting while ((arg1 == arg2)) {...}
        pushl %ecx
        pushl %edx
# ________whileLoop___________________________________________________
.L3:
          # Emitting (arg1 == arg2)
          pushl %ecx
          pushl %edx
            # Emitting arg2
            pushl %ecx
            pushl %edx
# ____________var_____________________________________________________
            movl 16(%ebp), %edi
            popl %edx
            popl %ecx
            # Emitting arg1
            pushl %ecx
            pushl %edx
            pushl %edi
# ____________var_____________________________________________________
            movl 12(%ebp), %esi
            popl %edi
            popl %edx
            popl %ecx
          cmpl %edi, %esi
          je .L4
          movl $0, %esi
          jmp .L5
.L4:
          movl $1, %esi
.L5:
          popl %edx
          popl %ecx
        jne .L6
          # Emitting (...)
          pushl %ecx
          pushl %edx
          popl %edx
          popl %ecx
        jmp .L3
.L6:
.L7:
        popl %edx
        popl %ecx
        # Emitting return arg2
        pushl %ecx
        pushl %edx
          # Emitting arg2
          pushl %ecx
          pushl %edx
# __________var_______________________________________________________
          movl 16(%ebp), %esi
          popl %edx
          popl %ecx
        movl %esi, 20(%ebp)
        # restore old ebp
        movl %ebp, %esp
        popl %ebp
        ret
        popl %edx
        popl %ecx
      popl %edx
      popl %ecx
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    popl %edx
    popl %ecx
  popl %edx
  popl %ecx
  # Emitting class B {...}
  pushl %ecx
  pushl %edx
  popl %edx
  popl %ecx
