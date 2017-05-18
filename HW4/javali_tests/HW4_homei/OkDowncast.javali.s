.section .data
	vtable_A:
		.int vtable_Object
		.int A_print
	vtable_B:
		.int vtable_A
		.int B_print
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
  # Emitting class A {...}
    # Emitting int a
    # Emitting int b
    # Emitting void print(...) {...}
A_print:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting a = 5
# ________assign______________________________________________________
          # Emitting 5
          movl $5, %edi
        movl 8(%ebp), %esi
        movl %edi, 4(%esi)
        # Emitting b = 5
# ________assign______________________________________________________
          # Emitting 5
          movl $5, %edi
        movl 8(%ebp), %esi
        movl %edi, 8(%esi)
        # Emitting write(a)
          # Emitting a
# __________var_______________________________________________________
          movl 8(%ebp), %edi
          movl 4(%edi), %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting write(b)
          # Emitting b
# __________var_______________________________________________________
          movl 8(%ebp), %edi
          movl 8(%edi), %edi
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
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
  # Emitting class B {...}
    # Emitting int b
    # Emitting void print(...) {...}
B_print:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting a = 6
# ________assign______________________________________________________
          # Emitting 6
          movl $6, %edi
        movl 8(%ebp), %esi
        movl %edi, 4(%esi)
        # Emitting b = 6
# ________assign______________________________________________________
          # Emitting 6
          movl $6, %edi
        movl 8(%ebp), %esi
        movl %edi, 8(%esi)
        # Emitting write(a)
          # Emitting a
# __________var_______________________________________________________
          movl 8(%ebp), %edi
          movl 4(%edi), %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting write(b)
          # Emitting b
# __________var_______________________________________________________
          movl 8(%ebp), %edi
          movl 8(%edi), %edi
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
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
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
        # Emitting a = new B()
# ________assign______________________________________________________
          # Emitting new B()
# __________newObject_________________________________________________
          pushl $4
          pushl $3
          call calloc
          addl $8, %esp
          movl $vtable_B, (%eax)
          movl %eax, %edi
        movl %edi, -4(%ebp)
        # Emitting b = (B)(a)
# ________assign______________________________________________________
          # Emitting (B)(a)
# __________cast______________________________________________________
# __________castTypeName______________________________________________
          movl $vtable_B, %edi
            # Emitting a
# ____________var_____________________________________________________
            movl -4(%ebp), %edx
# __________rTypeRegister_____________________________________________
          movl %edx, %esi
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
        movl %edx, -8(%ebp)
        # Emitting write(0)
          # Emitting 0
          movl $0, %edx
        sub $16, %esp
        movl %edx, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        # Emitting a.print(...)
          # Emitting a
# __________var_______________________________________________________
          movl -4(%ebp), %ecx
        cmpl $0, %ecx
        jne .L6
        movl $4, %eax
        jmp .ERROR_EXIT
.L6:
        movl 0(%ecx), %edx
        movl 4(%edx), %edx
        subl $4, %esp
        pushl %ecx
        call %edx
        addl $4, %esp
        popl %edx
        # Emitting b.print(...)
          # Emitting b
# __________var_______________________________________________________
          movl -8(%ebp), %ecx
        cmpl $0, %ecx
        jne .L7
        movl $4, %eax
        jmp .ERROR_EXIT
.L7:
        movl 0(%ecx), %edx
        movl 4(%edx), %edx
        subl $4, %esp
        pushl %ecx
        call %edx
        addl $4, %esp
        popl %edx
    addl $8, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
