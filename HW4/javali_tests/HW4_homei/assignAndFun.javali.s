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
		.int Main_fun
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
  # Emitting class Main {...}
    # Emitting int a
    # Emitting void main(...) {...}
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting this.fun(...)
          # Emitting this.fun(...)
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
            # Emitting 5
            pushl $0
            pushl %edx
            pushl %esi
            pushl %edi
            movl $5, %edi
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
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    # Emitting void fun(...) {...}
    pushl $0
    pushl %edx
Main_fun:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting this.a = a
# ________assign______________________________________________________
          # Emitting a
# __________var_______________________________________________________
          movl 12(%ebp), %edx
          # Emitting this
          pushl $0
          pushl %edx
          movl 8(%ebp), %edx
# __________swap needed_______________________________________________
          movl %edx, 4(%esp)
          popl %edx
          popl %edi
        cmpl $0, %edi
        jne .L3
        movl $4, %eax
        jmp .ERROR_EXIT
.L3:
        movl %edx, 4(%edi)
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
# ____NO swap needed__________________________________________________
    popl %edx
    addl $4, %esp
