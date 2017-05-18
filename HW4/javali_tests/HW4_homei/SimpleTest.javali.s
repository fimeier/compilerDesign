.section .data
	vtable_A:
		.int vtable_Object
		.int A_foo
		.int A_funA
	vtable_B:
		.int vtable_A
		.int B_foo
		.int A_funA
		.int B_funB
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
		.int Main_loc
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
  # Emitting class A {...}
    # Emitting int x
    # Emitting void foo(...) {...}
A_foo:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting write(x)
          # Emitting x
# __________var_______________________________________________________
          movl 8(%ebp), %edi
          movl 4(%edi), %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    # Emitting void funA(...) {...}
A_funA:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
  # Emitting class B {...}
    # Emitting void funB(...) {...}
B_funB:
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
B_foo:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
  # Emitting class Main {...}
    # Emitting A a
    # Emitting B b
    # Emitting int g
    # Emitting void main(...) {...}
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    # variable c
    pushl $0
      # Emitting (...)
        # Emitting c = new int[][3]
# ________assign______________________________________________________
          # Emitting new int[][3]
            # Emitting 3
            movl $3, %edi
          cmpl $0, %edi
          jge .L2
          movl $5, %eax
          jmp .ERROR_EXIT
.L2:
          addl $2, %edi
          pushl $4
          pushl %edi
          call calloc
          addl $8, %esp
          movl $vtable_Object, (%eax)
          subl $2, %edi
          movl %edi, 4(%eax)
          movl %eax, %esi
        movl %esi, -4(%ebp)
        # Emitting a = new A()
# ________assign______________________________________________________
          # Emitting new A()
# __________newObject_________________________________________________
          pushl $4
          pushl $2
          call calloc
          addl $8, %esp
          movl $vtable_A, (%eax)
          movl %eax, %esi
        movl 8(%ebp), %edi
        movl %esi, 4(%edi)
        # Emitting b = new B()
# ________assign______________________________________________________
          # Emitting new B()
# __________newObject_________________________________________________
          pushl $4
          pushl $2
          call calloc
          addl $8, %esp
          movl $vtable_B, (%eax)
          movl %eax, %esi
        movl 8(%ebp), %edi
        movl %esi, 8(%edi)
        # Emitting a.x = 5
# ________assign______________________________________________________
          # Emitting 5
          movl $5, %esi
          # Emitting a
          pushl $0
          pushl %esi
# __________var_______________________________________________________
          movl 8(%ebp), %esi
          movl 4(%esi), %esi
# __________swap needed_______________________________________________
          movl %esi, 4(%esp)
          popl %esi
          popl %edi
        cmpl $0, %edi
        jne .L3
        movl $4, %eax
        jmp .ERROR_EXIT
.L3:
        movl %esi, 4(%edi)
        # Emitting g = a.x
# ________assign______________________________________________________
          # Emitting a.x
            # Emitting a
# ____________var_____________________________________________________
            movl 8(%ebp), %esi
            movl 4(%esi), %esi
          cmpl $0, %esi
          jne .L4
          movl $4, %eax
          jmp .ERROR_EXIT
.L4:
          movl 4(%esi), %esi
        movl 8(%ebp), %edi
        movl %esi, 12(%edi)
        # Emitting c[0] = this.loc(...)
# ________assign______________________________________________________
          # Emitting this.loc(...)
            # Emitting this
            pushl $0
            pushl %esi
            movl 8(%ebp), %esi
# ____________swap needed_____________________________________________
            movl %esi, 4(%esp)
            popl %esi
            popl %edi
          cmpl $0, %edi
          jne .L5
          movl $4, %eax
          jmp .ERROR_EXIT
.L5:
          movl 0(%edi), %esi
          movl 8(%esi), %esi
          subl $4, %esp
            # Emitting (g + 1)
            pushl $0
            pushl %edx
            pushl %esi
            pushl %edi
              # Emitting 1
              movl $1, %edi
              # Emitting g
              pushl $0
              pushl %edi
# ______________var___________________________________________________
              movl 8(%ebp), %edi
              movl 12(%edi), %edi
# ______________swap needed___________________________________________
              movl %edi, 4(%esp)
              popl %edi
              popl %esi
            add %edi, %esi
# ____________swap needed_____________________________________________
            movl %esi, 12(%esp)
            popl %edi
            popl %esi
            popl %edx
            popl %ecx
          pushl %ecx
          pushl %edi
          call %esi
          addl $8, %esp
          popl %esi
          # Emitting c
          pushl $0
          pushl %edx
          pushl %esi
# __________var_______________________________________________________
          movl -4(%ebp), %esi
# __________swap needed_______________________________________________
          movl %esi, 8(%esp)
          popl %esi
          popl %edx
          popl %edi
          # Emitting 0
          pushl $0
          pushl %edx
          pushl %esi
          pushl %edi
          movl $0, %edi
# __________swap needed_______________________________________________
          movl %edi, 12(%esp)
          popl %edi
          popl %esi
          popl %edx
          popl %ecx
        cmpl $0, %edi
        jne .L6
        movl $4, %eax
        jmp .ERROR_EXIT
.L6:
        cmpl $0, %ecx
        jge .L7
        movl $3, %eax
        jmp .ERROR_EXIT
.L7:
        cmpl 4(%edi), %ecx
        jl .L8
        movl $3, %eax
        jmp .ERROR_EXIT
.L8:
        imul $4, %ecx
        addl $8, %ecx
        addl %ecx, %edi
        movl %esi, (%edi)
        # Emitting write(c[0])
        pushl $0
        pushl %edx
          # Emitting c[0]
            # Emitting c
# ____________var_____________________________________________________
            movl -4(%ebp), %edx
            # Emitting 0
            pushl $0
            pushl %edx
            movl $0, %edx
# ____________swap needed_____________________________________________
            movl %edx, 4(%esp)
            popl %edx
            popl %esi
          cmpl $0, %edx
          jne .L9
          movl $4, %eax
          jmp .ERROR_EXIT
.L9:
          cmpl $0, %esi
          jge .L10
          movl $3, %eax
          jmp .ERROR_EXIT
.L10:
          cmpl 4(%edx), %esi
          jl .L11
          movl $3, %eax
          jmp .ERROR_EXIT
.L11:
          imul $4, %esi
          addl $8, %esi
          addl %esi, %edx
          movl (%edx), %edx
        sub $16, %esp
        movl %edx, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
# ________NO swap needed______________________________________________
        popl %edx
        addl $4, %esp
    addl $4, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    # Emitting int loc(...) {...}
    pushl $0
    pushl %edx
Main_loc:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting arg = (arg + 2)
# ________assign______________________________________________________
          # Emitting (arg + 2)
            # Emitting 2
            movl $2, %edx
            # Emitting arg
            pushl $0
            pushl %edx
# ____________var_____________________________________________________
            movl 12(%ebp), %edx
# ____________swap needed_____________________________________________
            movl %edx, 4(%esp)
            popl %edx
            popl %esi
          add %edx, %esi
        movl %esi, 12(%ebp)
        # Emitting return arg
          # Emitting arg
# __________var_______________________________________________________
          movl 12(%ebp), %esi
        movl %esi, 16(%ebp)
        # restore old ebp
        movl %ebp, %esp
        popl %ebp
        ret
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
# ____NO swap needed__________________________________________________
    popl %edx
    addl $4, %esp
