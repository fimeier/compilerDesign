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
pushl $3
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
    # Emitting int[] a
    # Emitting int b
    # Emitting void main(...) {...}
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting a = new int[][-(1)]
# ________assign______________________________________________________
          # Emitting new int[][-(1)]
            # Emitting -(1)
              # Emitting 1
              movl $1, %edi
            negl %edi
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
        # Emitting a[0] = 1
# ________assign______________________________________________________
          # Emitting 1
          movl $1, %esi
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
        # Emitting a[1] = 1
# ________assign______________________________________________________
          # Emitting 1
          movl $1, %esi
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
        cmpl $0, %edi
        jne .L6
        movl $4, %eax
        jmp .ERROR_EXIT
.L6:
        cmpl $0, %edx
        jge .L7
        movl $3, %eax
        jmp .ERROR_EXIT
.L7:
        cmpl 4(%edi), %edx
        jl .L8
        movl $3, %eax
        jmp .ERROR_EXIT
.L8:
        imul $4, %edx
        addl $8, %edx
        addl %edx, %edi
        movl %esi, (%edi)
        # Emitting a[2] = 1
# ________assign______________________________________________________
          # Emitting 1
          movl $1, %esi
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
          # Emitting 2
          pushl $0
          pushl %esi
          pushl %edi
          movl $2, %edi
# __________swap needed_______________________________________________
          movl %edi, 8(%esp)
          popl %edi
          popl %esi
          popl %edx
        cmpl $0, %edi
        jne .L9
        movl $4, %eax
        jmp .ERROR_EXIT
.L9:
        cmpl $0, %edx
        jge .L10
        movl $3, %eax
        jmp .ERROR_EXIT
.L10:
        cmpl 4(%edi), %edx
        jl .L11
        movl $3, %eax
        jmp .ERROR_EXIT
.L11:
        imul $4, %edx
        addl $8, %edx
        addl %edx, %edi
        movl %esi, (%edi)
        # Emitting b = a[1]
# ________assign______________________________________________________
          # Emitting a[1]
            # Emitting a
# ____________var_____________________________________________________
            movl 8(%ebp), %esi
            movl 4(%esi), %esi
            # Emitting 1
            pushl $0
            pushl %esi
            movl $1, %esi
# ____________swap needed_____________________________________________
            movl %esi, 4(%esp)
            popl %esi
            popl %edi
          cmpl $0, %esi
          jne .L12
          movl $4, %eax
          jmp .ERROR_EXIT
.L12:
          cmpl $0, %edi
          jge .L13
          movl $3, %eax
          jmp .ERROR_EXIT
.L13:
          cmpl 4(%esi), %edi
          jl .L14
          movl $3, %eax
          jmp .ERROR_EXIT
.L14:
          imul $4, %edi
          addl $8, %edi
          addl %edi, %esi
          movl (%esi), %esi
        movl 8(%ebp), %edi
        movl %esi, 8(%edi)
        # Emitting write(a[0])
          # Emitting a[0]
            # Emitting a
# ____________var_____________________________________________________
            movl 8(%ebp), %esi
            movl 4(%esi), %esi
            # Emitting 0
            pushl $0
            pushl %esi
            movl $0, %esi
# ____________swap needed_____________________________________________
            movl %esi, 4(%esp)
            popl %esi
            popl %edi
          cmpl $0, %esi
          jne .L15
          movl $4, %eax
          jmp .ERROR_EXIT
.L15:
          cmpl $0, %edi
          jge .L16
          movl $3, %eax
          jmp .ERROR_EXIT
.L16:
          cmpl 4(%esi), %edi
          jl .L17
          movl $3, %eax
          jmp .ERROR_EXIT
.L17:
          imul $4, %edi
          addl $8, %edi
          addl %edi, %esi
          movl (%esi), %esi
        sub $16, %esp
        movl %esi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
