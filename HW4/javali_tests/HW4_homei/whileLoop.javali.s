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
    # variable b
    pushl $0
      # Emitting (...)
        # Emitting b = this.foo(...)
# ________assign______________________________________________________
          # Emitting this.foo(...)
            # Emitting this
            pushl $0
            pushl %edi
            movl 8(%ebp), %edi
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
          movl 8(%edi), %edi
          subl $4, %esp
          pushl %esi
          call %edi
          addl $4, %esp
          popl %edi
        movl %edi, -4(%ebp)
        # Emitting while ((b < 10)) {...}
# ________whileLoop___________________________________________________
.L3:
          # Emitting (b < 10)
            # Emitting 10
            movl $10, %edi
            # Emitting b
            pushl $0
            pushl %edi
# ____________var_____________________________________________________
            movl -4(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          cmpl %edi, %esi
          setl %al
          movzbl %al, %esi
        jge .L4
          # Emitting (...)
            # Emitting b = (b + 1)
# ____________assign__________________________________________________
              # Emitting (b + 1)
                # Emitting 1
                movl $1, %esi
                # Emitting b
                pushl $0
                pushl %esi
# ________________var_________________________________________________
                movl -4(%ebp), %esi
# ________________swap needed_________________________________________
                movl %esi, 4(%esp)
                popl %esi
                popl %edi
              add %esi, %edi
            movl %edi, -4(%ebp)
            # Emitting write(b)
              # Emitting b
# ______________var___________________________________________________
              movl -4(%ebp), %edi
            sub $16, %esp
            movl %edi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
        jmp .L3
.L4:
.L5:
    addl $4, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    # Emitting int foo(...) {...}
Main_foo:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting return 3
          # Emitting 3
          movl $3, %edi
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
