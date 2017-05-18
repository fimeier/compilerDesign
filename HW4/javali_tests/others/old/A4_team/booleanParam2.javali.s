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
        # Emitting a = true
# ________assign______________________________________________________
          # Emitting true
          movl $1, %edi
        movl %edi, -4(%ebp)
        # Emitting a = this.foo(...)
# ________assign______________________________________________________
          # Emitting this.foo(...)
            # Emitting this
            movl 8(%ebp), %esi
          cmpl $0, %esi
          jne .L2
          movl $4, %eax
          jmp .ERROR_EXIT
.L2:
          movl 0(%esi), %edi
          movl 8(%edi), %edi
          subl $4, %esp
            # Emitting ((a || false) && true)
              # Emitting (a || false)
                # Emitting false
                movl $0, %ecx
                # Emitting a
# ________________var_________________________________________________
                movl -4(%ebp), %ebx
              orl %ecx, %ebx
              cmpl $0, %ebx
              # Emitting true
              movl $1, %ecx
            andl %ecx, %ebx
            cmpl $0, %ebx
          pushl %ebx
          pushl %esi
          call %edi
          addl $8, %esp
          popl %edi
        movl %edi, -4(%ebp)
        # Emitting b = (true && a)
# ________assign______________________________________________________
          # Emitting (true && a)
            # Emitting a
# ____________var_____________________________________________________
            movl -4(%ebp), %edi
            # Emitting true
            movl $1, %esi
          andl %edi, %esi
          cmpl $0, %esi
        movl %esi, -8(%ebp)
        # Emitting b = true
# ________assign______________________________________________________
          # Emitting true
          movl $1, %esi
        movl %esi, -8(%ebp)
        # Emitting if (b) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting b
# __________var_______________________________________________________
          movl -8(%ebp), %esi
        cmpl $0, %esi
        je .L4
          # Emitting (...)
            # Emitting write(1)
              # Emitting 1
              movl $1, %esi
            sub $16, %esp
            movl %esi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
        jmp .L5
.L4:
          # Emitting (...)
            # Emitting if ((a || a)) {...} else {...}
# ____________ifElse__________________________________________________
              # Emitting (a || a)
                # Emitting a
# ________________var_________________________________________________
                movl -4(%ebp), %esi
                # Emitting a
# ________________var_________________________________________________
                movl -4(%ebp), %edi
              orl %esi, %edi
              cmpl $0, %edi
            je .L7
              # Emitting (...)
                # Emitting write(2)
                  # Emitting 2
                  movl $2, %edi
                sub $16, %esp
                movl %edi, 4(%esp)
                movl $STR_D, 0(%esp)
                call printf
                add $16, %esp
            jmp .L8
.L7:
              # Emitting nop
.L8:
.L5:
    addl $8, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    # Emitting boolean foo(...) {...}
Main_foo:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting return (a && false)
          # Emitting (a && false)
            # Emitting false
            movl $0, %edi
            # Emitting a
# ____________var_____________________________________________________
            movl 12(%ebp), %esi
          andl %edi, %esi
          cmpl $0, %esi
        movl %esi, 16(%ebp)
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
