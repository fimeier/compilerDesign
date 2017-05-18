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
  pushl $0
    # Emitting int i1
    pushl $0
    addl $4, %esp
    # Emitting int i2
    pushl $0
    addl $4, %esp
    # Emitting boolean b
    pushl $0
    addl $4, %esp
    # Emitting A a
    pushl $0
    addl $4, %esp
    # Emitting int[] arr
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
        # Emitting i1 = i2
        pushl $0
# ________assign______________________________________________________
          # Emitting i2
          pushl $0
# __________var_______________________________________________________
          movl 8(%ebp), %edi
          movl 8(%edi), %edi
          popl %esi
        movl 8(%ebp), %edx
        movl %esi, 4(%edx)
        addl $4, %esp
        # Emitting i1 = a.a
        pushl $0
        pushl %edi
# ________assign______________________________________________________
          # Emitting a.a
          pushl $0
            # Emitting a
            pushl $0
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 16(%edi), %edi
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
        popl %edi
        addl $4, %esp
        # Emitting i2 = arr[1]
        pushl $0
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting arr[1]
          pushl $0
            # Emitting arr
            pushl $0
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 20(%edi), %edi
            popl %esi
            # Emitting 1
            pushl $0
            pushl %esi
            pushl %edi
            movl $1, %edi
# ____________swap needed_____________________________________________
            movl %edi, 8(%esp)
            popl %esi
            popl %edi
            popl %edx
          cmpl $0, %esi
          jne .L3
          movl $4, %eax
          jmp .ERROR_EXIT
.L3:
          cmpl $0, %edx
          jge .L4
          movl $3, %eax
          jmp .ERROR_EXIT
.L4:
          cmpl 4(%esi), %edx
          jl .L5
          movl $3, %eax
          jmp .ERROR_EXIT
.L5:
          imul $4, %edx
          addl $8, %edx
          addl %edx, %esi
          movl (%esi), %esi
          popl %edx
        movl 8(%ebp), %ecx
        movl %edx, 8(%ecx)
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting i1 = a.fun(...)
        pushl $0
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting a.fun(...)
          pushl $0
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
          popl %esi
        movl 8(%ebp), %edx
        movl %esi, 4(%edx)
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting i1 = this.foo(...)
        pushl $0
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting this.foo(...)
          pushl $0
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
          popl %esi
        movl 8(%ebp), %edx
        movl %esi, 4(%edx)
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting write(i2)
        pushl $0
        pushl %esi
        pushl %edi
          # Emitting i2
          pushl $0
# __________var_______________________________________________________
          movl 8(%ebp), %edi
          movl 8(%edi), %edi
          popl %esi
        sub $16, %esp
        movl %esi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting write(a.a)
        pushl $0
        pushl %esi
        pushl %edi
          # Emitting a.a
          pushl $0
            # Emitting a
            pushl $0
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 16(%edi), %edi
            popl %esi
          cmpl $0, %esi
          jne .L8
          movl $4, %eax
          jmp .ERROR_EXIT
.L8:
          movl 4(%esi), %esi
          popl %edx
        sub $16, %esp
        movl %edx, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting write(arr[1])
        pushl $0
        pushl %esi
        pushl %edi
          # Emitting arr[1]
          pushl $0
            # Emitting arr
            pushl $0
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 20(%edi), %edi
            popl %esi
            # Emitting 1
            pushl $0
            pushl %esi
            pushl %edi
            movl $1, %edi
# ____________swap needed_____________________________________________
            movl %edi, 8(%esp)
            popl %esi
            popl %edi
            popl %edx
          cmpl $0, %esi
          jne .L9
          movl $4, %eax
          jmp .ERROR_EXIT
.L9:
          cmpl $0, %edx
          jge .L10
          movl $3, %eax
          jmp .ERROR_EXIT
.L10:
          cmpl 4(%esi), %edx
          jl .L11
          movl $3, %eax
          jmp .ERROR_EXIT
.L11:
          imul $4, %edx
          addl $8, %edx
          addl %edx, %esi
          movl (%esi), %esi
          popl %edx
        sub $16, %esp
        movl %edx, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting write(a.fun(...))
        pushl $0
        pushl %esi
        pushl %edi
          # Emitting a.fun(...)
          pushl $0
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
          popl %esi
        sub $16, %esp
        movl %esi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting write(this.foo(...))
        pushl $0
        pushl %esi
        pushl %edi
          # Emitting this.foo(...)
          pushl $0
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
          popl %esi
        sub $16, %esp
        movl %esi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting a.a = i1
        pushl $0
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting i1
          pushl $0
# __________var_______________________________________________________
          movl 8(%ebp), %edi
          movl 4(%edi), %edi
          popl %esi
          # Emitting a
          pushl $0
          pushl %esi
          pushl %edi
# __________var_______________________________________________________
          movl 8(%ebp), %edi
          movl 16(%edi), %edi
# __________swap needed_______________________________________________
          movl %edi, 8(%esp)
          popl %esi
          popl %edi
          popl %edx
        cmpl $0, %edx
        jne .L14
        movl $4, %eax
        jmp .ERROR_EXIT
.L14:
        movl %esi, 4(%edx)
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting arr[1] = i2
        pushl $0
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting i2
          pushl $0
# __________var_______________________________________________________
          movl 8(%ebp), %edi
          movl 8(%edi), %edi
          popl %esi
          # Emitting arr
          pushl $0
          pushl %esi
          pushl %edi
# __________var_______________________________________________________
          movl 8(%ebp), %edi
          movl 20(%edi), %edi
# __________swap needed_______________________________________________
          movl %edi, 8(%esp)
          popl %esi
          popl %edi
          popl %edx
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
        cmpl $0, %edx
        jne .L15
        movl $4, %eax
        jmp .ERROR_EXIT
.L15:
        cmpl $0, %ecx
        jge .L16
        movl $3, %eax
        jmp .ERROR_EXIT
.L16:
        cmpl 4(%edx), %ecx
        jl .L17
        movl $3, %eax
        jmp .ERROR_EXIT
.L17:
        imul $4, %ecx
        addl $8, %ecx
        addl %ecx, %edx
        movl %esi, (%edx)
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
    # Emitting int foo(...) {...}
    pushl $0
    pushl %esi
    pushl %edi
Main_foo:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
      pushl $0
        # Emitting return 1
        pushl $0
          # Emitting 1
          pushl $0
          movl $1, %edi
          popl %esi
        movl %esi, 12(%ebp)
        # restore old ebp
        movl %ebp, %esp
        popl %ebp
        ret
        addl $4, %esp
      addl $4, %esp
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    popl %esi
    popl %edi
    addl $4, %esp
  addl $4, %esp
  # Emitting class A {...}
  pushl $0
  pushl %esi
  pushl %edi
    # Emitting int a
    pushl $0
    addl $4, %esp
    # Emitting int fun(...) {...}
    pushl $0
A_fun:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
      pushl $0
        # Emitting return 1
        pushl $0
          # Emitting 1
          pushl $0
          movl $1, %edi
          popl %esi
        movl %esi, 12(%ebp)
        # restore old ebp
        movl %ebp, %esp
        popl %ebp
        ret
        addl $4, %esp
      addl $4, %esp
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    addl $4, %esp
  popl %esi
  popl %edi
  addl $4, %esp
