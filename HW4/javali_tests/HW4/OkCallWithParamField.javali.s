.section .data
	vtable_A:
		.int vtable_Object
		.int A_foo
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
    # Emitting int i
    # Emitting void foo(...) {...}
A_foo:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting write(p)
          # Emitting p
# __________var_______________________________________________________
          movl 12(%ebp), %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting write(i)
          # Emitting i
# __________var_______________________________________________________
          movl 8(%ebp), %edi
          movl 4(%edi), %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
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
      # Emitting (...)
        # Emitting a = new A()
# ________assign______________________________________________________
          # Emitting new A()
# __________newObject_________________________________________________
          pushl $4
          pushl $2
          call calloc
          addl $8, %esp
          movl $vtable_A, (%eax)
          movl %eax, %edi
        movl %edi, -4(%ebp)
        # Emitting a.i = 10
# ________assign______________________________________________________
          # Emitting 10
          movl $10, %edi
          # Emitting a
# __________var_______________________________________________________
          movl -4(%ebp), %esi
        movl %edi, 4(%esi)
        # Emitting a.foo(...)
          # Emitting a
# __________var_______________________________________________________
          movl -4(%ebp), %esi
        movl 0(%esi), %edi
        movl 4(%edi), %edi
        subl $4, %esp
          # Emitting 1
          movl $1, %ecx
        pushl %ecx
        pushl %esi
        call %edi
        addl $8, %esp
        popl %edi
        # Emitting a.foo(...)
        pushl %edx
          # Emitting a
# __________var_______________________________________________________
          movl -4(%ebp), %edi
        movl 0(%edi), %edx
        movl 4(%edx), %edx
        subl $4, %esp
          # Emitting 2
          movl $2, %ecx
        pushl %ecx
        pushl %edi
        call %edx
        addl $8, %esp
        popl %edx
        # Emitting a.foo(...)
          # Emitting a
# __________var_______________________________________________________
          movl -4(%ebp), %edi
        movl 0(%edi), %edx
        movl 4(%edx), %edx
        subl $4, %esp
          # Emitting 3
          movl $3, %ebx
        pushl %ebx
        pushl %edi
        call %edx
        addl $8, %esp
        popl %edx
    addl $4, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
