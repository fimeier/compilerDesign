.section .data
	vtable_A:
		.int vtable_B
		.int A_print
	vtable_B:
		.int vtable_C
	vtable_C:
		.int vtable_Object
	vtable_D:
		.int vtable_Object
		.int D_fun
	vtable_Main_array:
		.int vtable_Object
	vtable_A_array:
		.int vtable_Object
	vtable_int_array:
		.int vtable_Object
	vtable_D_array:
		.int vtable_Object
	vtable_C_array:
		.int vtable_Object
	vtable_B_array:
		.int vtable_Object
	vtable_Object:
		.int 0
	vtable_Main:
		.int vtable_D
		.int D_fun
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
  # Emitting class D {...}
  pushl $0
    # Emitting A fun(...) {...}
    pushl $0
D_fun:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    # variable a
    pushl $0
      # Emitting (...)
      pushl $0
        # Emitting return a
        pushl $0
          # Emitting a
          pushl $0
# __________var_______________________________________________________
          movl -4(%ebp), %edi
          popl %esi
        movl %esi, 12(%ebp)
        # restore old ebp
        movl %ebp, %esp
        popl %ebp
        ret
        addl $4, %esp
      addl $4, %esp
    addl $4, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    addl $4, %esp
  addl $4, %esp
  # Emitting class Main {...}
  pushl $0
  pushl %edi
    # Emitting D d
    pushl $0
    addl $4, %esp
    # Emitting void main(...) {...}
    pushl $0
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
      pushl $0
        # Emitting write(this.d.fun(...).foo)
        pushl $0
          # Emitting this.d.fun(...).foo
          pushl $0
            # Emitting this.d.fun(...)
            pushl $0
              # Emitting this.d
              pushl $0
              pushl %edi
                # Emitting this
                pushl $0
                movl 8(%ebp), %edi
                popl %esi
              cmpl $0, %esi
              jne .L2
              movl $4, %eax
              jmp .ERROR_EXIT
.L2:
              movl 4(%esi), %esi
              popl %edi
              popl %edx
            cmpl $0, %edx
            jne .L3
            movl $4, %eax
            jmp .ERROR_EXIT
.L3:
            movl 0(%edx), %edi
            movl 4(%edi), %edi
            subl $4, %esp
            pushl %edx
            call %edi
            addl $4, %esp
            popl %edi
            popl %edx
          cmpl $0, %edx
          jne .L4
          movl $4, %eax
          jmp .ERROR_EXIT
.L4:
          movl 4(%edx), %edx
          popl %ecx
        sub $16, %esp
        movl %ecx, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        addl $4, %esp
      addl $4, %esp
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    addl $4, %esp
  popl %edi
  addl $4, %esp
  # Emitting class A {...}
  pushl $0
  pushl %edx
  pushl %esi
  pushl %edi
    # Emitting void print(...) {...}
    pushl $0
A_print:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
      pushl $0
        # Emitting write(1)
        pushl $0
          # Emitting 1
          pushl $0
          movl $1, %edi
          popl %esi
        sub $16, %esp
        movl %esi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        addl $4, %esp
      addl $4, %esp
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    addl $4, %esp
  popl %edx
  popl %esi
  popl %edi
  addl $4, %esp
  # Emitting class B {...}
  pushl $0
  pushl %edx
  pushl %esi
  pushl %edi
    # Emitting int foo0
    pushl $0
    addl $4, %esp
  popl %edx
  popl %esi
  popl %edi
  addl $4, %esp
  # Emitting class C {...}
  pushl $0
  pushl %edx
  pushl %esi
  pushl %edi
    # Emitting int foo
    pushl $0
    addl $4, %esp
  popl %edx
  popl %esi
  popl %edi
  addl $4, %esp
