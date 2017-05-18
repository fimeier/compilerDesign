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
# __________var_______________________________________________________
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
# ________assign______________________________________________________
          # Emitting new int[][3]
            # Emitting 3
            movl $3, %edi
          cmpl $0, %edi
          jge .L2
          movl $5, %eax
          jmp .ERROR_EXIT
.L2:
          addl $2, %edi
          pushl $4
          pushl %edi
          call calloc
          addl $8, %esp
          movl $vtable_Object, (%eax)
          movl %edi, 4(%eax)
          movl %eax, %esi
        movl %esi, -4(%ebp)
        # Emitting a = new A()
# ________assign______________________________________________________
          # Emitting new A()
# __________newObject_________________________________________________
          pushl $4
          pushl $2
          call calloc
          addl $8, %esp
          movl $vtable_A, (%eax)
          movl %eax, %esi
        movl 8(%ebp), %edx
        movl %esi, 4(%edx)
        # Emitting b = new B()
# ________assign______________________________________________________
          # Emitting new B()
# __________newObject_________________________________________________
          pushl $4
          pushl $2
          call calloc
          addl $8, %esp
          movl $vtable_B, (%eax)
          movl %eax, %esi
        movl 8(%ebp), %edx
        movl %esi, 8(%edx)
        # Emitting a.x = 5
# ________assign______________________________________________________
          # Emitting 5
          movl $5, %esi
          # Emitting a
# __________var_______________________________________________________
          movl 8(%ebp), %edx
          movl 4(%edx), %edx
        cmpl $0, %edx
        jne .L3
        movl $4, %eax
        jmp .ERROR_EXIT
.L3:
        movl %esi, 4(%edx)
        # Emitting g = a.x
# ________assign______________________________________________________
          # Emitting a.x
            # Emitting a
# ____________var_____________________________________________________
            movl 8(%ebp), %esi
            movl 4(%esi), %esi
          cmpl $0, %esi
          jne .L4
          movl $4, %eax
          jmp .ERROR_EXIT
.L4:
          movl 4(%esi), %esi
        movl 8(%ebp), %edx
        movl %esi, 12(%edx)
        # Emitting c[0] = this.loc(...)
# ________assign______________________________________________________
          # Emitting this.loc(...)
            # Emitting this
            movl 8(%ebp), %edx
          cmpl $0, %edx
          jne .L5
          movl $4, %eax
          jmp .ERROR_EXIT
.L5:
          movl 0(%edx), %esi
          movl 8(%esi), %esi
          subl $4, %esp
            # Emitting (g + 1)
              # Emitting 1
              movl $1, %ebx
              # Emitting g
# ______________var___________________________________________________
              movl 8(%ebp), %eax
              movl 12(%eax), %eax
            add %ebx, %eax
          pushl %eax
          pushl %edx
          call %esi
          addl $8, %esp
          popl %esi
          # Emitting c
# __________var_______________________________________________________
          movl -4(%ebp), %edx
          # Emitting 0
          movl $0, %eax
        cmpl $0, %edx
        jne .L6
        movl $4, %eax
        jmp .ERROR_EXIT
.L6:
        cmpl $0, %eax
        jge .L7
        movl $3, %eax
        jmp .ERROR_EXIT
.L7:
        cmpl 4(%edx), %eax
        jl .L8
        movl $3, %eax
        jmp .ERROR_EXIT
.L8:
        imul $4, %eax
        addl $8, %eax
        addl %eax, %edx
        movl %esi, (%edx)
        # Emitting write(c[0])
          # Emitting c[0]
            # Emitting c
# ____________var_____________________________________________________
            movl -4(%ebp), %esi
            # Emitting 0
            movl $0, %edx
          cmpl $0, %esi
          jne .L9
          movl $4, %eax
          jmp .ERROR_EXIT
.L9:
          cmpl $0, %edx
          jge .L10
          movl $3, %eax
          jmp .ERROR_EXIT
.L10:
          cmpl 4(%esi), %edx
          jl .L11
          movl $3, %eax
          jmp .ERROR_EXIT
.L11:
          imul $4, %edx
          addl $8, %edx
          addl %edx, %esi
          movl (%esi), %esi
        sub $16, %esp
        movl %esi, 4(%esp)
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
    pushl %edi
    # set local variables:
      # Emitting (...)
        # Emitting arg = (arg + 2)
# ________assign______________________________________________________
          # Emitting (arg + 2)
            # Emitting 2
            movl $2, %edi
            # Emitting arg
# ____________var_____________________________________________________
            movl 12(%ebp), %esi
          add %edi, %esi
        movl %esi, 12(%ebp)
        # Emitting return arg
          # Emitting arg
# __________var_______________________________________________________
          movl 12(%ebp), %esi
        movl %esi, 16(%ebp)
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
