.section .data
	vtable_A:
		.int vtable_Object
		.int A_foo
	vtable_B:
		.int vtable_A
		.int B_foo
		.int B_boo
	vtable_C:
		.int vtable_B
		.int B_foo
		.int C_boo
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
.ERROR_EXIT:
movl STACK_PT, %esp
movl BASE_PT, %ebp
ret
  # Emitting class A {...}
    # Emitting int k
    # Emitting int foo(...) {...}
A_foo:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting return 0
          # Emitting 0
          movl $0, %edi
        movl %edi, 12(%ebp)
        # restore old ebp
        movl %ebp, %esp
        popl %ebp
        ret
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
  # Emitting class B {...}
    # Emitting int j
    # Emitting int boo(...) {...}
B_boo:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting return i
          # Emitting i
# __________var_______________________________________________________
          movl 12(%ebp), %edi
        movl %edi, 16(%ebp)
        # restore old ebp
        movl %ebp, %esp
        popl %ebp
        ret
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    # Emitting int foo(...) {...}
B_foo:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting return 1
          # Emitting 1
          movl $1, %edi
        movl %edi, 12(%ebp)
        # restore old ebp
        movl %ebp, %esp
        popl %ebp
        ret
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
  # Emitting class C {...}
    # Emitting int h
    # Emitting int boo(...) {...}
C_boo:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting return (i + 1)
          # Emitting (i + 1)
            # Emitting 1
            movl $1, %edi
            # Emitting i
            pushl $0
            pushl %edi
# ____________var_____________________________________________________
            movl 12(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          add %edi, %esi
        movl %esi, 16(%ebp)
        # restore old ebp
        movl %ebp, %esp
        popl %ebp
        ret
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
  # Emitting class Main {...}
    # Emitting int k
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
    # variable arr
    pushl $0
      # Emitting (...)
        # Emitting arr = new A[][1]
# ________assign______________________________________________________
          # Emitting new A[][1]
            # Emitting 1
            movl $1, %esi
          cmpl $0, %esi
          jge .L2
          movl $5, %eax
          jmp .ERROR_EXIT
.L2:
          addl $2, %esi
          pushl $4
          pushl %esi
          call calloc
          addl $8, %esp
          movl $vtable_Object, (%eax)
          subl $2, %esi
          movl %esi, 4(%eax)
          movl %eax, %edi
        movl %edi, -12(%ebp)
        # Emitting arr[0] = new A()
# ________assign______________________________________________________
          # Emitting new A()
# __________newObject_________________________________________________
          pushl $4
          pushl $2
          call calloc
          addl $8, %esp
          movl $vtable_A, (%eax)
          movl %eax, %edi
          # Emitting arr
          pushl $0
          pushl %edi
# __________var_______________________________________________________
          movl -12(%ebp), %edi
# __________swap needed_______________________________________________
          movl %edi, 4(%esp)
          popl %edi
          popl %esi
          # Emitting 0
          pushl $0
          pushl %esi
          pushl %edi
          movl $0, %edi
# __________swap needed_______________________________________________
          movl %edi, 8(%esp)
          popl %edi
          popl %esi
          popl %edx
        cmpl $0, %esi
        jne .L3
        movl $4, %eax
        jmp .ERROR_EXIT
.L3:
        cmpl $0, %edx
        jge .L4
        movl $3, %eax
        jmp .ERROR_EXIT
.L4:
        cmpl 4(%esi), %edx
        jl .L5
        movl $3, %eax
        jmp .ERROR_EXIT
.L5:
        imul $4, %edx
        addl $8, %edx
        addl %edx, %esi
        movl %edi, (%esi)
        # Emitting arr[0].k = 10
# ________assign______________________________________________________
          # Emitting 10
          movl $10, %edi
          # Emitting arr[0]
          pushl $0
          pushl %edi
            # Emitting arr
# ____________var_____________________________________________________
            movl -12(%ebp), %edi
            # Emitting 0
            pushl $0
            pushl %edi
            movl $0, %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          cmpl $0, %edi
          jne .L6
          movl $4, %eax
          jmp .ERROR_EXIT
.L6:
          cmpl $0, %esi
          jge .L7
          movl $3, %eax
          jmp .ERROR_EXIT
.L7:
          cmpl 4(%edi), %esi
          jl .L8
          movl $3, %eax
          jmp .ERROR_EXIT
.L8:
          imul $4, %esi
          addl $8, %esi
          addl %esi, %edi
          movl (%edi), %edi
# __________swap needed_______________________________________________
          movl %edi, 4(%esp)
          popl %edi
          popl %esi
        cmpl $0, %esi
        jne .L9
        movl $4, %eax
        jmp .ERROR_EXIT
.L9:
        movl %edi, 4(%esi)
        # Emitting write(arr[0].k)
          # Emitting arr[0].k
            # Emitting arr[0]
              # Emitting arr
# ______________var___________________________________________________
              movl -12(%ebp), %edi
              # Emitting 0
              pushl $0
              pushl %edi
              movl $0, %edi
# ______________swap needed___________________________________________
              movl %edi, 4(%esp)
              popl %edi
              popl %esi
            cmpl $0, %edi
            jne .L10
            movl $4, %eax
            jmp .ERROR_EXIT
.L10:
            cmpl $0, %esi
            jge .L11
            movl $3, %eax
            jmp .ERROR_EXIT
.L11:
            cmpl 4(%edi), %esi
            jl .L12
            movl $3, %eax
            jmp .ERROR_EXIT
.L12:
            imul $4, %esi
            addl $8, %esi
            addl %esi, %edi
            movl (%edi), %edi
          cmpl $0, %edi
          jne .L13
          movl $4, %eax
          jmp .ERROR_EXIT
.L13:
          movl 4(%edi), %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting k = 6
# ________assign______________________________________________________
          # Emitting 6
          movl $6, %edi
        movl 8(%ebp), %esi
        movl %edi, 4(%esi)
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
        # Emitting write(a.foo(...))
          # Emitting a.foo(...)
            # Emitting a
            pushl $0
            pushl %edi
# ____________var_____________________________________________________
            movl -4(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          cmpl $0, %esi
          jne .L14
          movl $4, %eax
          jmp .ERROR_EXIT
.L14:
          movl 0(%esi), %edi
          movl 4(%edi), %edi
          subl $4, %esp
          pushl %esi
          call %edi
          addl $4, %esp
          popl %edi
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
        # Emitting write(b.foo(...))
          # Emitting b.foo(...)
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
          jne .L15
          movl $4, %eax
          jmp .ERROR_EXIT
.L15:
          movl 0(%esi), %edi
          movl 4(%edi), %edi
          subl $4, %esp
          pushl %esi
          call %edi
          addl $4, %esp
          popl %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting write(k)
          # Emitting k
# __________var_______________________________________________________
          movl 8(%ebp), %edi
          movl 4(%edi), %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting write(b.boo(...))
          # Emitting b.boo(...)
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
          jne .L16
          movl $4, %eax
          jmp .ERROR_EXIT
.L16:
          movl 0(%esi), %edi
          movl 8(%edi), %edi
          subl $4, %esp
            # Emitting k
            pushl $0
            pushl %edx
            pushl %esi
            pushl %edi
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 4(%edi), %edi
# ____________swap needed_____________________________________________
            movl %edi, 12(%esp)
            popl %edi
            popl %esi
            popl %edx
            popl %ecx
          pushl %ecx
          pushl %esi
          call %edi
          addl $8, %esp
          popl %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
    addl $12, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
