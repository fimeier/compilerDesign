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
		.int Main_fib
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
        # Emitting a = this.fib(...)
# ________assign______________________________________________________
          # Emitting this.fib(...)
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
            # Emitting 20
            movl $20, %ecx
          pushl %ecx
          pushl %esi
          call %edi
          addl $8, %esp
          popl %edi
        movl %edi, -4(%ebp)
        # Emitting write(a)
          # Emitting a
# __________var_______________________________________________________
          movl -4(%ebp), %edi
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
    addl $4, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    # Emitting int fib(...) {...}
Main_fib:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    # variable fib
    pushl $0
    # variable fib2
    pushl $0
      # Emitting (...)
        # Emitting if ((n <= 1)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting (n <= 1)
            # Emitting 1
            movl $1, %edi
            # Emitting n
# ____________var_____________________________________________________
            movl 12(%ebp), %esi
          cmpl %edi, %esi
          setle %al
          movzbl %al, %esi
        jg .L3
          # Emitting (...)
            # Emitting fib = n
# ____________assign__________________________________________________
              # Emitting n
# ______________var___________________________________________________
              movl 12(%ebp), %esi
            movl %esi, -4(%ebp)
        jmp .L4
.L3:
          # Emitting (...)
            # Emitting fib = this.fib(...)
# ____________assign__________________________________________________
              # Emitting this.fib(...)
              pushl %edx
                # Emitting this
                movl 8(%ebp), %esi
              cmpl $0, %esi
              jne .L5
              movl $4, %eax
              jmp .ERROR_EXIT
.L5:
              movl 0(%esi), %edx
              movl 8(%edx), %edx
              subl $4, %esp
                # Emitting (n - 1)
                  # Emitting 1
                  movl $1, %ecx
                  # Emitting n
# __________________var_______________________________________________
                  movl 12(%ebp), %ebx
                sub %ecx, %ebx
              pushl %ebx
              pushl %esi
              call %edx
              addl $8, %esp
              popl %edx
            movl %edx, -4(%ebp)
            # Emitting fib2 = this.fib(...)
# ____________assign__________________________________________________
              # Emitting this.fib(...)
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
                # Emitting (n - 2)
                  # Emitting 2
                  movl $2, %ecx
                  # Emitting n
# __________________var_______________________________________________
                  movl 12(%ebp), %eax
                sub %ecx, %eax
              pushl %eax
              pushl %esi
              call %edx
              addl $8, %esp
              popl %edx
            movl %edx, -8(%ebp)
            # Emitting fib = (fib + fib2)
# ____________assign__________________________________________________
              # Emitting (fib + fib2)
                # Emitting fib2
# ________________var_________________________________________________
                movl -8(%ebp), %edx
                # Emitting fib
# ________________var_________________________________________________
                movl -4(%ebp), %esi
              add %edx, %esi
            movl %esi, -4(%ebp)
.L4:
        # Emitting return fib
          # Emitting fib
# __________var_______________________________________________________
          movl -4(%ebp), %esi
        movl %esi, 16(%ebp)
    addl $8, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
