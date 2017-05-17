.section .data
	vtable_A:
		.int vtable_Object
	vtable_B:
		.int vtable_A
	vtable_C:
		.int vtable_Object
	vtable_Main_array:
		.int vtable_Object
	vtable_A_array:
		.int vtable_Object
	vtable_int_array:
		.int vtable_Object
	vtable_C_array:
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
    # Emitting C c
  # Emitting class B {...}
  # Emitting class C {...}
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
    # variable i
    pushl $0
      # Emitting (...)
        # Emitting i = 4
# ________assign______________________________________________________
          # Emitting 4
          movl $4, %edi
        movl %edi, -12(%ebp)
        # Emitting if ((i > 4)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting (i > 4)
            # Emitting 4
            movl $4, %edi
            # Emitting i
# ____________var_____________________________________________________
            movl -12(%ebp), %esi
          cmpl %edi, %esi
          setg %al
          movzbl %al, %esi
        jle .L2
          # Emitting (...)
            # Emitting a = new A()
# ____________assign__________________________________________________
              # Emitting new A()
# ______________newObject_____________________________________________
              pushl $4
              pushl $2
              call calloc
              addl $8, %esp
              movl $vtable_A, (%eax)
              movl %eax, %esi
            movl %esi, -4(%ebp)
        jmp .L3
.L2:
          # Emitting (...)
            # Emitting a = new B()
# ____________assign__________________________________________________
              # Emitting new B()
# ______________newObject_____________________________________________
              pushl $4
              pushl $2
              call calloc
              addl $8, %esp
              movl $vtable_B, (%eax)
              movl %eax, %esi
            movl %esi, -4(%ebp)
.L3:
        # Emitting b = (B)(a)
# ________assign______________________________________________________
          # Emitting (B)(a)
# __________cast______________________________________________________
# __________castTypeName______________________________________________
          movl $vtable_B, %esi
            # Emitting a
# ____________var_____________________________________________________
            movl -4(%ebp), %edx
# __________rTypeRegister_____________________________________________
          movl %edx, %edi
.L7:
          cmpl $0, %edi
          je .L4
          cmpl %esi, %edi
          je .L5
          movl (%edi), %edi
          jmp .L7
.L4:
          movl $1, %eax
          jmp .ERROR_EXIT
          jmp .L6
.L5:
.L6:
        movl %edx, -8(%ebp)
    addl $12, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
