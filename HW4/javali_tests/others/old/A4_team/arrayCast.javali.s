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
        # Emitting a = new A[][1]
# ________assign______________________________________________________
          # Emitting new A[][1]
            # Emitting 1
            movl $1, %edi
          cmpl $0, %edi
          jge .L2
          movl $5, %eax
          jmp .ERROR_EXIT
.L2:
          addl $2, %edi
          pushl $4
          pushl %edi
          call calloc
          addl $8, %esp
          movl $vtable_Object, (%eax)
          movl %edi, 4(%eax)
          movl %eax, %esi
        movl 8(%ebp), %edx
        movl %esi, 4(%edx)
        # Emitting a[0] = new B()
# ________assign______________________________________________________
          # Emitting new B()
# __________newObject_________________________________________________
          pushl $4
          pushl $1
          call calloc
          addl $8, %esp
          movl $vtable_B, (%eax)
          movl %eax, %esi
          # Emitting a
# __________var_______________________________________________________
          movl 8(%ebp), %edx
          movl 4(%edx), %edx
          # Emitting 0
          movl $0, %ecx
        cmpl $0, %edx
        jne .L3
        movl $4, %eax
        jmp .ERROR_EXIT
.L3:
        cmpl $0, %ecx
        jge .L4
        movl $3, %eax
        jmp .ERROR_EXIT
.L4:
        cmpl 4(%edx), %ecx
        jl .L5
        movl $3, %eax
        jmp .ERROR_EXIT
.L5:
        imul $4, %ecx
        addl $8, %ecx
        addl %ecx, %edx
        movl %esi, (%edx)
        # Emitting b = (B)(a[0])
# ________assign______________________________________________________
          # Emitting (B)(a[0])
# __________cast______________________________________________________
# __________castTypeName______________________________________________
          movl $vtable_B, %esi
            # Emitting a[0]
              # Emitting a
# ______________var___________________________________________________
              movl 8(%ebp), %ecx
              movl 4(%ecx), %ecx
              # Emitting 0
              movl $0, %ebx
            cmpl $0, %ecx
            jne .L10
            movl $4, %eax
            jmp .ERROR_EXIT
.L10:
            cmpl $0, %ebx
            jge .L11
            movl $3, %eax
            jmp .ERROR_EXIT
.L11:
            cmpl 4(%ecx), %ebx
            jl .L12
            movl $3, %eax
            jmp .ERROR_EXIT
.L12:
            imul $4, %ebx
            addl $8, %ebx
            addl %ebx, %ecx
            movl (%ecx), %ecx
# __________rTypeRegister_____________________________________________
          movl %ecx, %edx
          cmpl %esi, %edx
          je .L7
.L9:
          cmpl $0, %edx
          je .L6
          cmpl %esi, %edx
          je .L7
          movl (%edx), %edx
          jmp .L9
.L6:
          movl $1, %eax
          jmp .ERROR_EXIT
          jmp .L8
.L7:
.L8:
        movl 8(%ebp), %edx
        movl %ecx, 8(%edx)
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
