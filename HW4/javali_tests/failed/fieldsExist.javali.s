.section .data
	vtable_A:
		.int vtable_Object
		.int A_fun1
	vtable_S:
		.int vtable_A
		.int S_fun1
	vtable_S_array:
		.int vtable_Object
	vtable_Main_array:
		.int vtable_Object
	vtable_A_array:
		.int vtable_Object
	vtable_int_array:
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
pushl $4
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
    # Emitting int x
    pushl $0
    addl $4, %esp
    # Emitting A a
    pushl $0
    addl $4, %esp
    # Emitting S s
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
        # Emitting x = a.i
        pushl $0
# ________assign______________________________________________________
          # Emitting a.i
          pushl $0
            # Emitting a
            pushl $0
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 8(%edi), %edi
            popl %esi
          cmpl $0, %esi
          jne .L2
          movl $4, %eax
          jmp .ERROR_EXIT
.L2:
          movl 4(%esi), %esi
          popl %edx
        movl 8(%ebp), %ecx
        movl %edx, 4(%ecx)
        addl $4, %esp
        # Emitting x = s.s
        pushl $0
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting s.s
          pushl $0
            # Emitting s
            pushl $0
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 12(%edi), %edi
            popl %esi
          cmpl $0, %esi
          jne .L3
          movl $4, %eax
          jmp .ERROR_EXIT
.L3:
          movl 12(%esi), %esi
          popl %edx
        movl 8(%ebp), %ecx
        movl %edx, 4(%ecx)
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting x = s.i
        pushl $0
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting s.i
          pushl $0
            # Emitting s
            pushl $0
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 12(%edi), %edi
            popl %esi
          cmpl $0, %esi
          jne .L4
          movl $4, %eax
          jmp .ERROR_EXIT
.L4:
          movl 4(%esi), %esi
          popl %edx
        movl 8(%ebp), %ecx
        movl %edx, 4(%ecx)
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting a.fun1(...)
        pushl $0
        pushl %esi
        pushl %edi
          # Emitting a
          pushl $0
          pushl %edi
# __________var_______________________________________________________
          movl 8(%ebp), %edi
          movl 8(%edi), %edi
# __________swap needed_______________________________________________
          movl %edi, 4(%esp)
          popl %edi
          popl %esi
        cmpl $0, %esi
        jne .L5
        movl $4, %eax
        jmp .ERROR_EXIT
.L5:
        movl 0(%esi), %edi
        movl 4(%edi), %edi
        subl $4, %esp
          # Emitting 1
          pushl $0
          pushl %edx
          pushl %esi
          pushl %edi
          movl $1, %edi
# __________swap needed_______________________________________________
          movl %edi, 12(%esp)
          popl %edx
          popl %esi
          popl %edi
          popl %ecx
        pushl %ecx
        pushl %esi
        call %edi
        addl $8, %esp
        popl %edi
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting s.fun1(...)
        pushl $0
        pushl %edx
        pushl %esi
        pushl %edi
          # Emitting s
          pushl $0
          pushl %edi
# __________var_______________________________________________________
          movl 8(%ebp), %edi
          movl 12(%edi), %edi
# __________swap needed_______________________________________________
          movl %edi, 4(%esp)
          popl %edi
          popl %esi
        cmpl $0, %esi
        jne .L6
        movl $4, %eax
        jmp .ERROR_EXIT
.L6:
        movl 0(%esi), %edi
        movl 4(%edi), %edi
        subl $4, %esp
          # Emitting 2
          pushl $0
          pushl %edx
          pushl %esi
          pushl %edi
          movl $2, %edi
# __________swap needed_______________________________________________
          movl %edi, 12(%esp)
          popl %edx
          popl %esi
          popl %edi
          popl %ecx
        pushl %ecx
        pushl %esi
        call %edi
        addl $8, %esp
        popl %edi
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting x = a.h
        pushl $0
        pushl %edx
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting a.h
          pushl $0
            # Emitting a
            pushl $0
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 8(%edi), %edi
            popl %esi
          cmpl $0, %esi
          jne .L7
          movl $4, %eax
          jmp .ERROR_EXIT
.L7:
          movl 8(%esi), %esi
          popl %edx
        movl 8(%ebp), %ecx
        movl %edx, 4(%ecx)
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting x = s.h
        pushl $0
        pushl %edx
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting s.h
          pushl $0
            # Emitting s
            pushl $0
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 12(%edi), %edi
            popl %esi
          cmpl $0, %esi
          jne .L8
          movl $4, %eax
          jmp .ERROR_EXIT
.L8:
          movl 8(%esi), %esi
          popl %edx
        movl 8(%ebp), %ecx
        movl %edx, 4(%ecx)
        popl %edx
        popl %esi
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
    # Emitting int i
    pushl $0
    addl $4, %esp
    # Emitting int h
    pushl $0
    addl $4, %esp
    # Emitting void fun1(...) {...}
    pushl $0
A_fun1:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    addl $4, %esp
  popl %edx
  popl %esi
  popl %edi
  addl $4, %esp
  # Emitting class S {...}
  pushl $0
  pushl %edx
  pushl %esi
  pushl %edi
    # Emitting int h
    pushl $0
    addl $4, %esp
    # Emitting int s
    pushl $0
    addl $4, %esp
    # Emitting void fun1(...) {...}
    pushl $0
S_fun1:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    addl $4, %esp
  popl %edx
  popl %esi
  popl %edi
  addl $4, %esp
