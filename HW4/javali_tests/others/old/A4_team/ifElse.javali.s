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
    # Emitting int i
    # Emitting void main(...) {...}
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting i = 4
# ________assign______________________________________________________
          # Emitting 4
          movl $4, %edi
        movl 8(%ebp), %esi
        movl %edi, 4(%esi)
        # Emitting if ((i < 2)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting (i < 2)
            # Emitting 2
            movl $2, %edi
            # Emitting i
# ____________var_____________________________________________________
            movl 8(%ebp), %esi
            movl 4(%esi), %esi
          cmpl %edi, %esi
          setl %al
          movzbl %al, %esi
        jge .L2
          # Emitting (...)
            # Emitting write(2)
              # Emitting 2
              movl $2, %esi
            sub $16, %esp
            movl %esi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
        jmp .L3
.L2:
          # Emitting (...)
            # Emitting write(i)
              # Emitting i
# ______________var___________________________________________________
              movl 8(%ebp), %esi
              movl 4(%esi), %esi
            sub $16, %esp
            movl %esi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
.L3:
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
