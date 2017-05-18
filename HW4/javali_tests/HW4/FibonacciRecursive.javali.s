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
            # Emitting 20
            pushl $0
            pushl %edx
            pushl %esi
            pushl %edi
            movl $20, %edi
# ____________swap needed_____________________________________________
            movl %edi, 12(%esp)
            popl %edi
            popl %esi
            popl %edx
            popl %ecx
          pushl %ecx
          pushl %esi
          call %edi
          addl $8, %esp
          popl %edi
        movl %edi, -4(%ebp)
        # Emitting write(a)
        pushl $0
        pushl %edx
          # Emitting a
# __________var_______________________________________________________
          movl -4(%ebp), %edx
        sub $16, %esp
        movl %edx, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
# ________NO swap needed______________________________________________
        popl %edx
        addl $4, %esp
        # Emitting writeln()
        pushl $0
        pushl %edx
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
# ________NO swap needed______________________________________________
        popl %edx
        addl $4, %esp
    addl $4, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    # Emitting int fib(...) {...}
    pushl $0
    pushl %edx
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
            movl $1, %edx
            # Emitting n
            pushl $0
            pushl %edx
# ____________var_____________________________________________________
            movl 12(%ebp), %edx
# ____________swap needed_____________________________________________
            movl %edx, 4(%esp)
            popl %edx
            popl %edi
          cmpl %edx, %edi
          setle %al
          movzbl %al, %edi
        jg .L4
          # Emitting (...)
            # Emitting fib = n
# ____________assign__________________________________________________
              # Emitting n
# ______________var___________________________________________________
              movl 12(%ebp), %edi
            movl %edi, -4(%ebp)
        jmp .L5
.L4:
          # Emitting (...)
            # Emitting fib = this.fib(...)
# ____________assign__________________________________________________
              # Emitting this.fib(...)
                # Emitting this
                pushl $0
                pushl %edi
                movl 8(%ebp), %edi
# ________________swap needed_________________________________________
                movl %edi, 4(%esp)
                popl %edi
                popl %edx
              cmpl $0, %edx
              jne .L6
              movl $4, %eax
              jmp .ERROR_EXIT
.L6:
              movl 0(%edx), %edi
              movl 8(%edi), %edi
              subl $4, %esp
                # Emitting (n - 1)
                pushl $0
                pushl %edx
                pushl %esi
                pushl %edi
                  # Emitting 1
                  movl $1, %edi
                  # Emitting n
                  pushl $0
                  pushl %edi
# __________________var_______________________________________________
                  movl 12(%ebp), %edi
# __________________swap needed_______________________________________
                  movl %edi, 4(%esp)
                  popl %edi
                  popl %esi
                sub %edi, %esi
# ________________swap needed_________________________________________
                movl %esi, 12(%esp)
                popl %edi
                popl %esi
                popl %edx
                popl %ecx
              pushl %ecx
              pushl %edx
              call %edi
              addl $8, %esp
              popl %edi
            movl %edi, -4(%ebp)
            # Emitting fib2 = this.fib(...)
            pushl $0
            pushl %esi
# ____________assign__________________________________________________
              # Emitting this.fib(...)
                # Emitting this
                pushl $0
                pushl %esi
                movl 8(%ebp), %esi
# ________________swap needed_________________________________________
                movl %esi, 4(%esp)
                popl %esi
                popl %edi
              cmpl $0, %edi
              jne .L7
              movl $4, %eax
              jmp .ERROR_EXIT
.L7:
              movl 0(%edi), %esi
              movl 8(%esi), %esi
              subl $4, %esp
                # Emitting (n - 2)
                pushl $0
                pushl %edx
                pushl %esi
                pushl %edi
                  # Emitting 2
                  movl $2, %edi
                  # Emitting n
                  pushl $0
                  pushl %edi
# __________________var_______________________________________________
                  movl 12(%ebp), %edi
# __________________swap needed_______________________________________
                  movl %edi, 4(%esp)
                  popl %edi
                  popl %esi
                sub %edi, %esi
# ________________swap needed_________________________________________
                movl %esi, 12(%esp)
                popl %edi
                popl %esi
                popl %edx
                popl %ecx
              pushl %ecx
              pushl %edi
              call %esi
              addl $8, %esp
              popl %esi
            movl %esi, -8(%ebp)
# ____________NO swap needed__________________________________________
            popl %esi
            addl $4, %esp
            # Emitting fib = (fib + fib2)
            pushl $0
            pushl %edx
            pushl %esi
# ____________assign__________________________________________________
              # Emitting (fib + fib2)
                # Emitting fib2
# ________________var_________________________________________________
                movl -8(%ebp), %esi
                # Emitting fib
                pushl $0
                pushl %esi
# ________________var_________________________________________________
                movl -4(%ebp), %esi
# ________________swap needed_________________________________________
                movl %esi, 4(%esp)
                popl %esi
                popl %edx
              add %esi, %edx
            movl %edx, -4(%ebp)
# ____________NO swap needed__________________________________________
            popl %esi
            popl %edx
            addl $4, %esp
.L5:
        # Emitting return fib
        pushl $0
        pushl %edx
        pushl %esi
          # Emitting fib
# __________var_______________________________________________________
          movl -4(%ebp), %esi
        movl %esi, 16(%ebp)
        # restore old ebp
        movl %ebp, %esp
        popl %ebp
        ret
# ________NO swap needed______________________________________________
        popl %esi
        popl %edx
        addl $4, %esp
    addl $8, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
# ____NO swap needed__________________________________________________
    popl %edx
    addl $4, %esp
