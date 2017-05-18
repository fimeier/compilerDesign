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
pushl $3
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
    # Emitting int a
    # Emitting int b
    # Emitting void main(...) {...}
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    # variable c
    pushl $0
      # Emitting (...)
        # Emitting this.a = 7
# ________assign______________________________________________________
          # Emitting 7
          movl $7, %edi
          # Emitting this
          movl 8(%ebp), %esi
        cmpl $0, %esi
        jne .L2
        movl $4, %eax
        jmp .ERROR_EXIT
.L2:
        movl %edi, 4(%esi)
        # Emitting b = 8
# ________assign______________________________________________________
          # Emitting 8
          movl $8, %edi
        movl 8(%ebp), %esi
        movl %edi, 8(%esi)
        # Emitting c = this.b
# ________assign______________________________________________________
          # Emitting this.b
            # Emitting this
            movl 8(%ebp), %edi
          cmpl $0, %edi
          jne .L3
          movl $4, %eax
          jmp .ERROR_EXIT
.L3:
          movl 8(%edi), %edi
        movl %edi, -4(%ebp)
        # Emitting c = a
# ________assign______________________________________________________
          # Emitting a
# __________var_______________________________________________________
          movl 8(%ebp), %edi
          movl 4(%edi), %edi
        movl %edi, -4(%ebp)
        # Emitting a = this.foo(...)
# ________assign______________________________________________________
          # Emitting this.foo(...)
            # Emitting this
            movl 8(%ebp), %esi
          cmpl $0, %esi
          jne .L4
          movl $4, %eax
          jmp .ERROR_EXIT
.L4:
          movl 0(%esi), %edi
          movl 8(%edi), %edi
          subl $4, %esp
            # Emitting this.b
              # Emitting this
              movl 8(%ebp), %ecx
            cmpl $0, %ecx
            jne .L5
            movl $4, %eax
            jmp .ERROR_EXIT
.L5:
            movl 8(%ecx), %ecx
          pushl %ecx
          pushl %esi
          call %edi
          addl $8, %esp
          popl %edi
        movl 8(%ebp), %esi
        movl %edi, 4(%esi)
        # Emitting write(a)
          # Emitting a
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
        # Emitting write(this.b)
          # Emitting this.b
            # Emitting this
            movl 8(%ebp), %edi
          cmpl $0, %edi
          jne .L6
          movl $4, %eax
          jmp .ERROR_EXIT
.L6:
          movl 8(%edi), %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
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
        # Emitting this.a = a
# ________assign______________________________________________________
          # Emitting a
# __________var_______________________________________________________
          movl 12(%ebp), %edi
          # Emitting this
          movl 8(%ebp), %esi
        cmpl $0, %esi
        jne .L7
        movl $4, %eax
        jmp .ERROR_EXIT
.L7:
        movl %edi, 4(%esi)
        # Emitting return (2 * a)
          # Emitting (2 * a)
            # Emitting a
# ____________var_____________________________________________________
            movl 12(%ebp), %edi
            # Emitting 2
            movl $2, %esi
          imul %edi, %esi
        movl %esi, 16(%ebp)
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
