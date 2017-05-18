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
  # Emitting class Main {...}
    # Emitting int[] x
    # Emitting void main(...) {...}
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    # variable i
    pushl $0
      # Emitting (...)
        # Emitting x = new int[][3]
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
        movl 8(%ebp), %edx
        movl %esi, 4(%edx)
        # Emitting x[0] = 3
# ________assign______________________________________________________
          # Emitting 3
          movl $3, %esi
          # Emitting x
# __________var_______________________________________________________
          movl 8(%ebp), %edx
          movl 4(%edx), %edx
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
        # Emitting x[1] = 4
# ________assign______________________________________________________
          # Emitting 4
          movl $4, %esi
          # Emitting x
# __________var_______________________________________________________
          movl 8(%ebp), %edx
          movl 4(%edx), %edx
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
        # Emitting x[2] = 5
# ________assign______________________________________________________
          # Emitting 5
          movl $5, %esi
          # Emitting x
# __________var_______________________________________________________
          movl 8(%ebp), %edx
          movl 4(%edx), %edx
          # Emitting 2
          movl $2, %ecx
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
        # Emitting i = ((x[0] + x[1]) + x[2])
# ________assign______________________________________________________
          # Emitting ((x[0] + x[1]) + x[2])
            # Emitting (x[0] + x[1])
              # Emitting x[1]
                # Emitting x
# ________________var_________________________________________________
                movl 8(%ebp), %esi
                movl 4(%esi), %esi
                # Emitting 1
                movl $1, %edx
              cmpl $0, %esi
              jne .L12
              movl $4, %eax
              jmp .ERROR_EXIT
.L12:
              cmpl $0, %edx
              jge .L13
              movl $3, %eax
              jmp .ERROR_EXIT
.L13:
              cmpl 4(%esi), %edx
              jl .L14
              movl $3, %eax
              jmp .ERROR_EXIT
.L14:
              imul $4, %edx
              addl $8, %edx
              addl %edx, %esi
              movl (%esi), %esi
              # Emitting x[0]
                # Emitting x
# ________________var_________________________________________________
                movl 8(%ebp), %edx
                movl 4(%edx), %edx
                # Emitting 0
                movl $0, %ecx
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
              movl (%edx), %edx
            add %esi, %edx
            # Emitting x[2]
              # Emitting x
# ______________var___________________________________________________
              movl 8(%ebp), %esi
              movl 4(%esi), %esi
              # Emitting 2
              movl $2, %ecx
            cmpl $0, %esi
            jne .L18
            movl $4, %eax
            jmp .ERROR_EXIT
.L18:
            cmpl $0, %ecx
            jge .L19
            movl $3, %eax
            jmp .ERROR_EXIT
.L19:
            cmpl 4(%esi), %ecx
            jl .L20
            movl $3, %eax
            jmp .ERROR_EXIT
.L20:
            imul $4, %ecx
            addl $8, %ecx
            addl %ecx, %esi
            movl (%esi), %esi
          add %esi, %edx
        movl %edx, -4(%ebp)
        # Emitting write(i)
          # Emitting i
# __________var_______________________________________________________
          movl -4(%ebp), %edx
        sub $16, %esp
        movl %edx, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
    addl $4, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
