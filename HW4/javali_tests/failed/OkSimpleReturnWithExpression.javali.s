.section .data
	vtable_Main_array:
		.int vtable_Object
	vtable_int_array:
		.int vtable_Object
	vtable_Object:
		.int 0
	vtable_Main:
		.int vtable_Object
		.int Main_m
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
  pushl $0
    # Emitting int m(...) {...}
    pushl $0
Main_m:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
      pushl $0
        # Emitting return ((a + b) + 1)
        pushl $0
          # Emitting ((a + b) + 1)
          pushl $0
            # Emitting (a + b)
            pushl $0
              # Emitting b
              pushl $0
# ______________var___________________________________________________
              movl 16(%ebp), %edi
              popl %esi
              # Emitting a
              pushl $0
              pushl %esi
              pushl %edi
# ______________var___________________________________________________
              movl 12(%ebp), %edi
# ______________swap needed___________________________________________
              movl %edi, 8(%esp)
              popl %esi
              popl %edi
              popl %edx
            add %esi, %edx
            popl %esi
            # Emitting 1
            pushl $0
            pushl %edx
            pushl %esi
            pushl %edi
            movl $1, %edi
# ____________swap needed_____________________________________________
            movl %edi, 12(%esp)
            popl %edx
            popl %esi
            popl %edi
            popl %ecx
          add %ecx, %esi
          popl %ecx
        movl %ecx, 20(%ebp)
        # restore old ebp
        movl %ebp, %esp
        popl %ebp
        ret
        addl $4, %esp
      addl $4, %esp
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    addl $4, %esp
    # Emitting void main(...) {...}
    pushl $0
    pushl %edx
    pushl %esi
    pushl %edi
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    # variable a
    pushl $0
    # variable res
    pushl $0
      # Emitting (...)
      pushl $0
        # Emitting res = -(1)
        pushl $0
# ________assign______________________________________________________
          # Emitting -(1)
          pushl $0
            # Emitting 1
            pushl $0
            movl $1, %edi
            popl %esi
          negl %esi
          popl %edx
        movl %edx, -8(%ebp)
        addl $4, %esp
        # Emitting res = this.m(...)
        pushl $0
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting this.m(...)
          pushl $0
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
          movl 4(%edi), %edi
          subl $4, %esp
            # Emitting a
            pushl $0
            pushl %edx
            pushl %esi
            pushl %edi
