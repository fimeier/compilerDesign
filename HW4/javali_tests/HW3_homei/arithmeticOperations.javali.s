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
    # Emitting int a
    # Emitting int b
    # Emitting int c
    # Emitting int res
    # Emitting boolean e
    # Emitting void main(...) {...}
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting a = 1
# ________assign______________________________________________________
          # Emitting 1
          movl $1, %edi
        movl 8(%ebp), %esi
        movl %edi, 4(%esi)
        # Emitting b = 2
# ________assign______________________________________________________
          # Emitting 2
          movl $2, %edi
        movl 8(%ebp), %esi
        movl %edi, 8(%esi)
        # Emitting c = 3
# ________assign______________________________________________________
          # Emitting 3
          movl $3, %edi
        movl 8(%ebp), %esi
        movl %edi, 12(%esi)
        # Emitting res = ((-(a) + +(b)) - ((c * a) % (b / 1)))
# ________assign______________________________________________________
          # Emitting ((-(a) + +(b)) - ((c * a) % (b / 1)))
            # Emitting ((c * a) % (b / 1))
              # Emitting (b / 1)
                # Emitting 1
                movl $1, %edi
                # Emitting b
# ________________var_________________________________________________
                movl 8(%ebp), %esi
                movl 8(%esi), %esi
              cmpl $0, %edi
              jne .L2
              movl $7, %eax
              jmp .ERROR_EXIT
.L2:
              pushl %edi
              pushl %esi
              popl %eax
              popl %ebx
              cltd
              idivl %ebx
              movl %eax, %esi
              # Emitting (c * a)
                # Emitting a
# ________________var_________________________________________________
                movl 8(%ebp), %edi
                movl 4(%edi), %edi
                # Emitting c
# ________________var_________________________________________________
                movl 8(%ebp), %edx
                movl 12(%edx), %edx
              imul %edi, %edx
            cmpl $0, %esi
            jne .L3
            movl $7, %eax
            jmp .ERROR_EXIT
.L3:
            pushl %esi
            pushl %edx
            popl %eax
            popl %ebx
            cltd
            idivl %ebx
            movl %edx, %edx
            # Emitting (-(a) + +(b))
              # Emitting +(b)
                # Emitting b
# ________________var_________________________________________________
                movl 8(%ebp), %esi
                movl 8(%esi), %esi
              # Emitting -(a)
                # Emitting a
# ________________var_________________________________________________
                movl 8(%ebp), %edi
                movl 4(%edi), %edi
              negl %edi
            add %esi, %edi
          sub %edx, %edi
        movl 8(%ebp), %edx
        movl %edi, 16(%edx)
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
