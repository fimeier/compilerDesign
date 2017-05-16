.section .data
	vtable_A:
		.int vtable_Object
		.int A_foo
		.int A_funA
	vtable_B:
		.int vtable_A
		.int B_foo
		.int A_funA
		.int B_funB
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
		.int Main_loc
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
pushl $4
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
    # Emitting int x
    # Emitting void foo(...) {...}
A_foo:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting write(x)
          # Emitting x
          movl 8(%ebp), %edi
          movl 4(%edi), %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    # Emitting void funA(...) {...}
A_funA:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
  # Emitting class B {...}
    # Emitting void funB(...) {...}
B_funB:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    # Emitting void foo(...) {...}
B_foo:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
  # Emitting class Main {...}
    # Emitting A a
    # Emitting B b
    # Emitting int g
    # Emitting void main(...) {...}
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    # variable c
    pushl $0
      # Emitting (...)
        # Emitting c = new int[][3]
          # Emitting new int[][3]
            # Emitting 3
            movl $3, %edi
          imul $1, %edi
          addl $2, %edi
          pushl $4
          pushl %edi
          call calloc
          addl $8, %esp
          movl $vtable_Object, (%eax)
          movl %eax, %esi
        movl %esi, -4(%ebp)
        # Emitting a = new A()
          # Emitting new A()
          pushl $4
          pushl $2
          call calloc
          addl $8, %esp
          movl $vtable_A, (%eax)
          movl %eax, %esi
        movl 8(%ebp), %edx
        movl %esi, 4(%edx)
        # Emitting b = new B()
          # Emitting new B()
          pushl $4
          pushl $2
          call calloc
          addl $8, %esp
          movl $vtable_B, (%eax)
          movl %eax, %esi
        movl 8(%ebp), %edx
        movl %esi, 8(%edx)
        # Emitting g = 1
          # Emitting 1
          movl $1, %esi
        movl 8(%ebp), %edx
        movl %esi, 12(%edx)
        # Emitting g = 1
          # Emitting 1
          movl $1, %esi
        movl 8(%ebp), %edx
        movl %esi, 12(%edx)
        # Emitting c[0] = this.loc(...)
          # Emitting this.loc(...)
          subl $4, %esp
            # Emitting (1 + 5)
              # Emitting 5
              movl $5, %edx
              # Emitting 1
              movl $1, %ecx
            add %edx, %ecx
          pushl %ecx
            # Emitting this
            movl 8(%ebp), %ecx
          pushl %ecx
          call Main_loc
          addl $8, %esp
          popl %ecx
          # Emitting c
          movl -4(%ebp), %edx
          # Emitting 0
          movl $0, %ebx
        imul $1, %ebx
        addl $8, %ebx
        addl %ebx, %edx
        movl %ecx, (%edx)
        # Emitting write(c[0])
          # Emitting c[0]
            # Emitting c
            movl -4(%ebp), %ecx
            # Emitting 0
            movl $0, %edx
          imul $4, %edx
          addl $8, %edx
          addl %edx, %ecx
          movl (%ecx), %ecx
        sub $16, %esp
        movl %ecx, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
    addl $4, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    # Emitting int loc(...) {...}
Main_loc:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    pushl %esi
    pushl %edi
    # set local variables:
      # Emitting (...)
        # Emitting arg = (arg + 2)
          # Emitting (arg + 2)
            # Emitting 2
            movl $2, %edi
            # Emitting arg
            movl 12(%ebp), %esi
          add %edi, %esi
        movl %esi, 12(%ebp)
        # Emitting return arg
          # Emitting arg
          movl 12(%ebp), %esi
        movl %esi, 16(%ebp)
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
