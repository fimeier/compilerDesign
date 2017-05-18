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
  # Emitting class B {...}
  # Emitting class Main {...}
    # Emitting void main(...) {...}
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
        # Emitting a = new A[][1]
# ________assign______________________________________________________
          # Emitting new A[][1]
            # Emitting 1
            movl $1, %edi
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
        # Emitting b = new B[][1]
        pushl $0
        pushl %edi
# ________assign______________________________________________________
          # Emitting new B[][1]
            # Emitting 1
            movl $1, %edi
          cmpl $0, %edi
          jge .L3
          movl $5, %eax
          jmp .ERROR_EXIT
.L3:
          addl $2, %edi
          pushl $4
          pushl %edi
          call calloc
          addl $8, %esp
          movl $vtable_Object, (%eax)
          subl $2, %edi
          movl %edi, 4(%eax)
          movl %eax, %esi
        movl %esi, -8(%ebp)
# ________NO swap needed______________________________________________
        popl %edi
        addl $4, %esp
        # Emitting i = new int[][2]
        pushl $0
        pushl %edi
# ________assign______________________________________________________
          # Emitting new int[][2]
            # Emitting 2
            movl $2, %edi
          cmpl $0, %edi
          jge .L4
          movl $5, %eax
          jmp .ERROR_EXIT
.L4:
          addl $2, %edi
          pushl $4
          pushl %edi
          call calloc
          addl $8, %esp
          movl $vtable_Object, (%eax)
          subl $2, %edi
          movl %edi, 4(%eax)
          movl %eax, %esi
        movl %esi, -12(%ebp)
# ________NO swap needed______________________________________________
        popl %edi
        addl $4, %esp
        # Emitting bools = new boolean[][2]
        pushl $0
        pushl %edi
# ________assign______________________________________________________
          # Emitting new boolean[][2]
            # Emitting 2
            movl $2, %edi
          cmpl $0, %edi
          jge .L5
          movl $5, %eax
          jmp .ERROR_EXIT
.L5:
          addl $2, %edi
          pushl $4
          pushl %edi
          call calloc
          addl $8, %esp
          movl $vtable_Object, (%eax)
          subl $2, %edi
          movl %edi, 4(%eax)
          movl %eax, %esi
        movl %esi, -16(%ebp)
# ________NO swap needed______________________________________________
        popl %edi
        addl $4, %esp
        # Emitting b[0] = new B()
        pushl $0
        pushl %edi
# ________assign______________________________________________________
          # Emitting new B()
# __________newObject_________________________________________________
          pushl $4
          pushl $1
          call calloc
          addl $8, %esp
          movl $vtable_B, (%eax)
          movl %eax, %edi
          # Emitting b
          pushl $0
          pushl %edi
# __________var_______________________________________________________
          movl -8(%ebp), %edi
# __________swap needed_______________________________________________
          movl %edi, 4(%esp)
          popl %edi
          popl %esi
          # Emitting 0
          pushl $0
          pushl %esi
          pushl %edi
          movl $0, %edi
# __________swap needed_______________________________________________
          movl %edi, 8(%esp)
          popl %edi
          popl %esi
          popl %edx
        cmpl $0, %esi
        jne .L6
        movl $4, %eax
        jmp .ERROR_EXIT
.L6:
        cmpl $0, %edx
        jge .L7
        movl $3, %eax
        jmp .ERROR_EXIT
.L7:
        cmpl 4(%esi), %edx
        jl .L8
        movl $3, %eax
        jmp .ERROR_EXIT
.L8:
        imul $4, %edx
        addl $8, %edx
        addl %edx, %esi
        movl %edi, (%esi)
# ________NO swap needed______________________________________________
        popl %edi
        addl $4, %esp
        # Emitting a[0] = b[0]
        pushl $0
        pushl %edi
# ________assign______________________________________________________
          # Emitting b[0]
            # Emitting b
# ____________var_____________________________________________________
            movl -8(%ebp), %edi
            # Emitting 0
            pushl $0
            pushl %edi
            movl $0, %edi
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
          # Emitting a
          pushl $0
          pushl %edi
# __________var_______________________________________________________
          movl -4(%ebp), %edi
# __________swap needed_______________________________________________
          movl %edi, 4(%esp)
          popl %edi
          popl %esi
          # Emitting 0
          pushl $0
          pushl %esi
          pushl %edi
          movl $0, %edi
# __________swap needed_______________________________________________
          movl %edi, 8(%esp)
          popl %edi
          popl %esi
          popl %edx
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
        movl %edi, (%esi)
# ________NO swap needed______________________________________________
        popl %edi
        addl $4, %esp
        # Emitting i[0] = 1
        pushl $0
        pushl %edi
# ________assign______________________________________________________
          # Emitting 1
          movl $1, %edi
          # Emitting i
          pushl $0
          pushl %edi
# __________var_______________________________________________________
          movl -12(%ebp), %edi
