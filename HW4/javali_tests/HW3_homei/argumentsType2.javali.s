.section .data
	vtable_A:
		.int vtable_Object
		.int A_prim
		.int A_fun
	vtable_B:
		.int vtable_C
	vtable_C:
		.int vtable_Object
	vtable_Main_array:
		.int vtable_Object
	vtable_A_array:
		.int vtable_Object
	vtable_int_array:
		.int vtable_Object
	vtable_C_array:
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
    # Emitting B b
    # Emitting C c
    # Emitting void main(...) {...}
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting a = new A()
# ________assign______________________________________________________
          # Emitting new A()
# __________newObject_________________________________________________
          pushl $4
          pushl $1
          call calloc
          addl $8, %esp
          movl $vtable_A, (%eax)
          movl %eax, %edi
        movl 8(%ebp), %esi
        movl %edi, 4(%esi)
        # Emitting a.fun(...)
          # Emitting a.fun(...)
            # Emitting a
            pushl $0
            pushl %edi
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 4(%edi), %edi
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
          movl 8(%edi), %edi
          subl $4, %esp
            # Emitting b
            pushl $0
            pushl %edx
            pushl %esi
            pushl %edi
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 8(%edi), %edi
# ____________swap needed_____________________________________________
            movl %edi, 12(%esp)
            popl %edi
            popl %esi
            popl %edx
            popl %ecx
          pushl %ecx
            # Emitting c
            pushl $0
            pushl %ecx
            pushl %edx
            pushl %esi
            pushl %edi
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 12(%edi), %edi
# ____________swap needed_____________________________________________
            movl %edi, 16(%esp)
            popl %edi
            popl %esi
            popl %edx
            popl %ecx
            popl %ebx
          pushl %ebx
          pushl %esi
          call %edi
          addl $12, %esp
          popl %edi
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
  # Emitting class A {...}
  pushl $0
  pushl %ecx
  pushl %edx
    # Emitting void prim(...) {...}
A_prim:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    # Emitting void fun(...) {...}
A_fun:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
# __NO swap needed____________________________________________________
  popl %edx
  popl %ecx
  addl $4, %esp
  # Emitting class B {...}
  pushl $0
  pushl %ecx
  pushl %edx
# __NO swap needed____________________________________________________
  popl %edx
  popl %ecx
  addl $4, %esp
  # Emitting class C {...}
  pushl $0
  pushl %ecx
  pushl %edx
# __NO swap needed____________________________________________________
  popl %edx
  popl %ecx
  addl $4, %esp
