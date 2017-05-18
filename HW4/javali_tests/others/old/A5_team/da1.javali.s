.section .data
	vtable_Main_array:
		.int vtable_Object
	vtable_int_array:
		.int vtable_Object
	vtable_Object:
		.int 0
	vtable_Main:
		.int vtable_Object
		.int Main_main
		.int Main_foo
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
        # Emitting a = 3
# ________assign______________________________________________________
          # Emitting 3
          movl $3, %edi
        movl %edi, -4(%ebp)
        # Emitting b = 4
# ________assign______________________________________________________
          # Emitting 4
          movl $4, %edi
        movl %edi, -8(%ebp)
        # Emitting if ((1 < this.foo(...))) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting (1 < this.foo(...))
            # Emitting this.foo(...)
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
              # Emitting 3
              movl $3, %ecx
            pushl %ecx
            pushl %esi
            call %edi
            addl $8, %esp
            popl %edi
            # Emitting 1
            movl $1, %esi
          cmpl %edi, %esi
          setl %al
          movzbl %al, %esi
        jge .L4
          # Emitting (...)
            # Emitting b = 7
# ____________assign__________________________________________________
              # Emitting 7
              movl $7, %esi
            movl %esi, -8(%ebp)
        jmp .L5
.L4:
          # Emitting (...)
            # Emitting a = 2
# ____________assign__________________________________________________
              # Emitting 2
              movl $2, %esi
            movl %esi, -4(%ebp)
.L5:
        # Emitting b = 3
# ________assign______________________________________________________
          # Emitting 3
          movl $3, %esi
        movl %esi, -8(%ebp)
        # Emitting a = this.foo(...)
# ________assign______________________________________________________
          # Emitting this.foo(...)
          pushl %edx
            # Emitting this
            movl 8(%ebp), %esi
          cmpl $0, %esi
          jne .L6
          movl $4, %eax
          jmp .ERROR_EXIT
.L6:
          movl 0(%esi), %edx
          movl 8(%edx), %edx
          subl $4, %esp
            # Emitting b
# ____________var_____________________________________________________
            movl -8(%ebp), %ecx
          pushl %ecx
          pushl %esi
          call %edx
          addl $8, %esp
          popl %edx
        movl %edx, -4(%ebp)
        # Emitting a = 18
# ________assign______________________________________________________
          # Emitting 18
          movl $18, %edx
        movl %edx, -4(%ebp)
        # Emitting write(a)
          # Emitting a
# __________var_______________________________________________________
          movl -4(%ebp), %edx
        sub $16, %esp
        movl %edx, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
    addl $8, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    # Emitting int foo(...) {...}
Main_foo:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    pushl %edi
    # set local variables:
      # Emitting (...)
        # Emitting return 4
          # Emitting 4
          movl $4, %edi
        movl %edi, 16(%ebp)
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
