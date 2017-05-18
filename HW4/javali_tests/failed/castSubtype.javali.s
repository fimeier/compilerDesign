.section .data
	vtable_A:
		.int vtable_Object
	vtable_R:
		.int vtable_C
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
	vtable_Object:
		.int 0
	vtable_R_array:
		.int vtable_Object
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
    # Emitting C c
    # Emitting R r
    # Emitting void main(...) {...}
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting r = new R()
# ________assign______________________________________________________
          # Emitting new R()
# __________newObject_________________________________________________
          pushl $4
          pushl $1
          call calloc
          addl $8, %esp
          movl $vtable_R, (%eax)
          movl %eax, %edi
        movl 8(%ebp), %esi
        movl %edi, 8(%esi)
        # Emitting c = r
# ________assign______________________________________________________
          # Emitting r
# __________var_______________________________________________________
          movl 8(%ebp), %edi
          movl 8(%edi), %edi
        movl 8(%ebp), %esi
        movl %edi, 4(%esi)
        # Emitting r = (R)(c)
# ________assign______________________________________________________
          # Emitting (R)(c)
# __________cast______________________________________________________
# __________castTypeName______________________________________________
          movl $vtable_R, %edi
            # Emitting c
            pushl $0
            pushl %esi
            pushl %edi
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 4(%edi), %edi
# ____________swap needed_____________________________________________
            movl %edi, 8(%esp)
            popl %edi
            popl %esi
            popl %edx
# __________rTypeRegister_____________________________________________
          movl %edx, %esi
          cmpl $0, %esi
          je .L3
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
        # Emitting c = (C)(r)
# ________assign______________________________________________________
          # Emitting (C)(r)
# __________cast______________________________________________________
# __________castTypeName______________________________________________
          movl $vtable_C, %edx
            # Emitting r
            pushl $0
            pushl %edx
            pushl %esi
# ____________var_____________________________________________________
            movl 8(%ebp), %esi
            movl 8(%esi), %esi
# ____________swap needed_____________________________________________
            movl %esi, 8(%esp)
            popl %esi
            popl %edx
            popl %edi
# __________rTypeRegister_____________________________________________
          movl %edi, %esi
          cmpl $0, %esi
          je .L7
          cmpl %edx, %esi
          je .L7
.L9:
          cmpl $0, %esi
          je .L6
          cmpl %edx, %esi
          je .L7
          movl (%esi), %esi
          jmp .L9
.L6:
          movl $1, %eax
          jmp .ERROR_EXIT
          jmp .L8
.L7:
.L8:
        movl 8(%ebp), %esi
        movl %edi, 4(%esi)
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
  # Emitting class A {...}
  # Emitting class C {...}
  # Emitting class R {...}
