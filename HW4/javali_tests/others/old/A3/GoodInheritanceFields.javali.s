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
    # Emitting int foo
  # Emitting class B {...}
    # Emitting int bar
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
        # Emitting a.foo = 1
# ________assign______________________________________________________
          # Emitting 1
          movl $1, %edi
          # Emitting a
# __________var_______________________________________________________
          movl -4(%ebp), %esi
        cmpl $0, %esi
        jne .L2
        movl $4, %eax
        jmp .ERROR_EXIT
.L2:
        movl %edi, 4(%esi)
        # Emitting write(a.foo)
          # Emitting a.foo
            # Emitting a
# ____________var_____________________________________________________
            movl -4(%ebp), %edi
          cmpl $0, %edi
          jne .L3
          movl $4, %eax
          jmp .ERROR_EXIT
.L3:
          movl 4(%edi), %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting a = new B()
# ________assign______________________________________________________
          # Emitting new B()
# __________newObject_________________________________________________
          pushl $4
          pushl $3
          call calloc
          addl $8, %esp
          movl $vtable_B, (%eax)
          movl %eax, %edi
        movl %edi, -4(%ebp)
        # Emitting a.foo = 2
# ________assign______________________________________________________
          # Emitting 2
          movl $2, %edi
          # Emitting a
# __________var_______________________________________________________
          movl -4(%ebp), %esi
        cmpl $0, %esi
        jne .L4
        movl $4, %eax
        jmp .ERROR_EXIT
.L4:
        movl %edi, 4(%esi)
        # Emitting write(a.foo)
          # Emitting a.foo
            # Emitting a
# ____________var_____________________________________________________
            movl -4(%ebp), %edi
          cmpl $0, %edi
          jne .L5
          movl $4, %eax
          jmp .ERROR_EXIT
.L5:
          movl 4(%edi), %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting b = new B()
# ________assign______________________________________________________
          # Emitting new B()
# __________newObject_________________________________________________
          pushl $4
          pushl $3
          call calloc
          addl $8, %esp
          movl $vtable_B, (%eax)
          movl %eax, %edi
        movl %edi, -8(%ebp)
        # Emitting b.foo = 3
# ________assign______________________________________________________
          # Emitting 3
          movl $3, %edi
          # Emitting b
# __________var_______________________________________________________
          movl -8(%ebp), %esi
        cmpl $0, %esi
        jne .L6
        movl $4, %eax
        jmp .ERROR_EXIT
.L6:
        movl %edi, 4(%esi)
        # Emitting b.bar = 4
# ________assign______________________________________________________
          # Emitting 4
          movl $4, %edi
          # Emitting b
# __________var_______________________________________________________
          movl -8(%ebp), %esi
        cmpl $0, %esi
        jne .L7
        movl $4, %eax
        jmp .ERROR_EXIT
.L7:
        movl %edi, 8(%esi)
        # Emitting write(b.foo)
          # Emitting b.foo
            # Emitting b
# ____________var_____________________________________________________
            movl -8(%ebp), %edi
          cmpl $0, %edi
          jne .L8
          movl $4, %eax
          jmp .ERROR_EXIT
.L8:
          movl 4(%edi), %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting write(b.bar)
          # Emitting b.bar
            # Emitting b
# ____________var_____________________________________________________
            movl -8(%ebp), %edi
          cmpl $0, %edi
          jne .L9
          movl $4, %eax
          jmp .ERROR_EXIT
.L9:
          movl 8(%edi), %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
    addl $8, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
