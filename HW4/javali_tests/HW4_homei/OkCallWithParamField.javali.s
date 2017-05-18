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
          pushl $0
          pushl %edi
# __________var_______________________________________________________
          movl -4(%ebp), %edi
# __________swap needed_______________________________________________
          movl %edi, 4(%esp)
          popl %edi
          popl %esi
        cmpl $0, %esi
        jne .L2
        movl $4, %eax
        jmp .ERROR_EXIT
.L2:
        movl %edi, 4(%esi)
        # Emitting a.foo(...)
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
          jne .L3
          movl $4, %eax
          jmp .ERROR_EXIT
.L3:
          movl 0(%esi), %edi
          movl 4(%edi), %edi
          subl $4, %esp
            # Emitting 1
            pushl $0
            pushl %edx
            pushl %esi
            pushl %edi
            movl $1, %edi
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
        # Emitting a.foo(...)
        pushl $0
        pushl %edx
          # Emitting a.foo(...)
            # Emitting a
            pushl $0
            pushl %edx
# ____________var_____________________________________________________
            movl -4(%ebp), %edx
# ____________swap needed_____________________________________________
            movl %edx, 4(%esp)
            popl %edx
            popl %edi
          cmpl $0, %edi
          jne .L4
          movl $4, %eax
          jmp .ERROR_EXIT
.L4:
          movl 0(%edi), %edx
          movl 4(%edx), %edx
          subl $4, %esp
            # Emitting 2
            pushl $0
            pushl %edx
            pushl %esi
            pushl %edi
            movl $2, %edi
# ____________swap needed_____________________________________________
            movl %edi, 12(%esp)
            popl %edi
            popl %esi
            popl %edx
            popl %ecx
          pushl %ecx
          pushl %edi
          call %edx
          addl $8, %esp
          popl %edx
# ________NO swap needed______________________________________________
        popl %edx
        addl $4, %esp
        # Emitting a.foo(...)
        pushl $0
        pushl %edx
        pushl %esi
          # Emitting a.foo(...)
            # Emitting a
            pushl $0
            pushl %esi
# ____________var_____________________________________________________
            movl -4(%ebp), %esi
# ____________swap needed_____________________________________________
            movl %esi, 4(%esp)
            popl %esi
            popl %edx
          cmpl $0, %edx
          jne .L5
          movl $4, %eax
          jmp .ERROR_EXIT
.L5:
          movl 0(%edx), %esi
          movl 4(%esi), %esi
          subl $4, %esp
            # Emitting 3
            pushl $0
            pushl %edx
            pushl %esi
            pushl %edi
            movl $3, %edi
# ____________swap needed_____________________________________________
            movl %edi, 12(%esp)
            popl %edi
            popl %esi
            popl %edx
            popl %ecx
          pushl %ecx
          pushl %edx
          call %esi
          addl $8, %esp
          popl %esi
# ________NO swap needed______________________________________________
        popl %esi
        popl %edx
        addl $4, %esp
    addl $4, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
