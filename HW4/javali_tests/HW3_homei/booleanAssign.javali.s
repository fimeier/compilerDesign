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
    # variable k
    pushl $0
    # variable a
    pushl $0
    # variable b
    pushl $0
    # variable c
    pushl $0
      # Emitting (...)
        # Emitting a = 2
# ________assign______________________________________________________
          # Emitting 2
          movl $2, %edi
        movl %edi, -8(%ebp)
        # Emitting b = 1
# ________assign______________________________________________________
          # Emitting 1
          movl $1, %edi
        movl %edi, -12(%ebp)
        # Emitting c = 6
# ________assign______________________________________________________
          # Emitting 6
          movl $6, %edi
        movl %edi, -16(%ebp)
        # Emitting k = ((b < a) && (a < c))
# ________assign______________________________________________________
          # Emitting ((b < a) && (a < c))
            # Emitting (a < c)
              # Emitting c
# ______________var___________________________________________________
              movl -16(%ebp), %edi
              # Emitting a
              pushl $0
              pushl %edi
# ______________var___________________________________________________
              movl -8(%ebp), %edi
# ______________swap needed___________________________________________
              movl %edi, 4(%esp)
              popl %edi
              popl %esi
            cmpl %edi, %esi
            setl %al
            movzbl %al, %esi
            # Emitting (b < a)
            pushl $0
            pushl %esi
              # Emitting a
# ______________var___________________________________________________
              movl -8(%ebp), %esi
              # Emitting b
              pushl $0
              pushl %esi
# ______________var___________________________________________________
              movl -12(%ebp), %esi
# ______________swap needed___________________________________________
              movl %esi, 4(%esp)
              popl %esi
              popl %edi
            cmpl %esi, %edi
            setl %al
            movzbl %al, %edi
            popl %esi
            addl $4, %esp
          andl %esi, %edi
          cmpl $0, %edi
        movl %edi, -4(%ebp)
        # Emitting if (k) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting k
# __________var_______________________________________________________
          movl -4(%ebp), %edi
        cmpl $0, %edi
        je .L3
          # Emitting (...)
            # Emitting write(1)
              # Emitting 1
              movl $1, %edi
            sub $16, %esp
            movl %edi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
        jmp .L4
.L3:
          # Emitting (...)
            # Emitting write(0)
              # Emitting 0
              movl $0, %edi
            sub $16, %esp
            movl %edi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
.L4:
    addl $16, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
