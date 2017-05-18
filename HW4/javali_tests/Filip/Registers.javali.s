.section .data
	vtable_Main_array:
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
pushl $1
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
    # Emitting void main(...) {...}
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    # variable v1
    pushl $0
    # variable v2
    pushl $0
    # variable v3
    pushl $0
    # variable v4
    pushl $0
    # variable a
    pushl $0
      # Emitting (...)
        # Emitting a = new int[][3]
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
          movl %edi, 4(%eax)
          movl %eax, %esi
        movl %esi, -20(%ebp)
        # Emitting a[0] = 0
# ________assign______________________________________________________
          # Emitting 0
          movl $0, %esi
          # Emitting a
# __________var_______________________________________________________
          movl -20(%ebp), %edx
          # Emitting 0
          movl $0, %ecx
        cmpl $0, %edx
        jne .L3
        movl $4, %eax
        jmp .ERROR_EXIT
.L3:
        cmpl $0, %ecx
        jge .L4
        movl $3, %eax
        jmp .ERROR_EXIT
.L4:
        cmpl 4(%edx), %ecx
        jl .L5
        movl $3, %eax
        jmp .ERROR_EXIT
.L5:
        imul $4, %ecx
        addl $8, %ecx
        addl %ecx, %edx
        movl %esi, (%edx)
        # Emitting a[1] = 2
# ________assign______________________________________________________
          # Emitting 2
          movl $2, %esi
          # Emitting a
# __________var_______________________________________________________
          movl -20(%ebp), %edx
          # Emitting 1
          movl $1, %ecx
        cmpl $0, %edx
        jne .L6
        movl $4, %eax
        jmp .ERROR_EXIT
.L6:
        cmpl $0, %ecx
        jge .L7
        movl $3, %eax
        jmp .ERROR_EXIT
.L7:
        cmpl 4(%edx), %ecx
        jl .L8
        movl $3, %eax
        jmp .ERROR_EXIT
.L8:
        imul $4, %ecx
        addl $8, %ecx
        addl %ecx, %edx
        movl %esi, (%edx)
        # Emitting a[4] = 2
# ________assign______________________________________________________
          # Emitting 2
          movl $2, %esi
          # Emitting a
# __________var_______________________________________________________
          movl -20(%ebp), %edx
          # Emitting 4
          movl $4, %ecx
        cmpl $0, %edx
        jne .L9
        movl $4, %eax
        jmp .ERROR_EXIT
.L9:
        cmpl $0, %ecx
        jge .L10
        movl $3, %eax
        jmp .ERROR_EXIT
.L10:
        cmpl 4(%edx), %ecx
        jl .L11
        movl $3, %eax
        jmp .ERROR_EXIT
.L11:
        imul $4, %ecx
        addl $8, %ecx
        addl %ecx, %edx
        movl %esi, (%edx)
        # Emitting if ((a[1] == a[2])) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting (a[1] == a[2])
            # Emitting a[2]
              # Emitting a
# ______________var___________________________________________________
              movl -20(%ebp), %esi
              # Emitting 2
              movl $2, %edx
            cmpl $0, %esi
            jne .L13
            movl $4, %eax
            jmp .ERROR_EXIT
.L13:
            cmpl $0, %edx
            jge .L14
            movl $3, %eax
            jmp .ERROR_EXIT
.L14:
            cmpl 4(%esi), %edx
            jl .L15
            movl $3, %eax
            jmp .ERROR_EXIT
.L15:
            imul $4, %edx
            addl $8, %edx
            addl %edx, %esi
            movl (%esi), %esi
            # Emitting a[1]
              # Emitting a
# ______________var___________________________________________________
              movl -20(%ebp), %edx
              # Emitting 1
              movl $1, %ecx
            cmpl $0, %edx
            jne .L16
            movl $4, %eax
            jmp .ERROR_EXIT
.L16:
            cmpl $0, %ecx
            jge .L17
            movl $3, %eax
            jmp .ERROR_EXIT
.L17:
            cmpl 4(%edx), %ecx
            jl .L18
            movl $3, %eax
            jmp .ERROR_EXIT
.L18:
            imul $4, %ecx
            addl $8, %ecx
            addl %ecx, %edx
            movl (%edx), %edx
          cmpl %esi, %edx
          je .L19
          movl $0, %edx
          jmp .L20
.L19:
          movl $1, %edx
.L20:
        jne .L21
          # Emitting (...)
            # Emitting write(1)
              # Emitting 1
              movl $1, %edx
            sub $16, %esp
            movl %edx, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
        jmp .L22
.L21:
          # Emitting (...)
            # Emitting write(0)
              # Emitting 0
              movl $0, %edx
            sub $16, %esp
            movl %edx, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
.L22:
    addl $20, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
