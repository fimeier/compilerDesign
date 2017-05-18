.section .data
	vtable_A:
		.int vtable_Object
	vtable_B:
		.int vtable_A
	vtable_Main_array:
		.int vtable_Object
	vtable_A_array:
		.int vtable_Object
	vtable_int_array:
		.int vtable_Object
	vtable_B_array:
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
  # Emitting class A {...}
  # Emitting class B {...}
  # Emitting class Main {...}
    # Emitting A[] a
    # Emitting B b
    # Emitting void main(...) {...}
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting b = (B)(a[0])
# ________assign______________________________________________________
          # Emitting (B)(a[0])
# __________cast______________________________________________________
# __________castTypeName______________________________________________
          movl $vtable_B, %edi
            # Emitting a[0]
              # Emitting a
# ______________var___________________________________________________
              movl 8(%ebp), %edx
              movl 4(%edx), %edx
              # Emitting 0
              movl $0, %ecx
            cmpl $0, %edx
            jne .L6
            movl $4, %eax
            jmp .ERROR_EXIT
.L6:
            cmpl $0, %ecx
            jge .L7
            movl $3, %eax
            jmp .ERROR_EXIT
.L7:
            cmpl 4(%edx), %ecx
            jl .L8
            movl $3, %eax
            jmp .ERROR_EXIT
.L8:
            imul $4, %ecx
            addl $8, %ecx
            addl %ecx, %edx
            movl (%edx), %edx
# __________rTypeRegister_____________________________________________
          movl %edx, %esi
          cmpl %edi, %esi
          je .L3
.L5:
          cmpl $0, %esi
          je .L2
          cmpl %edi, %esi
          je .L3
          movl (%esi), %esi
          jmp .L5
.L2:
          movl $1, %eax
          jmp .ERROR_EXIT
          jmp .L4
.L3:
.L4:
        movl 8(%ebp), %esi
        movl %edx, 8(%esi)
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
