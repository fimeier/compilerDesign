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
            pushl %edi
# ____________var_____________________________________________________
            movl -8(%ebp), %esi
            popl %edi
          cmpl $0, %esi
          jne .L2
          movl $4, %eax
          jmp .ERROR_EXIT
.L2:
          movl 0(%esi), %edi
          movl 4(%edi), %edi
          subl $4, %esp
            # Emitting b
            pushl %edx
            pushl %esi
            pushl %edi
# ____________var_____________________________________________________
            movl -8(%ebp), %ecx
            popl %edi
            popl %esi
            popl %edx
          pushl %ecx
            # Emitting a
            pushl %ecx
            pushl %edx
            pushl %esi
            pushl %edi
# ____________var_____________________________________________________
            movl -4(%ebp), %ebx
            popl %edi
            popl %esi
            popl %edx
            popl %ecx
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
  pushl %ecx
  pushl %edx
    # Emitting A foo(...) {...}
    pushl %ecx
    pushl %edx
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
      pushl %ecx
      pushl %edx
        # Emitting a = 2
        pushl %ecx
        pushl %edx
# ________assign______________________________________________________
          # Emitting 2
          pushl %ecx
          pushl %edx
          movl $2, %edi
          popl %edx
          popl %ecx
        movl %edi, -4(%ebp)
        popl %edx
        popl %ecx
        # Emitting b = 3
        pushl %ecx
        pushl %edx
# ________assign______________________________________________________
          # Emitting 3
          pushl %ecx
          pushl %edx
          movl $3, %edi
          popl %edx
          popl %ecx
        movl %edi, -8(%ebp)
        popl %edx
        popl %ecx
        # Emitting if ((a == b)) {...} else {...}
        pushl %ecx
        pushl %edx
# ________ifElse______________________________________________________
          # Emitting (a == b)
          pushl %ecx
          pushl %edx
            # Emitting b
            pushl %ecx
            pushl %edx
# ____________var_____________________________________________________
            movl -8(%ebp), %edi
            popl %edx
            popl %ecx
            # Emitting a
            pushl %ecx
            pushl %edx
            pushl %edi
# ____________var_____________________________________________________
            movl -4(%ebp), %esi
            popl %edi
            popl %edx
            popl %ecx
          cmpl %edi, %esi
          je .L4
          movl $0, %esi
          jmp .L5
.L4:
          movl $1, %esi
.L5:
          popl %edx
          popl %ecx
        jne .L6
          # Emitting (...)
          pushl %ecx
          pushl %edx
            # Emitting write(1)
            pushl %ecx
            pushl %edx
              # Emitting 1
              pushl %ecx
              pushl %edx
              movl $1, %esi
              popl %edx
              popl %ecx
            sub $16, %esp
            movl %esi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
            popl %edx
            popl %ecx
            # Emitting writeln()
            pushl %ecx
            pushl %edx
            sub $16, %esp
            movl $STR_NL, 0(%esp)
            call printf
            add $16, %esp
            popl %edx
            popl %ecx
            # Emitting return arg1
            pushl %ecx
            pushl %edx
              # Emitting arg1
              pushl %ecx
              pushl %edx
# ______________var___________________________________________________
              movl 12(%ebp), %esi
              popl %edx
              popl %ecx
            movl %esi, 20(%ebp)
            # restore old ebp
            movl %ebp, %esp
            popl %ebp
            ret
            popl %edx
            popl %ecx
          popl %edx
          popl %ecx
        jmp .L7
.L6:
          # Emitting (...)
          pushl %ecx
          pushl %edx
            # Emitting write(0)
            pushl %ecx
            pushl %edx
              # Emitting 0
              pushl %ecx
              pushl %edx
              movl $0, %esi
              popl %edx
              popl %ecx
            sub $16, %esp
            movl %esi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
            popl %edx
            popl %ecx
            # Emitting writeln()
            pushl %ecx
            pushl %edx
            sub $16, %esp
            movl $STR_NL, 0(%esp)
            call printf
            add $16, %esp
            popl %edx
            popl %ecx
            # Emitting return arg2
            pushl %ecx
            pushl %edx
              # Emitting arg2
              pushl %ecx
              pushl %edx
# ______________var___________________________________________________
              movl 16(%ebp), %esi
              popl %edx
              popl %ecx
            movl %esi, 20(%ebp)
            # restore old ebp
            movl %ebp, %esp
            popl %ebp
            ret
            popl %edx
            popl %ecx
          popl %edx
          popl %ecx
.L7:
        popl %edx
        popl %ecx
      popl %edx
      popl %ecx
    addl $8, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    popl %edx
    popl %ecx
  popl %edx
  popl %ecx
  # Emitting class B {...}
  pushl %ecx
  pushl %edx
  popl %edx
  popl %ecx
