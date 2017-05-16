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
.section .text
.global main

main:
pushl %ebp
movl %esp, %ebp
pushl $4
pushl $1
call calloc
addl $8, %esp
movl $vtable_Main, (%eax)
pushl %eax
call Main_main
addl $4, %esp
movl %ebp, %esp
popl %ebp
movl $0, %eax
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
          movl 12(%ebp), %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting write(i)
          # Emitting i
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
          # Emitting new A()
          pushl $4
          pushl $2
          call calloc
          addl $8, %esp
          movl $vtable_A, (%eax)
          movl %eax, %edi
        movl %edi, -4(%ebp)
        # Emitting a.i = 10
          # Emitting 10
          movl $10, %edi
        # Emitting a.foo(...)
        subl $4, %esp
          # Emitting 1
          movl $1, %esi
        pushl %esi
          # Emitting a
          movl -4(%ebp), %esi
        pushl %esi
        call A_foo
        addl $8, %esp
        popl %esi
        # Emitting a.foo(...)
        subl $4, %esp
          # Emitting 2
          movl $2, %edx
        pushl %edx
          # Emitting a
          movl -4(%ebp), %edx
        pushl %edx
        call A_foo
        addl $8, %esp
        popl %edx
        # Emitting a.foo(...)
        subl $4, %esp
          # Emitting 3
          movl $3, %ecx
        pushl %ecx
          # Emitting a
          movl -4(%ebp), %ecx
        pushl %ecx
        call A_foo
        addl $8, %esp
        popl %ecx
    addl $4, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
