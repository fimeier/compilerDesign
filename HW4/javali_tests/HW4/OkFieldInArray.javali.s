.section .data
	vtable_A:
		.int vtable_Object
		.int A_foo
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
pushl $2
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
    # Emitting int field
    # Emitting void foo(...) {...}
A_foo:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting write(1)
          # Emitting 1
          movl $1, %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting write(field)
          # Emitting field
# __________var_______________________________________________________
          movl 8(%ebp), %edi
          movl 4(%edi), %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
  # Emitting class Main {...}
    # Emitting A[] x
    # Emitting void main(...) {...}
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    # variable i
    pushl $0
      # Emitting (...)
        # Emitting x = new A[][2]
# ________assign______________________________________________________
          # Emitting new A[][2]
            # Emitting 2
            movl $2, %edi
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
        movl 8(%ebp), %edi
        movl %esi, 4(%edi)
        # Emitting i = 1
# ________assign______________________________________________________
          # Emitting 1
          movl $1, %esi
        movl %esi, -4(%ebp)
        # Emitting write(i)
          # Emitting i
# __________var_______________________________________________________
          movl -4(%ebp), %esi
        sub $16, %esp
        movl %esi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        # Emitting x[i] = new A()
# ________assign______________________________________________________
          # Emitting new A()
# __________newObject_________________________________________________
          pushl $4
          pushl $2
          call calloc
          addl $8, %esp
          movl $vtable_A, (%eax)
          movl %eax, %esi
          # Emitting x
          pushl $0
          pushl %esi
# __________var_______________________________________________________
          movl 8(%ebp), %esi
          movl 4(%esi), %esi
# __________swap needed_______________________________________________
          movl %esi, 4(%esp)
          popl %esi
          popl %edi
          # Emitting i
          pushl $0
          pushl %esi
          pushl %edi
# __________var_______________________________________________________
          movl -4(%ebp), %edi
# __________swap needed_______________________________________________
          movl %edi, 8(%esp)
          popl %edi
          popl %esi
          popl %edx
        cmpl $0, %edi
        jne .L3
        movl $4, %eax
        jmp .ERROR_EXIT
.L3:
        cmpl $0, %edx
        jge .L4
        movl $3, %eax
        jmp .ERROR_EXIT
.L4:
        cmpl 4(%edi), %edx
        jl .L5
        movl $3, %eax
        jmp .ERROR_EXIT
.L5:
        imul $4, %edx
        addl $8, %edx
        addl %edx, %edi
        movl %esi, (%edi)
        # Emitting x[i].field = (i + 1)
# ________assign______________________________________________________
          # Emitting (i + 1)
            # Emitting 1
            movl $1, %esi
            # Emitting i
            pushl $0
            pushl %esi
# ____________var_____________________________________________________
            movl -4(%ebp), %esi
# ____________swap needed_____________________________________________
            movl %esi, 4(%esp)
            popl %esi
            popl %edi
          add %esi, %edi
          # Emitting x[i]
          pushl $0
          pushl %edi
            # Emitting x
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 4(%edi), %edi
            # Emitting i
            pushl $0
            pushl %edi
# ____________var_____________________________________________________
            movl -4(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          cmpl $0, %edi
          jne .L6
          movl $4, %eax
          jmp .ERROR_EXIT
.L6:
          cmpl $0, %esi
          jge .L7
          movl $3, %eax
          jmp .ERROR_EXIT
.L7:
          cmpl 4(%edi), %esi
          jl .L8
          movl $3, %eax
          jmp .ERROR_EXIT
.L8:
          imul $4, %esi
          addl $8, %esi
          addl %esi, %edi
          movl (%edi), %edi
# __________swap needed_______________________________________________
          movl %edi, 4(%esp)
          popl %edi
          popl %esi
        cmpl $0, %esi
        jne .L9
        movl $4, %eax
        jmp .ERROR_EXIT
.L9:
        movl %edi, 4(%esi)
        # Emitting i = x[1].field
# ________assign______________________________________________________
          # Emitting x[1].field
            # Emitting x[1]
              # Emitting x
# ______________var___________________________________________________
              movl 8(%ebp), %edi
              movl 4(%edi), %edi
              # Emitting 1
              pushl $0
              pushl %edi
              movl $1, %edi
# ______________swap needed___________________________________________
              movl %edi, 4(%esp)
              popl %edi
              popl %esi
            cmpl $0, %edi
            jne .L10
            movl $4, %eax
            jmp .ERROR_EXIT
.L10:
            cmpl $0, %esi
            jge .L11
            movl $3, %eax
            jmp .ERROR_EXIT
.L11:
            cmpl 4(%edi), %esi
            jl .L12
            movl $3, %eax
            jmp .ERROR_EXIT
.L12:
            imul $4, %esi
            addl $8, %esi
            addl %esi, %edi
            movl (%edi), %edi
          cmpl $0, %edi
          jne .L13
          movl $4, %eax
          jmp .ERROR_EXIT
.L13:
          movl 4(%edi), %edi
        movl %edi, -4(%ebp)
        # Emitting write(i)
          # Emitting i
# __________var_______________________________________________________
          movl -4(%ebp), %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        # Emitting x[1].foo(...)
          # Emitting x[1].foo(...)
            # Emitting x[1]
            pushl $0
            pushl %edi
              # Emitting x
# ______________var___________________________________________________
              movl 8(%ebp), %edi
              movl 4(%edi), %edi
              # Emitting 1
              pushl $0
              pushl %edi
              movl $1, %edi
# ______________swap needed___________________________________________
              movl %edi, 4(%esp)
              popl %edi
              popl %esi
            cmpl $0, %edi
            jne .L14
            movl $4, %eax
            jmp .ERROR_EXIT
.L14:
            cmpl $0, %esi
            jge .L15
            movl $3, %eax
            jmp .ERROR_EXIT
.L15:
            cmpl 4(%edi), %esi
            jl .L16
            movl $3, %eax
            jmp .ERROR_EXIT
.L16:
            imul $4, %esi
            addl $8, %esi
            addl %esi, %edi
            movl (%edi), %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          cmpl $0, %esi
          jne .L17
          movl $4, %eax
          jmp .ERROR_EXIT
.L17:
          movl 0(%esi), %edi
          movl 4(%edi), %edi
          subl $4, %esp
          pushl %esi
          call %edi
          addl $4, %esp
          popl %edi
    addl $4, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
