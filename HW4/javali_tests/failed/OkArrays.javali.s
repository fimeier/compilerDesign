.section .data
	vtable_A:
		.int vtable_Object
	vtable_B:
		.int vtable_A
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
  # Emitting class A {...}
  pushl $0
  addl $4, %esp
  # Emitting class B {...}
  pushl $0
  addl $4, %esp
  # Emitting class Main {...}
  pushl $0
    # Emitting void main(...) {...}
    pushl $0
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    # variable a
    pushl $0
    # variable b
    pushl $0
    # variable i
    pushl $0
    # variable bools
    pushl $0
      # Emitting (...)
      pushl $0
        # Emitting a = new A[][1]
        pushl $0
# ________assign______________________________________________________
          # Emitting new A[][1]
          pushl $0
            # Emitting 1
            pushl $0
            movl $1, %edi
            popl %esi
          cmpl $0, %esi
          jge .L2
          movl $5, %eax
          jmp .ERROR_EXIT
.L2:
          addl $2, %esi
          pushl $4
          pushl %esi
          call calloc
          addl $8, %esp
          movl $vtable_Object, (%eax)
          movl %esi, 4(%eax)
          movl %eax, %edx
          popl %ecx
        movl %ecx, -4(%ebp)
        addl $4, %esp
        # Emitting b = new B[][1]
        pushl $0
        pushl %edx
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting new B[][1]
          pushl $0
            # Emitting 1
            pushl $0
            movl $1, %edi
            popl %esi
          cmpl $0, %esi
          jge .L3
          movl $5, %eax
          jmp .ERROR_EXIT
.L3:
          addl $2, %esi
          pushl $4
          pushl %esi
          call calloc
          addl $8, %esp
          movl $vtable_Object, (%eax)
          movl %esi, 4(%eax)
          movl %eax, %edx
          popl %ecx
        movl %ecx, -8(%ebp)
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting i = new int[][2]
        pushl $0
        pushl %edx
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting new int[][2]
          pushl $0
            # Emitting 2
            pushl $0
            movl $2, %edi
            popl %esi
          cmpl $0, %esi
          jge .L4
          movl $5, %eax
          jmp .ERROR_EXIT
.L4:
          addl $2, %esi
          pushl $4
          pushl %esi
          call calloc
          addl $8, %esp
          movl $vtable_Object, (%eax)
          movl %esi, 4(%eax)
          movl %eax, %edx
          popl %ecx
        movl %ecx, -12(%ebp)
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting bools = new boolean[][2]
        pushl $0
        pushl %edx
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting new boolean[][2]
          pushl $0
            # Emitting 2
            pushl $0
            movl $2, %edi
            popl %esi
          cmpl $0, %esi
          jge .L5
          movl $5, %eax
          jmp .ERROR_EXIT
.L5:
          addl $2, %esi
          pushl $4
          pushl %esi
          call calloc
          addl $8, %esp
          movl $vtable_Object, (%eax)
          movl %esi, 4(%eax)
          movl %eax, %edx
          popl %ecx
        movl %ecx, -16(%ebp)
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting b[0] = new B()
        pushl $0
        pushl %edx
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting new B()
          pushl $0
# __________newObject_________________________________________________
          pushl $4
          pushl $1
          call calloc
          addl $8, %esp
          movl $vtable_B, (%eax)
          movl %eax, %edi
          popl %esi
          # Emitting b
          pushl $0
          pushl %esi
          pushl %edi
# __________var_______________________________________________________
          movl -8(%ebp), %edi
# __________swap needed_______________________________________________
          movl %edi, 8(%esp)
          popl %esi
          popl %edi
          popl %edx
          # Emitting 0
          pushl $0
          pushl %edx
          pushl %esi
          pushl %edi
          movl $0, %edi
# __________swap needed_______________________________________________
          movl %edi, 12(%esp)
          popl %edx
          popl %esi
          popl %edi
          popl %ecx
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
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting a[0] = b[0]
        pushl $0
        pushl %edx
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting b[0]
          pushl $0
            # Emitting b
            pushl $0
