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
    # Emitting int m(...) {...}
Main_m:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting return ((a + b) + 1)
          # Emitting ((a + b) + 1)
            # Emitting (a + b)
              # Emitting b
# ______________var___________________________________________________
              movl 16(%ebp), %edi
              # Emitting a
              pushl $0
              pushl %edi
# ______________var___________________________________________________
              movl 12(%ebp), %edi
# ______________swap needed___________________________________________
              movl %edi, 4(%esp)
              popl %edi
              popl %esi
            add %edi, %esi
            # Emitting 1
            pushl $0
            pushl %esi
            movl $1, %esi
# ____________swap needed_____________________________________________
            movl %esi, 4(%esp)
            popl %esi
            popl %edi
          add %edi, %esi
        movl %esi, 20(%ebp)
        # restore old ebp
        movl %ebp, %esp
        popl %ebp
        ret
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    # Emitting void main(...) {...}
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    # variable res
    pushl $0
      # Emitting (...)
        # Emitting res = -(1)
# ________assign______________________________________________________
          # Emitting -(1)
            # Emitting 1
            movl $1, %esi
          negl %esi
        movl %esi, -4(%ebp)
        # Emitting res = this.m(...)
# ________assign______________________________________________________
          # Emitting this.m(...)
            # Emitting this
            pushl $0
            pushl %esi
            movl 8(%ebp), %esi
# ____________swap needed_____________________________________________
            movl %esi, 4(%esp)
            popl %esi
            popl %edi
          cmpl $0, %edi
          jne .L2
          movl $4, %eax
          jmp .ERROR_EXIT
.L2:
          movl 0(%edi), %esi
          movl 4(%esi), %esi
          subl $4, %esp
            # Emitting 2
            pushl $0
            pushl %edx
            pushl %esi
            pushl %edi
            movl $2, %edi
# ____________swap needed_____________________________________________
            movl %edi, 12(%esp)
            popl %edi
            popl %esi
            popl %edx
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
            popl %edi
            popl %esi
            popl %edx
            popl %ecx
            popl %ebx
          pushl %ebx
          pushl %edi
          call %esi
          addl $12, %esp
          popl %esi
        movl %esi, -4(%ebp)
        # Emitting write(res)
        pushl $0
        pushl %ecx
        pushl %edx
          # Emitting res
# __________var_______________________________________________________
          movl -4(%ebp), %edx
        sub $16, %esp
        movl %edx, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
# ________NO swap needed______________________________________________
        popl %edx
        popl %ecx
        addl $4, %esp
        # Emitting writeln()
        pushl $0
        pushl %ecx
        pushl %edx
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
# ________NO swap needed______________________________________________
        popl %edx
        popl %ecx
        addl $4, %esp
        # Emitting res = this.m(...)
        pushl $0
        pushl %ecx
        pushl %edx
# ________assign______________________________________________________
          # Emitting this.m(...)
            # Emitting this
            pushl $0
            pushl %edx
            movl 8(%ebp), %edx
# ____________swap needed_____________________________________________
            movl %edx, 4(%esp)
            popl %edx
            popl %ecx
          cmpl $0, %ecx
          jne .L3
          movl $4, %eax
          jmp .ERROR_EXIT
.L3:
          movl 0(%ecx), %edx
          movl 4(%edx), %edx
          subl $4, %esp
            # Emitting 2
            pushl $0
            pushl %ecx
            pushl %edx
            pushl %esi
            movl $2, %esi
# ____________swap needed_____________________________________________
            movl %esi, 12(%esp)
            popl %esi
            popl %edx
            popl %ecx
            popl %edi
          pushl %edi
            # Emitting 1
            pushl $0
            pushl %ecx
            pushl %edx
            pushl %esi
            pushl %edi
            movl $1, %edi
# ____________swap needed_____________________________________________
            movl %edi, 16(%esp)
            popl %edi
            popl %esi
            popl %edx
            popl %ecx
            popl %ebx
          pushl %ebx
          pushl %ecx
          call %edx
          addl $12, %esp
          popl %edx
        movl %edx, -4(%ebp)
# ________NO swap needed______________________________________________
        popl %edx
        popl %ecx
        addl $4, %esp
        # Emitting write(res)
        pushl $0
        pushl %ecx
        pushl %edx
        pushl %esi
        pushl %edi
          # Emitting res
# __________var_______________________________________________________
          movl -4(%ebp), %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
# ________NO swap needed______________________________________________
        popl %edi
        popl %esi
        popl %edx
        popl %ecx
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
# ________NO swap needed______________________________________________
        popl %edi
        popl %esi
        popl %edx
        popl %ecx
        addl $4, %esp
        # Emitting write(this.m(...))
        pushl $0
        pushl %ecx
        pushl %edx
        pushl %esi
        pushl %edi
          # Emitting this.m(...)
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
            popl %edi
            popl %esi
            popl %edx
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
            popl %edi
            popl %esi
            popl %edx
            popl %ecx
            popl %ebx
          pushl %ebx
          pushl %esi
          call %edi
          addl $12, %esp
          popl %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
# ________NO swap needed______________________________________________
        popl %edi
        popl %esi
        popl %edx
