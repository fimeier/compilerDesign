.section .data
	vtable_A:
		.int vtable_Object
		.int A_foo
	vtable_B:
		.int vtable_A
		.int A_foo
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
        # Emitting a = b.foo(...)
# ________assign______________________________________________________
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
          jne .L2
          movl $4, %eax
          jmp .ERROR_EXIT
.L2:
          movl 0(%esi), %edi
          movl 4(%edi), %edi
          subl $4, %esp
            # Emitting b
            pushl $0
            pushl %edx
            pushl %esi
            pushl %edi
# ____________var_____________________________________________________
            movl -8(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 12(%esp)
            popl %edi
            popl %esi
            popl %edx
            popl %ecx
          pushl %ecx
            # Emitting a
            pushl $0
            pushl %ecx
            pushl %edx
            pushl %esi
            pushl %edi
# ____________var_____________________________________________________
            movl -4(%ebp), %edi
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
        movl %edi, -4(%ebp)
    addl $8, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
  # Emitting class A {...}
  pushl $0
  pushl %ecx
  pushl %edx
    # Emitting A foo(...) {...}
A_foo:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    # variable a
    pushl $0
    # variable b
    pushl $0
      # Emitting (...)
        # Emitting a = 2
# ________assign______________________________________________________
          # Emitting 2
          movl $2, %edx
        movl %edx, -4(%ebp)
        # Emitting b = 3
# ________assign______________________________________________________
          # Emitting 3
          movl $3, %edx
        movl %edx, -8(%ebp)
        # Emitting if ((a == b)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting (a == b)
            # Emitting b
# ____________var_____________________________________________________
            movl -8(%ebp), %edx
            # Emitting a
            pushl $0
            pushl %edx
# ____________var_____________________________________________________
            movl -4(%ebp), %edx
# ____________swap needed_____________________________________________
            movl %edx, 4(%esp)
            popl %edx
            popl %ecx
          cmpl %edx, %ecx
          je .L4
          movl $0, %ecx
          jmp .L5
.L4:
          movl $1, %ecx
.L5:
        jne .L6
          # Emitting (...)
            # Emitting write(1)
              # Emitting 1
              movl $1, %ecx
            sub $16, %esp
            movl %ecx, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
            # Emitting writeln()
            sub $16, %esp
            movl $STR_NL, 0(%esp)
            call printf
            add $16, %esp
            # Emitting return arg1
              # Emitting arg1
# ______________var___________________________________________________
              movl 12(%ebp), %ecx
            movl %ecx, 20(%ebp)
            # restore old ebp
            movl %ebp, %esp
            popl %ebp
            ret
        jmp .L7
.L6:
          # Emitting (...)
            # Emitting write(0)
              # Emitting 0
              movl $0, %ecx
            sub $16, %esp
            movl %ecx, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
            # Emitting writeln()
            sub $16, %esp
            movl $STR_NL, 0(%esp)
            call printf
            add $16, %esp
            # Emitting return arg2
              # Emitting arg2
# ______________var___________________________________________________
              movl 16(%ebp), %ecx
            movl %ecx, 20(%ebp)
            # restore old ebp
            movl %ebp, %esp
            popl %ebp
            ret
.L7:
    addl $8, %esp
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
