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
  pushl $0
    # Emitting void main(...) {...}
    pushl $0
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
      pushl $0
        # Emitting a = b.foo(...)
        pushl $0
# ________assign______________________________________________________
          # Emitting b.foo(...)
          pushl $0
            # Emitting b
            pushl $0
            pushl %edi
# ____________var_____________________________________________________
            movl -8(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          cmpl $0, %esi
          jne .L2
          movl $4, %eax
          jmp .ERROR_EXIT
.L2:
          movl 0(%esi), %edi
          movl 4(%edi), %edi
          subl $4, %esp
            # Emitting b
            pushl $0
            pushl %edx
            pushl %esi
            pushl %edi
# ____________var_____________________________________________________
            movl -8(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 12(%esp)
            popl %edx
            popl %esi
            popl %edi
            popl %ecx
          pushl %ecx
            # Emitting a
            pushl $0
            pushl %ecx
            pushl %edx
            pushl %esi
            pushl %edi
# ____________var_____________________________________________________
            movl -4(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 16(%esp)
            popl %ecx
            popl %edx
            popl %esi
            popl %edi
            popl %ebx
          pushl %ebx
          pushl %esi
          call %edi
          addl $12, %esp
          popl %edi
          popl %esi
        movl %esi, -4(%ebp)
        addl $4, %esp
      addl $4, %esp
    addl $8, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    addl $4, %esp
  addl $4, %esp
  # Emitting class A {...}
  pushl $0
  pushl %ecx
  pushl %edx
  pushl %edi
    # Emitting A foo(...) {...}
    pushl $0
A_foo:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
      pushl $0
        # Emitting while ((arg1 == arg2)) {...}
        pushl $0
# ________whileLoop___________________________________________________
.L3:
          # Emitting (arg1 == arg2)
          pushl $0
            # Emitting arg2
            pushl $0
# ____________var_____________________________________________________
            movl 16(%ebp), %edi
            popl %edx
            # Emitting arg1
            pushl $0
            pushl %edx
            pushl %edi
# ____________var_____________________________________________________
            movl 12(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 8(%esp)
            popl %edx
            popl %edi
            popl %ecx
          cmpl %edx, %ecx
          je .L4
          movl $0, %ecx
          jmp .L5
.L4:
          movl $1, %ecx
.L5:
          popl %edx
        jne .L6
          # Emitting (...)
          pushl $0
          pushl %ecx
          pushl %edi
          popl %ecx
          popl %edi
          addl $4, %esp
        jmp .L3
.L6:
.L7:
        addl $4, %esp
        # Emitting return arg2
        pushl $0
        pushl %ecx
        pushl %edi
          # Emitting arg2
          pushl $0
# __________var_______________________________________________________
          movl 16(%ebp), %edi
          popl %ecx
        movl %ecx, 20(%ebp)
        # restore old ebp
        movl %ebp, %esp
        popl %ebp
        ret
        popl %ecx
        popl %edi
        addl $4, %esp
      addl $4, %esp
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    addl $4, %esp
  popl %ecx
  popl %edx
  popl %edi
  addl $4, %esp
  # Emitting class B {...}
  pushl $0
  pushl %ecx
  pushl %edx
  pushl %edi
  popl %ecx
  popl %edx
  popl %edi
  addl $4, %esp
