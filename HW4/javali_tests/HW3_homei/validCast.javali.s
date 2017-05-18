.section .data
	vtable_A:
		.int vtable_Object
	vtable_B:
		.int vtable_Object
	vtable_S:
		.int vtable_A
	vtable_S_array:
		.int vtable_Object
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
  # Emitting class Main {...}
    # Emitting A a
    # Emitting S s
    # Emitting void main(...) {...}
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting a = new A()
# ________assign______________________________________________________
          # Emitting new A()
# __________newObject_________________________________________________
          pushl $4
          pushl $1
          call calloc
          addl $8, %esp
          movl $vtable_A, (%eax)
          movl %eax, %edi
        movl 8(%ebp), %esi
        movl %edi, 4(%esi)
        # Emitting s = new S()
# ________assign______________________________________________________
          # Emitting new S()
# __________newObject_________________________________________________
          pushl $4
          pushl $1
          call calloc
          addl $8, %esp
          movl $vtable_S, (%eax)
          movl %eax, %edi
        movl 8(%ebp), %esi
        movl %edi, 8(%esi)
        # Emitting a = new S()
# ________assign______________________________________________________
          # Emitting new S()
# __________newObject_________________________________________________
          pushl $4
          pushl $1
          call calloc
          addl $8, %esp
          movl $vtable_S, (%eax)
          movl %eax, %edi
        movl 8(%ebp), %esi
        movl %edi, 4(%esi)
        # Emitting a = (A)(s)
# ________assign______________________________________________________
          # Emitting (A)(s)
# __________cast______________________________________________________
# __________castTypeName______________________________________________
          movl $vtable_A, %edi
            # Emitting s
# ____________var_____________________________________________________
            movl 8(%ebp), %edx
            movl 8(%edx), %edx
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
        movl %edx, 4(%esi)
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
  # Emitting class B {...}
  # Emitting class A {...}
  # Emitting class S {...}
