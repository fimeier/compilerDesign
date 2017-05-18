.section .data
	vtable_bar:
		.int vtable_foo
		.int foo_foo
		.int bar_bar
	vtable_foo_array:
		.int vtable_Object
	vtable_Main_array:
		.int vtable_Object
	vtable_int_array:
		.int vtable_Object
	vtable_foo:
		.int vtable_Object
		.int foo_foo
		.int foo_bar
	vtable_Object:
		.int 0
	vtable_Main:
		.int vtable_Object
		.int Main_main
	vtable_boolean_array:
		.int vtable_Object
	vtable_bar_array:
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
  # Emitting class foo {...}
    # Emitting foo foo
    # Emitting void foo(...) {...}
foo_foo:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    # variable foo
    pushl $0
      # Emitting (...)
        # Emitting foo = 2
# ________assign______________________________________________________
          # Emitting 2
          movl $2, %edi
        movl %edi, -4(%ebp)
        # Emitting write(foo)
          # Emitting foo
# __________var_______________________________________________________
          movl -4(%ebp), %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
    addl $4, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    # Emitting void bar(...) {...}
foo_bar:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
  # Emitting class bar {...}
    # Emitting foo foo
    # Emitting void bar(...) {...}
bar_bar:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting this.foo(...)
          # Emitting this
          movl 8(%ebp), %esi
        cmpl $0, %esi
        jne .L2
        movl $4, %eax
        jmp .ERROR_EXIT
.L2:
        movl 0(%esi), %edi
        movl 4(%edi), %edi
        subl $4, %esp
        pushl %esi
        call %edi
        addl $4, %esp
        popl %edi
        # Emitting this.bar(...)
          # Emitting this
          movl 8(%ebp), %esi
        cmpl $0, %esi
        jne .L3
        movl $4, %eax
        jmp .ERROR_EXIT
.L3:
        movl 0(%esi), %edi
        movl 8(%edi), %edi
        subl $4, %esp
        pushl %esi
        call %edi
        addl $4, %esp
        popl %edi
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
    # variable f
    pushl $0
      # Emitting (...)
        # Emitting f = new foo()
# ________assign______________________________________________________
          # Emitting new foo()
# __________newObject_________________________________________________
          pushl $4
          pushl $2
          call calloc
          addl $8, %esp
          movl $vtable_foo, (%eax)
          movl %eax, %edi
        movl %edi, -4(%ebp)
        # Emitting f.foo(...)
          # Emitting f
# __________var_______________________________________________________
          movl -4(%ebp), %esi
        cmpl $0, %esi
        jne .L4
        movl $4, %eax
        jmp .ERROR_EXIT
.L4:
        movl 0(%esi), %edi
        movl 4(%edi), %edi
        subl $4, %esp
        pushl %esi
        call %edi
        addl $4, %esp
        popl %edi
    addl $4, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
