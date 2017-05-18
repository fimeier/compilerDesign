.section .data
	vtable_A:
		.int vtable_Object
		.int A_foo
		.int A_bar
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
        # Emitting a = a.foo(...)
# ________assign______________________________________________________
          # Emitting a.foo(...)
            # Emitting a
# ____________var_____________________________________________________
            movl -4(%ebp), %esi
          cmpl $0, %esi
          jne .L2
          movl $4, %eax
          jmp .ERROR_EXIT
.L2:
          movl 0(%esi), %edi
          movl 4(%edi), %edi
          subl $4, %esp
            # Emitting 41
            movl $41, %ecx
          pushl %ecx
          pushl %esi
          call %edi
          addl $8, %esp
          popl %edi
        movl %edi, -4(%ebp)
    addl $4, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
  # Emitting class A {...}
    # Emitting int x
    # Emitting A foo(...) {...}
A_foo:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting this.x = 1
# ________assign______________________________________________________
          # Emitting 1
          movl $1, %edi
          # Emitting this
          movl 8(%ebp), %esi
        cmpl $0, %esi
        jne .L3
        movl $4, %eax
        jmp .ERROR_EXIT
.L3:
        movl %edi, 4(%esi)
        # Emitting write(this.bar(...))
          # Emitting this.bar(...)
          pushl %edx
            # Emitting this
            movl 8(%ebp), %edi
          cmpl $0, %edi
          jne .L4
          movl $4, %eax
          jmp .ERROR_EXIT
.L4:
          movl 0(%edi), %edx
          movl 8(%edx), %edx
          subl $4, %esp
            # Emitting i
# ____________var_____________________________________________________
            movl 12(%ebp), %ecx
          pushl %ecx
          pushl %edi
          call %edx
          addl $8, %esp
          popl %edx
        sub $16, %esp
        movl %edx, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting return this
          # Emitting this
          movl 8(%ebp), %edx
        movl %edx, 16(%ebp)
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    # Emitting int bar(...) {...}
A_bar:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    pushl %esi
    # set local variables:
      # Emitting (...)
        # Emitting return (i + this.x)
          # Emitting (i + this.x)
            # Emitting this.x
              # Emitting this
              movl 8(%ebp), %esi
            cmpl $0, %esi
            jne .L5
            movl $4, %eax
            jmp .ERROR_EXIT
.L5:
            movl 4(%esi), %esi
            # Emitting i
# ____________var_____________________________________________________
            movl 12(%ebp), %edx
          add %esi, %edx
        movl %edx, 16(%ebp)
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
