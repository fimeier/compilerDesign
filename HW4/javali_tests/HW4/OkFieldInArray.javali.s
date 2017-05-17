.section .data
	vtable_A:
		.int vtable_Object
		.int A_funA
		.int A_foo
	vtable_B:
		.int vtable_A
		.int A_funA
		.int B_foo
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
.section .text
# start: Main-Class___________________________________________________
.global main

main:
# start: prolog
pushl %ebp
movl %esp, %ebp
# end: prolog
# Create Main object and safe its address to %eax
pushl $4
pushl $2
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
  # Emitting class A {...}
    # Emitting int field
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
    # Emitting void foo(...) {...}
A_foo:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting write(1)
          # Emitting 1
          movl $1, %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting write(field)
          # Emitting field
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
  # Emitting class B {...}
    # Emitting boolean field
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
    # Emitting A[] x
    # Emitting void main(...) {...}
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    # variable i
    pushl $0
      # Emitting (...)
        # Emitting x = new A[][2]
          # Emitting new A[][2]
            # Emitting 2
            movl $2, %edi
          addl $2, %edi
          pushl $4
          pushl %edi
          call calloc
          addl $8, %esp
          movl $vtable_Object, (%eax)
          movl %eax, %esi
        movl 8(%ebp), %edx
        movl %esi, 4(%edx)
        # Emitting i = 1
          # Emitting 1
          movl $1, %esi
        movl %esi, -4(%ebp)
        # Emitting write(i)
          # Emitting i
          movl -4(%ebp), %esi
        sub $16, %esp
        movl %esi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        # Emitting x[i] = new A()
          # Emitting new A()
          pushl $4
          pushl $2
          call calloc
          addl $8, %esp
          movl $vtable_A, (%eax)
          movl %eax, %esi
          # Emitting x
          movl 8(%ebp), %edx
          movl 4(%edx), %edx
          # Emitting i
          movl -4(%ebp), %ecx
        imul $4, %ecx
        addl $8, %ecx
        addl %ecx, %edx
        movl %esi, (%edx)
        # Emitting x[i].field = (i + 1)
          # Emitting (i + 1)
            # Emitting 1
            movl $1, %esi
            # Emitting i
            movl -4(%ebp), %edx
          add %esi, %edx
          # Emitting x[i]
            # Emitting x
            movl 8(%ebp), %esi
            movl 4(%esi), %esi
            # Emitting i
            movl -4(%ebp), %ecx
          imul $4, %ecx
          addl $8, %ecx
          addl %ecx, %esi
          movl (%esi), %esi
        movl %edx, 4(%esi)
        # Emitting i = x[1].field
          # Emitting x[1].field
            # Emitting x[1]
              # Emitting x
              movl 8(%ebp), %edx
              movl 4(%edx), %edx
              # Emitting 1
              movl $1, %esi
            imul $4, %esi
            addl $8, %esi
            addl %esi, %edx
            movl (%edx), %edx
          movl 4(%edx), %edx
        movl %edx, -4(%ebp)
        # Emitting write(i)
          # Emitting i
          movl -4(%ebp), %edx
        sub $16, %esp
        movl %edx, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        # Emitting x[1].foo(...)
        subl $4, %esp
          # Emitting x[1]
            # Emitting x
            movl 8(%ebp), %edx
            movl 4(%edx), %edx
            # Emitting 1
            movl $1, %esi
          imul $4, %esi
          addl $8, %esi
          addl %esi, %edx
          movl (%edx), %edx
        pushl %edx
        call A_foo
        addl $4, %esp
        popl %edx
    addl $4, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