# ____________var_____________________________________________________
            movl -8(%ebp), %edi
            popl %esi
            # Emitting 0
            pushl $0
            pushl %esi
            pushl %edi
            movl $0, %edi
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
          # Emitting a
          pushl $0
          pushl %edx
          pushl %esi
          pushl %edi
# __________var_______________________________________________________
          movl -4(%ebp), %edi
# __________swap needed_______________________________________________
          movl %edi, 12(%esp)
          popl %edx
          popl %esi
          popl %edi
          popl %ecx
          # Emitting 0
          pushl $0
          pushl %ecx
          pushl %edx
          pushl %esi
          pushl %edi
          movl $0, %edi
# __________swap needed_______________________________________________
          movl %edi, 16(%esp)
          popl %ecx
          popl %edx
          popl %esi
          popl %edi
          popl %ebx
        cmpl $0, %ecx
        jne .L12
        movl $4, %eax
        jmp .ERROR_EXIT
.L12:
        cmpl $0, %ebx
        jge .L13
        movl $3, %eax
        jmp .ERROR_EXIT
.L13:
        cmpl 4(%ecx), %ebx
        jl .L14
        movl $3, %eax
        jmp .ERROR_EXIT
.L14:
        imul $4, %ebx
        addl $8, %ebx
        addl %ebx, %ecx
        movl %edx, (%ecx)
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting i[0] = 1
        pushl $0
        pushl %edx
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting 1
          pushl $0
          movl $1, %edi
          popl %esi
          # Emitting i
          pushl $0
          pushl %esi
          pushl %edi
# __________var_______________________________________________________
          movl -12(%ebp), %edi
# __________swap needed_______________________________________________
          movl %edi, 8(%esp)
          popl %esi
          popl %edi
          popl %edx
          # Emitting 0
          pushl $0
          pushl %edx
          pushl %esi
          pushl %edi
          movl $0, %edi
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
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting i[1] = (i[0] + 1)
        pushl $0
        pushl %edx
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting (i[0] + 1)
          pushl $0
            # Emitting i[0]
            pushl $0
              # Emitting i
              pushl $0
# ______________var___________________________________________________
              movl -12(%ebp), %edi
              popl %esi
              # Emitting 0
              pushl $0
              pushl %esi
              pushl %edi
              movl $0, %edi
# ______________swap needed___________________________________________
              movl %edi, 8(%esp)
              popl %esi
              popl %edi
              popl %edx
            cmpl $0, %esi
            jne .L18
            movl $4, %eax
            jmp .ERROR_EXIT
.L18:
            cmpl $0, %edx
            jge .L19
            movl $3, %eax
            jmp .ERROR_EXIT
.L19:
            cmpl 4(%esi), %edx
            jl .L20
            movl $3, %eax
            jmp .ERROR_EXIT
.L20:
            imul $4, %edx
            addl $8, %edx
            addl %edx, %esi
            movl (%esi), %esi
            popl %edx
            # Emitting 1
            pushl $0
            pushl %edx
            pushl %esi
            pushl %edi
            movl $1, %edi
# ____________swap needed_____________________________________________
            movl %edi, 12(%esp)
            popl %edx
            popl %esi
            popl %edi
            popl %ecx
          add %ecx, %edx
          popl %ecx
          # Emitting i
          pushl $0
          pushl %ecx
          pushl %edx
          pushl %esi
          pushl %edi
# __________var_______________________________________________________
          movl -12(%ebp), %edi
# __________swap needed_______________________________________________
          movl %edi, 16(%esp)
          popl %ecx
          popl %edx
          popl %esi
          popl %edi
          popl %ebx
          # Emitting 1
          pushl $0
          pushl %ebx
          pushl %ecx
          pushl %edx
          pushl %esi
          pushl %edi
          movl $1, %edi
# __________swap needed_______________________________________________
          movl %edi, 20(%esp)
          popl %ebx
          popl %ecx
          popl %edx
          popl %esi
          popl %edi
          popl %eax
        cmpl $0, %ebx
        jne .L21
        movl $4, %eax
        jmp .ERROR_EXIT
.L21:
        cmpl $0, %eax
        jge .L22
        movl $3, %eax
        jmp .ERROR_EXIT
