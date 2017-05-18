.section .data
	vtable_A:
		.int vtable_Object
		.int A_fun
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
pushl $6
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
    # Emitting int i1
    # Emitting int i2
    # Emitting boolean b
    # Emitting A a
    # Emitting int[] arr
    # Emitting void main(...) {...}
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting i1 = i2
# ________assign______________________________________________________
          # Emitting i2
# __________var_______________________________________________________
          movl 8(%ebp), %edi
          movl 8(%edi), %edi
        movl 8(%ebp), %esi
        movl %edi, 4(%esi)
        # Emitting i1 = a.a
# ________assign______________________________________________________
          # Emitting a.a
            # Emitting a
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 16(%edi), %edi
          cmpl $0, %edi
          jne .L2
          movl $4, %eax
          jmp .ERROR_EXIT
.L2:
          movl 4(%edi), %edi
        movl 8(%ebp), %esi
        movl %edi, 4(%esi)
        # Emitting i2 = arr[1]
# ________assign______________________________________________________
          # Emitting arr[1]
            # Emitting arr
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 20(%edi), %edi
            # Emitting 1
            pushl $0
            pushl %edi
            movl $1, %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          cmpl $0, %edi
          jne .L3
          movl $4, %eax
          jmp .ERROR_EXIT
.L3:
          cmpl $0, %esi
          jge .L4
          movl $3, %eax
          jmp .ERROR_EXIT
.L4:
          cmpl 4(%edi), %esi
          jl .L5
          movl $3, %eax
          jmp .ERROR_EXIT
.L5:
          imul $4, %esi
          addl $8, %esi
          addl %esi, %edi
          movl (%edi), %edi
        movl 8(%ebp), %esi
        movl %edi, 8(%esi)
        # Emitting i1 = a.fun(...)
# ________assign______________________________________________________
          # Emitting a.fun(...)
            # Emitting a
            pushl $0
            pushl %edi
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 16(%edi), %edi
# ____________swap needed_____________________________________________
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
          pushl %esi
          call %edi
          addl $4, %esp
          popl %edi
        movl 8(%ebp), %esi
        movl %edi, 4(%esi)
        # Emitting i1 = this.foo(...)
# ________assign______________________________________________________
          # Emitting this.foo(...)
            # Emitting this
            pushl $0
            pushl %edi
            movl 8(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          cmpl $0, %esi
          jne .L7
          movl $4, %eax
          jmp .ERROR_EXIT
.L7:
          movl 0(%esi), %edi
          movl 8(%edi), %edi
          subl $4, %esp
          pushl %esi
          call %edi
          addl $4, %esp
          popl %edi
        movl 8(%ebp), %esi
        movl %edi, 4(%esi)
        # Emitting write(i2)
          # Emitting i2
# __________var_______________________________________________________
          movl 8(%ebp), %edi
          movl 8(%edi), %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting write(a.a)
          # Emitting a.a
            # Emitting a
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 16(%edi), %edi
          cmpl $0, %edi
          jne .L8
          movl $4, %eax
          jmp .ERROR_EXIT
.L8:
          movl 4(%edi), %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting write(arr[1])
          # Emitting arr[1]
            # Emitting arr
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 20(%edi), %edi
            # Emitting 1
            pushl $0
            pushl %edi
            movl $1, %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          cmpl $0, %edi
          jne .L9
          movl $4, %eax
          jmp .ERROR_EXIT
.L9:
          cmpl $0, %esi
          jge .L10
          movl $3, %eax
          jmp .ERROR_EXIT
.L10:
          cmpl 4(%edi), %esi
          jl .L11
          movl $3, %eax
          jmp .ERROR_EXIT
.L11:
          imul $4, %esi
          addl $8, %esi
          addl %esi, %edi
          movl (%edi), %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting write(a.fun(...))
          # Emitting a.fun(...)
            # Emitting a
            pushl $0
            pushl %edi
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 16(%edi), %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          cmpl $0, %esi
          jne .L12
          movl $4, %eax
          jmp .ERROR_EXIT
.L12:
          movl 0(%esi), %edi
          movl 4(%edi), %edi
          subl $4, %esp
          pushl %esi
          call %edi
          addl $4, %esp
          popl %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting write(this.foo(...))
          # Emitting this.foo(...)
            # Emitting this
            pushl $0
            pushl %edi
            movl 8(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          cmpl $0, %esi
          jne .L13
          movl $4, %eax
          jmp .ERROR_EXIT
.L13:
          movl 0(%esi), %edi
          movl 8(%edi), %edi
          subl $4, %esp
          pushl %esi
          call %edi
          addl $4, %esp
          popl %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting a.a = i1
# ________assign______________________________________________________
          # Emitting i1
# __________var_______________________________________________________
          movl 8(%ebp), %edi
          movl 4(%edi), %edi
          # Emitting a
          pushl $0
          pushl %edi
# __________var_______________________________________________________
          movl 8(%ebp), %edi
          movl 16(%edi), %edi
# __________swap needed_______________________________________________
          movl %edi, 4(%esp)
          popl %edi
          popl %esi
        cmpl $0, %esi
        jne .L14
        movl $4, %eax
        jmp .ERROR_EXIT
.L14:
        movl %edi, 4(%esi)
        # Emitting arr[1] = i2
# ________assign______________________________________________________
          # Emitting i2
# __________var_______________________________________________________
          movl 8(%ebp), %edi
          movl 8(%edi), %edi
          # Emitting arr
          pushl $0
          pushl %edi
# __________var_______________________________________________________
          movl 8(%ebp), %edi
          movl 20(%edi), %edi
# __________swap needed_______________________________________________
          movl %edi, 4(%esp)
          popl %edi
          popl %esi
          # Emitting 1
          pushl $0
          pushl %esi
          pushl %edi
          movl $1, %edi
# __________swap needed_______________________________________________
          movl %edi, 8(%esp)
          popl %edi
          popl %esi
          popl %edx
        cmpl $0, %esi
        jne .L15
        movl $4, %eax
        jmp .ERROR_EXIT
.L15:
        cmpl $0, %edx
        jge .L16
        movl $3, %eax
        jmp .ERROR_EXIT
.L16:
        cmpl 4(%esi), %edx
        jl .L17
        movl $3, %eax
        jmp .ERROR_EXIT
.L17:
        imul $4, %edx
        addl $8, %edx
        addl %edx, %esi
        movl %edi, (%esi)
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    # Emitting int foo(...) {...}
Main_foo:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting return 1
          # Emitting 1
          movl $1, %edi
        movl %edi, 12(%ebp)
        # restore old ebp
        movl %ebp, %esp
        popl %ebp
        ret
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
  # Emitting class A {...}
    # Emitting int a
    # Emitting int fun(...) {...}
A_fun:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting return 1
          # Emitting 1
          movl $1, %edi
        movl %edi, 12(%ebp)
        # restore old ebp
        movl %ebp, %esp
        popl %ebp
        ret
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
