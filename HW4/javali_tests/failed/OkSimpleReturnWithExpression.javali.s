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
              pushl %edi
# ______________var___________________________________________________
              movl 12(%ebp), %esi
              popl %edi
            add %edi, %esi
            # Emitting 1
            pushl %esi
            movl $1, %edi
            popl %esi
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
    # variable a
    pushl $0
    # variable res
    pushl $0
      # Emitting (...)
        # Emitting res = -(1)
# ________assign______________________________________________________
          # Emitting -(1)
            # Emitting 1
            movl $1, %esi
          negl %esi
        movl %esi, -8(%ebp)
        # Emitting res = this.m(...)
# ________assign______________________________________________________
          # Emitting this.m(...)
            # Emitting this
            pushl %esi
            movl 8(%ebp), %edi
            popl %esi
          cmpl $0, %edi
          jne .L2
          movl $4, %eax
          jmp .ERROR_EXIT
.L2:
          movl 0(%edi), %esi
          movl 4(%esi), %esi
          subl $4, %esp
            # Emitting a
            pushl %edx
            pushl %esi
            pushl %edi
# ____________var_____________________________________________________
            movl -4(%ebp), %ecx
            popl %edi
            popl %esi
            popl %edx
          pushl %ecx
            # Emitting a
            pushl %ecx
            pushl %edx
            pushl %esi
            pushl %edi
# ____________var_____________________________________________________
            movl -4(%ebp), %ebx
            popl %edi
            popl %esi
            popl %edx
            popl %ecx
          pushl %ebx
          pushl %edi
          call %esi
          addl $12, %esp
          popl %esi
        movl %esi, -8(%ebp)
        # Emitting write(res)
        pushl %ecx
        pushl %edx
          # Emitting res
          pushl %ecx
          pushl %edx
# __________var_______________________________________________________
          movl -8(%ebp), %esi
          popl %edx
          popl %ecx
        sub $16, %esp
        movl %esi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        popl %edx
        popl %ecx
        # Emitting writeln()
        pushl %ecx
        pushl %edx
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        popl %edx
        popl %ecx
        # Emitting res = this.m(...)
        pushl %ecx
        pushl %edx
# ________assign______________________________________________________
          # Emitting this.m(...)
          pushl %ecx
          pushl %edx
          pushl %ecx
          pushl %edx
            # Emitting this
            pushl %edx
            movl 8(%ebp), %ecx
            popl %edx
          cmpl $0, %ecx
          jne .L3
          movl $4, %eax
          jmp .ERROR_EXIT
.L3:
          movl 0(%ecx), %edx
          movl 4(%edx), %edx
          subl $4, %esp
            # Emitting 2
            pushl %ecx
            pushl %edx
            pushl %esi
            movl $2, %edi
            popl %esi
            popl %edx
            popl %ecx
          pushl %edi
            # Emitting 1
            pushl %ecx
            pushl %edx
            pushl %esi
            pushl %edi
            movl $1, %ebx
            popl %edi
            popl %esi
            popl %edx
            popl %ecx
          pushl %ebx
          pushl %ecx
          call %edx
          addl $12, %esp
          popl %edx
# __________swap needed_______________________________________________
          movl %edx, %ecx
          popl %ecx
        movl %ecx, -8(%ebp)
        # Emitting write(res)
        pushl %esi
        pushl %edi
          # Emitting res
          pushl %esi
          pushl %edi
# __________var_______________________________________________________
          movl -8(%ebp), %ecx
          popl %edi
          popl %esi
        sub $16, %esp
        movl %ecx, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        popl %edi
        popl %esi
        # Emitting writeln()
        pushl %esi
        pushl %edi
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        popl %edi
        popl %esi
        # Emitting write(this.m(...))
        pushl %esi
        pushl %edi
          # Emitting this.m(...)
          pushl %esi
          pushl %edi
            # Emitting this
            pushl %ecx
            pushl %esi
            pushl %edi
            movl 8(%ebp), %edx
            popl %edi
            popl %esi
            popl %ecx
          cmpl $0, %edx
          jne .L4
          movl $4, %eax
          jmp .ERROR_EXIT
.L4:
          movl 0(%edx), %ecx
          movl 4(%ecx), %ecx
          subl $4, %esp
            # Emitting 2
            pushl %ebx
            pushl %ecx
            pushl %edx
            pushl %esi
            pushl %edi
            movl $2, %eax
            popl %edi
            popl %esi
            popl %edx
            popl %ecx
            popl %ebx
          pushl %eax
            # Emitting 1
            pushl %eax
            pushl %ebx
            pushl %ecx
            pushl %edx
            pushl %esi
            pushl %edi
