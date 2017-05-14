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
	vtable_Object:
		.int 0
	vtable_Main:
		.int vtable_Object
		.int Main_main
	STR_NL:
		.string "\n"
	STR_D:
		.string "%d"
.section .text
.global main

main:
pushl $12
call malloc
movl $vtable_Main, (%eax)
movl %eax, (%esp)
call Main_main
addl $4, %esp
ret
  # Emitting class A {...}
    # Emitting void foo(...) {...}
A_foo:
    pushl %ebp
    movl %esp, %ebp
      # Emitting (...)
    movl $0, %eax
    leave
    ret
    # Emitting void funA(...) {...}
A_funA:
    pushl %ebp
    movl %esp, %ebp
      # Emitting (...)
    movl $0, %eax
    leave
    ret
  # Emitting class B {...}
    # Emitting void funB(...) {...}
B_funB:
    pushl %ebp
    movl %esp, %ebp
      # Emitting (...)
    movl $0, %eax
    leave
    ret
    # Emitting void foo(...) {...}
B_foo:
    pushl %ebp
    movl %esp, %ebp
      # Emitting (...)
    movl $0, %eax
    leave
    ret
  # Emitting class Main {...}
    # Emitting A a
    # Emitting B b
    # Emitting void main(...) {...}
Main_main:
    pushl %ebp
    movl %esp, %ebp
      # Emitting (...)
        # Emitting write(10)
          # Emitting 10
          movl $10, %edi
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
    movl $0, %eax
    leave
    ret
