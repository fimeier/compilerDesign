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
      # Emitting (...)
        # Emitting if (((true && false) || true)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting ((true && false) || true)
            # Emitting (true && false)
              # Emitting false
              movl $0, %edi
              # Emitting true
              movl $1, %esi
            andl %edi, %esi
            cmpl $0, %esi
            # Emitting true
            movl $1, %edi
          orl %edi, %esi
          cmpl $0, %esi
        je .L2
          # Emitting (...)
            # Emitting write(0)
              # Emitting 0
              movl $0, %esi
            sub $16, %esp
            movl %esi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
        jmp .L3
.L2:
          # Emitting (...)
            # Emitting write(1)
              # Emitting 1
              movl $1, %esi
            sub $16, %esp
            movl %esi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
.L3:
        # Emitting a = this.foo(...)
# ________assign______________________________________________________
          # Emitting this.foo(...)
            # Emitting this
            movl 8(%ebp), %edi
          movl 0(%edi), %esi
          movl 8(%esi), %esi
          subl $4, %esp
            # Emitting (true && false)
              # Emitting false
              movl $0, %ecx
              # Emitting true
              movl $1, %ebx
            andl %ecx, %ebx
            cmpl $0, %ebx
          pushl %ebx
            # Emitting ((true && false) || true)
              # Emitting (true && false)
                # Emitting false
                movl $0, %ecx
                # Emitting true
                movl $1, %eax
              andl %ecx, %eax
              cmpl $0, %eax
              # Emitting true
              movl $1, %ecx
            orl %ecx, %eax
            cmpl $0, %eax
          pushl %eax
          pushl %edi
          call %esi
          addl $12, %esp
          popl %esi
        movl %esi, -4(%ebp)
        # Emitting write(a)
          # Emitting a
# __________var_______________________________________________________
          movl -4(%ebp), %esi
        sub $16, %esp
        movl %esi, 4(%esp)
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
    pushl %ebx
    # set local variables:
      # Emitting (...)
        # Emitting if ((a && b)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting (a && b)
            # Emitting b
# ____________var_____________________________________________________
            movl 16(%ebp), %ebx
            # Emitting a
# ____________var_____________________________________________________
            movl 12(%ebp), %esi
          andl %ebx, %esi
          cmpl $0, %esi
        je .L4
          # Emitting (...)
            # Emitting return 3
              # Emitting 3
              movl $3, %esi
            movl %esi, 20(%ebp)
        jmp .L5
.L4:
          # Emitting (...)
            # Emitting return 5
              # Emitting 5
              movl $5, %esi
            movl %esi, 20(%ebp)
.L5:
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