# ____________var_____________________________________________________
            movl -4(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 12(%esp)
            popl %edx
            popl %esi
            popl %edi
            popl %ecx
          pushl %ecx
            # Emitting a
            pushl $0
            pushl %ecx
            pushl %edx
            pushl %esi
            pushl %edi
# ____________var_____________________________________________________
            movl -4(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 16(%esp)
            popl %ecx
            popl %edx
            popl %esi
            popl %edi
            popl %ebx
          pushl %ebx
          pushl %esi
          call %edi
          addl $12, %esp
          popl %edi
          popl %esi
        movl %esi, -8(%ebp)
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting write(res)
        pushl $0
        pushl %ecx
        pushl %edx
        pushl %esi
        pushl %edi
          # Emitting res
          pushl $0
# __________var_______________________________________________________
          movl -8(%ebp), %edi
          popl %esi
        sub $16, %esp
        movl %esi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        popl %ecx
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting writeln()
        pushl $0
        pushl %ecx
        pushl %edx
        pushl %esi
        pushl %edi
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        popl %ecx
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting res = this.m(...)
        pushl $0
        pushl %ecx
        pushl %edx
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting this.m(...)
          pushl $0
            # Emitting this
            pushl $0
            pushl %edi
            movl 8(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          cmpl $0, %esi
          jne .L3
          movl $4, %eax
          jmp .ERROR_EXIT
.L3:
          movl 0(%esi), %edi
          movl 4(%edi), %edi
          subl $4, %esp
            # Emitting 2
            pushl $0
            pushl %edx
            pushl %esi
            pushl %edi
            movl $2, %edi
# ____________swap needed_____________________________________________
            movl %edi, 12(%esp)
            popl %edx
            popl %esi
            popl %edi
            popl %ecx
          pushl %ecx
            # Emitting 1
            pushl $0
            pushl %ecx
            pushl %edx
            pushl %esi
            pushl %edi
            movl $1, %edi
# ____________swap needed_____________________________________________
            movl %edi, 16(%esp)
            popl %ecx
            popl %edx
            popl %esi
            popl %edi
            popl %ebx
          pushl %ebx
          pushl %esi
          call %edi
          addl $12, %esp
          popl %edi
          popl %esi
        movl %esi, -8(%ebp)
        popl %ecx
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting write(res)
        pushl $0
        pushl %ecx
        pushl %edx
        pushl %esi
        pushl %edi
          # Emitting res
          pushl $0
# __________var_______________________________________________________
          movl -8(%ebp), %edi
          popl %esi
        sub $16, %esp
        movl %esi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        popl %ecx
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting writeln()
        pushl $0
        pushl %ecx
        pushl %edx
        pushl %esi
        pushl %edi
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        popl %ecx
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting write(this.m(...))
        pushl $0
        pushl %ecx
        pushl %edx
        pushl %esi
        pushl %edi
          # Emitting this.m(...)
          pushl $0
            # Emitting this
            pushl $0
            pushl %edi
            movl 8(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          cmpl $0, %esi
          jne .L4
          movl $4, %eax
          jmp .ERROR_EXIT
.L4:
          movl 0(%esi), %edi
          movl 4(%edi), %edi
          subl $4, %esp
            # Emitting 2
            pushl $0
            pushl %edx
            pushl %esi
            pushl %edi
            movl $2, %edi
# ____________swap needed_____________________________________________
            movl %edi, 12(%esp)
            popl %edx
            popl %esi
            popl %edi
            popl %ecx
          pushl %ecx
            # Emitting 1
            pushl $0
            pushl %ecx
            pushl %edx
            pushl %esi
            pushl %edi
            movl $1, %edi
# ____________swap needed_____________________________________________
            movl %edi, 16(%esp)
            popl %ecx
            popl %edx
            popl %esi
            popl %edi
            popl %ebx
          pushl %ebx
          pushl %esi
          call %edi
          addl $12, %esp
          popl %edi
          popl %esi
        sub $16, %esp
        movl %esi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        popl %ecx
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting writeln()
        pushl $0
        pushl %ecx
        pushl %edx
        pushl %esi
        pushl %edi
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        popl %ecx
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting write(this.m(...))
        pushl $0
        pushl %ecx
        pushl %edx
        pushl %esi
        pushl %edi
          # Emitting this.m(...)
          pushl $0
            # Emitting this
            pushl $0
            pushl %edi
            movl 8(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          cmpl $0, %esi
          jne .L5
          movl $4, %eax
          jmp .ERROR_EXIT
.L5:
          movl 0(%esi), %edi
          movl 4(%edi), %edi
          subl $4, %esp
            # Emitting 2
            pushl $0
            pushl %edx
            pushl %esi
            pushl %edi
            movl $2, %edi
# ____________swap needed_____________________________________________
            movl %edi, 12(%esp)
            popl %edx
            popl %esi
            popl %edi
            popl %ecx
          pushl %ecx
            # Emitting 1
            pushl $0
            pushl %ecx
            pushl %edx
            pushl %esi
            pushl %edi
            movl $1, %edi
# ____________swap needed_____________________________________________
            movl %edi, 16(%esp)
            popl %ecx
            popl %edx
            popl %esi
            popl %edi
            popl %ebx
          pushl %ebx
          pushl %esi
          call %edi
          addl $12, %esp
          popl %edi
          popl %esi
        sub $16, %esp
        movl %esi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        popl %ecx
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting writeln()
        pushl $0
        pushl %ecx
        pushl %edx
        pushl %esi
        pushl %edi
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        popl %ecx
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
      addl $4, %esp
    addl $8, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    popl %edx
    popl %esi
    popl %edi
    addl $4, %esp
  addl $4, %esp
