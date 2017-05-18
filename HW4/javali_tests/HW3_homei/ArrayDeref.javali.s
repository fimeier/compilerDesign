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
    # variable x
    pushl $0
      # Emitting (...)
        # Emitting x = new int[][5]
# ________assign______________________________________________________
          # Emitting new int[][5]
            # Emitting 5
            movl $5, %edi
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
        # Emitting x[7] = 5
# ________assign______________________________________________________
          # Emitting 5
          movl $5, %esi
          # Emitting x
          pushl $0
          pushl %esi
# __________var_______________________________________________________
          movl -4(%ebp), %esi
# __________swap needed_______________________________________________
          movl %esi, 4(%esp)
          popl %esi
          popl %edi
          # Emitting 7
          pushl $0
          pushl %esi
          pushl %edi
          movl $7, %edi
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
    addl $4, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
