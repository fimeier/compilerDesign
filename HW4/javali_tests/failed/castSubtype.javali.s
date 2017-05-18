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
  pushl $0
    # Emitting C c
    pushl $0
    addl $4, %esp
    # Emitting R r
    pushl $0
    addl $4, %esp
    # Emitting void main(...) {...}
    pushl $0
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
      pushl $0
        # Emitting r = new R()
        pushl $0
# ________assign______________________________________________________
          # Emitting new R()
          pushl $0
# __________newObject_________________________________________________
          pushl $4
          pushl $1
          call calloc
          addl $8, %esp
          movl $vtable_R, (%eax)
          movl %eax, %edi
          popl %esi
        movl 8(%ebp), %edx
        movl %esi, 8(%edx)
        addl $4, %esp
        # Emitting c = r
        pushl $0
        pushl %edi
# ________assign______________________________________________________
          # Emitting r
          pushl $0
# __________var_______________________________________________________
          movl 8(%ebp), %edi
          movl 8(%edi), %edi
          popl %esi
        movl 8(%ebp), %edx
        movl %esi, 4(%edx)
        popl %edi
        addl $4, %esp
        # Emitting r = (R)(c)
        pushl $0
        pushl %edi
# ________assign______________________________________________________
          # Emitting (R)(c)
          pushl $0
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
            popl %esi
            popl %edi
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
          popl %esi
        movl 8(%ebp), %edi
        movl %esi, 8(%edi)
        popl %edi
        addl $4, %esp
        # Emitting c = (C)(r)
        pushl $0
        pushl %edx
        pushl %edi
# ________assign______________________________________________________
          # Emitting (C)(r)
          pushl $0
# __________cast______________________________________________________
# __________castTypeName______________________________________________
          movl $vtable_C, %edi
            # Emitting r
            pushl $0
            pushl %edx
            pushl %edi
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 8(%edi), %edi
# ____________swap needed_____________________________________________
            movl %edi, 8(%esp)
            popl %edx
            popl %edi
            popl %esi
# __________rTypeRegister_____________________________________________
          movl %esi, %edx
          cmpl $0, %edx
          je .L7
          cmpl %edi, %edx
          je .L7
.L9:
          cmpl $0, %edx
          je .L6
          cmpl %edi, %edx
          je .L7
          movl (%edx), %edx
          jmp .L9
.L6:
          movl $1, %eax
          jmp .ERROR_EXIT
          jmp .L8
.L7:
.L8:
          popl %edx
        movl 8(%ebp), %edi
        movl %edx, 4(%edi)
        popl %edx
        popl %edi
        addl $4, %esp
      addl $4, %esp
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    addl $4, %esp
  addl $4, %esp
  # Emitting class A {...}
  pushl $0
  pushl %edx
  pushl %esi
  pushl %edi
  popl %edx
  popl %esi
  popl %edi
  addl $4, %esp
  # Emitting class C {...}
  pushl $0
  pushl %edx
  pushl %esi
  pushl %edi
  popl %edx
  popl %esi
  popl %edi
  addl $4, %esp
  # Emitting class R {...}
  pushl $0
  pushl %edx
  pushl %esi
  pushl %edi
  popl %edx
  popl %esi
  popl %edi
  addl $4, %esp