.L22:
        cmpl 4(%ebx), %eax
        jl .L23
        movl $3, %eax
        jmp .ERROR_EXIT
.L23:
        imul $4, %eax
        addl $8, %eax
        addl %eax, %ebx
        movl %ecx, (%ebx)
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting bools[0] = true
        pushl $0
        pushl %edx
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting true
          pushl $0
          movl $1, %edi
          popl %esi
          # Emitting bools
          pushl $0
          pushl %esi
          pushl %edi
# __________var_______________________________________________________
          movl -16(%ebp), %edi
# __________swap needed_______________________________________________
          movl %edi, 8(%esp)
          popl %esi
          popl %edi
          popl %edx
          # Emitting 0
          pushl $0
          pushl %edx
          pushl %esi
          pushl %edi
          movl $0, %edi
# __________swap needed_______________________________________________
          movl %edi, 12(%esp)
          popl %edx
          popl %esi
          popl %edi
          popl %ecx
        cmpl $0, %edx
        jne .L24
        movl $4, %eax
        jmp .ERROR_EXIT
.L24:
        cmpl $0, %ecx
        jge .L25
        movl $3, %eax
        jmp .ERROR_EXIT
.L25:
        cmpl 4(%edx), %ecx
        jl .L26
        movl $3, %eax
        jmp .ERROR_EXIT
.L26:
        imul $4, %ecx
        addl $8, %ecx
        addl %ecx, %edx
        movl %esi, (%edx)
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting bools[1] = (bools[0] && false)
        pushl $0
        pushl %edx
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting (bools[0] && false)
          pushl $0
            # Emitting bools[0]
            pushl $0
              # Emitting bools
              pushl $0
# ______________var___________________________________________________
              movl -16(%ebp), %edi
              popl %esi
              # Emitting 0
              pushl $0
              pushl %esi
              pushl %edi
              movl $0, %edi
# ______________swap needed___________________________________________
              movl %edi, 8(%esp)
              popl %esi
              popl %edi
              popl %edx
            cmpl $0, %esi
            jne .L27
            movl $4, %eax
            jmp .ERROR_EXIT
.L27:
            cmpl $0, %edx
            jge .L28
            movl $3, %eax
            jmp .ERROR_EXIT
.L28:
            cmpl 4(%esi), %edx
            jl .L29
            movl $3, %eax
            jmp .ERROR_EXIT
.L29:
            imul $4, %edx
            addl $8, %edx
            addl %edx, %esi
            movl (%esi), %esi
            popl %edx
            # Emitting false
            pushl $0
            pushl %edx
            pushl %esi
            pushl %edi
            movl $0, %edi
# ____________swap needed_____________________________________________
            movl %edi, 12(%esp)
            popl %edx
            popl %esi
            popl %edi
            popl %ecx
          andl %ecx, %edx
          cmpl $0, %edx
          popl %ecx
          # Emitting bools
          pushl $0
          pushl %ecx
          pushl %edx
          pushl %esi
          pushl %edi
# __________var_______________________________________________________
          movl -16(%ebp), %edi
# __________swap needed_______________________________________________
          movl %edi, 16(%esp)
          popl %ecx
          popl %edx
          popl %esi
          popl %edi
          popl %ebx
          # Emitting 1
          pushl $0
          pushl %ebx
          pushl %ecx
          pushl %edx
          pushl %esi
          pushl %edi
          movl $1, %edi
# __________swap needed_______________________________________________
          movl %edi, 20(%esp)
          popl %ebx
          popl %ecx
          popl %edx
          popl %esi
          popl %edi
          popl %eax
        cmpl $0, %ebx
        jne .L30
        movl $4, %eax
        jmp .ERROR_EXIT
.L30:
        cmpl $0, %eax
        jge .L31
        movl $3, %eax
        jmp .ERROR_EXIT
.L31:
        cmpl 4(%ebx), %eax
        jl .L32
        movl $3, %eax
        jmp .ERROR_EXIT
.L32:
        imul $4, %eax
        addl $8, %eax
        addl %eax, %ebx
        movl %ecx, (%ebx)
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
      addl $4, %esp
    addl $16, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    addl $4, %esp
  addl $4, %esp
