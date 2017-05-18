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
    # Emitting int x
    # Emitting A a
    # Emitting S s
    # Emitting void main(...) {...}
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting x = a.i
# ________assign______________________________________________________
          # Emitting a.i
            # Emitting a
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 8(%edi), %edi
          cmpl $0, %edi
          jne .L2
          movl $4, %eax
          jmp .ERROR_EXIT
.L2:
          movl 4(%edi), %edi
        movl 8(%ebp), %esi
        movl %edi, 4(%esi)
        # Emitting x = s.s
# ________assign______________________________________________________
          # Emitting s.s
            # Emitting s
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 12(%edi), %edi
          cmpl $0, %edi
          jne .L3
          movl $4, %eax
          jmp .ERROR_EXIT
.L3:
          movl 12(%edi), %edi
        movl 8(%ebp), %esi
        movl %edi, 4(%esi)
        # Emitting x = s.i
# ________assign______________________________________________________
          # Emitting s.i
            # Emitting s
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 12(%edi), %edi
          cmpl $0, %edi
          jne .L4
          movl $4, %eax
          jmp .ERROR_EXIT
.L4:
          movl 4(%edi), %edi
        movl 8(%ebp), %esi
        movl %edi, 4(%esi)
        # Emitting a.fun1(...)
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
          popl %edi
          popl %esi
          popl %edx
          popl %ecx
        pushl %ecx
        pushl %esi
        call %edi
        addl $8, %esp
        popl %edi
        # Emitting s.fun1(...)
        pushl $0
        pushl %edx
          # Emitting s
          pushl $0
          pushl %edx
# __________var_______________________________________________________
          movl 8(%ebp), %edx
          movl 12(%edx), %edx
# __________swap needed_______________________________________________
          movl %edx, 4(%esp)
          popl %edx
          popl %edi
        cmpl $0, %edi
        jne .L6
        movl $4, %eax
        jmp .ERROR_EXIT
.L6:
        movl 0(%edi), %edx
        movl 4(%edx), %edx
        subl $4, %esp
          # Emitting 2
          pushl $0
          pushl %edx
          pushl %esi
          pushl %edi
          movl $2, %edi
# __________swap needed_______________________________________________
          movl %edi, 12(%esp)
          popl %edi
          popl %esi
          popl %edx
          popl %ecx
        pushl %ecx
        pushl %edi
        call %edx
        addl $8, %esp
        popl %edx
# ________NO swap needed______________________________________________
        popl %edx
        addl $4, %esp
        # Emitting x = a.h
        pushl $0
        pushl %edx
        pushl %esi
# ________assign______________________________________________________
          # Emitting a.h
            # Emitting a
# ____________var_____________________________________________________
            movl 8(%ebp), %esi
            movl 8(%esi), %esi
          cmpl $0, %esi
          jne .L7
          movl $4, %eax
          jmp .ERROR_EXIT
.L7:
          movl 8(%esi), %esi
        movl 8(%ebp), %edx
        movl %esi, 4(%edx)
# ________NO swap needed______________________________________________
        popl %esi
        popl %edx
        addl $4, %esp
        # Emitting x = s.h
        pushl $0
        pushl %edx
        pushl %esi
# ________assign______________________________________________________
          # Emitting s.h
            # Emitting s
# ____________var_____________________________________________________
            movl 8(%ebp), %esi
            movl 12(%esi), %esi
          cmpl $0, %esi
          jne .L8
          movl $4, %eax
          jmp .ERROR_EXIT
.L8:
          movl 8(%esi), %esi
        movl 8(%ebp), %edx
        movl %esi, 4(%edx)
# ________NO swap needed______________________________________________
        popl %esi
        popl %edx
        addl $4, %esp
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
  # Emitting class A {...}
  pushl $0
  pushl %edx
  pushl %esi
    # Emitting int i
    # Emitting int h
    # Emitting void fun1(...) {...}
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
# __NO swap needed____________________________________________________
  popl %esi
  popl %edx
  addl $4, %esp
  # Emitting class S {...}
  pushl $0
  pushl %edx
  pushl %esi
    # Emitting int h
    # Emitting int s
    # Emitting void fun1(...) {...}
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
# __NO swap needed____________________________________________________
  popl %esi
  popl %edx
  addl $4, %esp
