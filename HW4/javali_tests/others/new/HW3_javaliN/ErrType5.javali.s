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
    # variable m
    pushl $0
      # Emitting (...)
        # Emitting m = ((((1 + 2) / 2) % 3) * 5)
# ________assign______________________________________________________
          # Emitting ((((1 + 2) / 2) % 3) * 5)
            # Emitting (((1 + 2) / 2) % 3)
              # Emitting ((1 + 2) / 2)
                # Emitting (1 + 2)
                  # Emitting 2
                  movl $2, %edi
                  # Emitting 1
                  movl $1, %esi
                add %edi, %esi
                # Emitting 2
                movl $2, %edi
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
              # Emitting 3
              movl $3, %edi
            cmpl $0, %edi
            jne .L3
            movl $7, %eax
            jmp .ERROR_EXIT
.L3:
            pushl %edi
            pushl %esi
            popl %eax
            popl %ebx
            cltd
            idivl %ebx
            movl %edx, %esi
            # Emitting 5
            movl $5, %edi
          imul %edi, %esi
        movl %esi, -4(%ebp)
    addl $4, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