# __________swap needed_______________________________________________
          movl %edi, 4(%esp)
          popl %edi
          popl %esi
          # Emitting 0
          pushl $0
          pushl %esi
          pushl %edi
          movl $0, %edi
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
# ________NO swap needed______________________________________________
        popl %edi
        addl $4, %esp
        # Emitting i[1] = (i[0] + 1)
        pushl $0
        pushl %edi
# ________assign______________________________________________________
          # Emitting (i[0] + 1)
            # Emitting i[0]
              # Emitting i
# ______________var___________________________________________________
              movl -12(%ebp), %edi
              # Emitting 0
              pushl $0
              pushl %edi
              movl $0, %edi
# ______________swap needed___________________________________________
              movl %edi, 4(%esp)
              popl %edi
              popl %esi
            cmpl $0, %edi
            jne .L18
            movl $4, %eax
            jmp .ERROR_EXIT
.L18:
            cmpl $0, %esi
            jge .L19
            movl $3, %eax
            jmp .ERROR_EXIT
.L19:
            cmpl 4(%edi), %esi
            jl .L20
            movl $3, %eax
            jmp .ERROR_EXIT
.L20:
            imul $4, %esi
            addl $8, %esi
            addl %esi, %edi
            movl (%edi), %edi
            # Emitting 1
            pushl $0
            pushl %edi
            movl $1, %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          add %esi, %edi
          # Emitting i
          pushl $0
          pushl %edi
# __________var_______________________________________________________
          movl -12(%ebp), %edi
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
        jne .L21
        movl $4, %eax
        jmp .ERROR_EXIT
.L21:
        cmpl $0, %edx
        jge .L22
        movl $3, %eax
        jmp .ERROR_EXIT
.L22:
        cmpl 4(%esi), %edx
        jl .L23
        movl $3, %eax
        jmp .ERROR_EXIT
.L23:
        imul $4, %edx
        addl $8, %edx
        addl %edx, %esi
        movl %edi, (%esi)
# ________NO swap needed______________________________________________
        popl %edi
        addl $4, %esp
        # Emitting bools[0] = true
        pushl $0
        pushl %edi
# ________assign______________________________________________________
          # Emitting true
          movl $1, %edi
          # Emitting bools
          pushl $0
          pushl %edi
# __________var_______________________________________________________
          movl -16(%ebp), %edi
# __________swap needed_______________________________________________
          movl %edi, 4(%esp)
          popl %edi
          popl %esi
          # Emitting 0
          pushl $0
          pushl %esi
          pushl %edi
          movl $0, %edi
# __________swap needed_______________________________________________
          movl %edi, 8(%esp)
          popl %edi
          popl %esi
          popl %edx
        cmpl $0, %esi
        jne .L24
        movl $4, %eax
        jmp .ERROR_EXIT
.L24:
        cmpl $0, %edx
        jge .L25
        movl $3, %eax
        jmp .ERROR_EXIT
.L25:
        cmpl 4(%esi), %edx
        jl .L26
        movl $3, %eax
        jmp .ERROR_EXIT
.L26:
        imul $4, %edx
        addl $8, %edx
        addl %edx, %esi
        movl %edi, (%esi)
# ________NO swap needed______________________________________________
        popl %edi
        addl $4, %esp
        # Emitting bools[1] = (bools[0] && false)
        pushl $0
        pushl %edi
# ________assign______________________________________________________
          # Emitting (bools[0] && false)
            # Emitting bools[0]
              # Emitting bools
# ______________var___________________________________________________
              movl -16(%ebp), %edi
              # Emitting 0
              pushl $0
              pushl %edi
              movl $0, %edi
# ______________swap needed___________________________________________
              movl %edi, 4(%esp)
              popl %edi
              popl %esi
            cmpl $0, %edi
            jne .L27
            movl $4, %eax
            jmp .ERROR_EXIT
.L27:
            cmpl $0, %esi
            jge .L28
            movl $3, %eax
            jmp .ERROR_EXIT
.L28:
            cmpl 4(%edi), %esi
            jl .L29
            movl $3, %eax
            jmp .ERROR_EXIT
.L29:
            imul $4, %esi
            addl $8, %esi
            addl %esi, %edi
            movl (%edi), %edi
            # Emitting false
            pushl $0
            pushl %edi
            movl $0, %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          andl %esi, %edi
          cmpl $0, %edi
          # Emitting bools
          pushl $0
          pushl %edi
# __________var_______________________________________________________
          movl -16(%ebp), %edi
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
        jne .L30
        movl $4, %eax
        jmp .ERROR_EXIT
.L30:
        cmpl $0, %edx
        jge .L31
        movl $3, %eax
        jmp .ERROR_EXIT
.L31:
        cmpl 4(%esi), %edx
        jl .L32
        movl $3, %eax
        jmp .ERROR_EXIT
.L32:
        imul $4, %edx
        addl $8, %edx
        addl %edx, %esi
        movl %edi, (%esi)
# ________NO swap needed______________________________________________
        popl %edi
        addl $4, %esp
    addl $16, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
