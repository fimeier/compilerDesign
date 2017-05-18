.section .data
	vtable_A:
		.int vtable_Object
	vtable_B:
		.int vtable_A
	vtable_C:
		.int vtable_B
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
		.int Main_foo
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
pushl $5
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
    # Emitting B b
    # Emitting C c
    # Emitting int i
    # Emitting void main(...) {...}
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    # Emitting void foo(...) {...}
Main_foo:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    # variable x
    pushl $0
      # Emitting (...)
        # Emitting c = new C()
# ________assign______________________________________________________
          # Emitting new C()
# __________newObject_________________________________________________
          pushl $4
          pushl $4
          call calloc
          addl $8, %esp
          movl $vtable_C, (%eax)
          movl %eax, %edi
        movl 8(%ebp), %esi
        movl %edi, 12(%esi)
        # Emitting x = c.b.i
# ________assign______________________________________________________
          # Emitting c.b.i
            # Emitting c.b
              # Emitting c
# ______________var___________________________________________________
              movl 8(%ebp), %edi
              movl 12(%edi), %edi
            cmpl $0, %edi
            jne .L2
            movl $4, %eax
            jmp .ERROR_EXIT
.L2:
            movl 4(%edi), %edi
          cmpl $0, %edi
          jne .L3
          movl $4, %eax
          jmp .ERROR_EXIT
.L3:
          movl 8(%edi), %edi
        movl %edi, -4(%ebp)
        # Emitting x = i
# ________assign______________________________________________________
          # Emitting i
# __________var_______________________________________________________
          movl 12(%ebp), %edi
        movl %edi, -4(%ebp)
        # Emitting i = this.i
# ________assign______________________________________________________
          # Emitting this.i
            # Emitting this
            movl 8(%ebp), %edi
          cmpl $0, %edi
          jne .L4
          movl $4, %eax
          jmp .ERROR_EXIT
.L4:
          movl 16(%edi), %edi
        movl %edi, 12(%ebp)
        # Emitting b = (B)(a)
# ________assign______________________________________________________
          # Emitting (B)(a)
# __________cast______________________________________________________
# __________castTypeName______________________________________________
          movl $vtable_B, %edi
            # Emitting a
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
          je .L6
          cmpl %edi, %esi
          je .L6
.L8:
          cmpl $0, %esi
          je .L5
          cmpl %edi, %esi
          je .L6
          movl (%esi), %esi
          jmp .L8
.L5:
          movl $1, %eax
          jmp .ERROR_EXIT
          jmp .L7
.L6:
.L7:
        movl 8(%ebp), %esi
        movl %edx, 8(%esi)
        # Emitting this.i = b.x
# ________assign______________________________________________________
          # Emitting b.x
            # Emitting b
# ____________var_____________________________________________________
            movl 8(%ebp), %edx
            movl 8(%edx), %edx
          cmpl $0, %edx
          jne .L9
          movl $4, %eax
          jmp .ERROR_EXIT
.L9:
          movl 12(%edx), %edx
          # Emitting this
          pushl $0
          pushl %edx
          movl 8(%ebp), %edx
# __________swap needed_______________________________________________
          movl %edx, 4(%esp)
          popl %edx
          popl %esi
        cmpl $0, %esi
        jne .L10
        movl $4, %eax
        jmp .ERROR_EXIT
.L10:
        movl %edx, 16(%esi)
    addl $4, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
  # Emitting class A {...}
    # Emitting B b
    # Emitting int i
  # Emitting class B {...}
    # Emitting int x
  # Emitting class C {...}
