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
  pushl $0
    # Emitting void main(...) {...}
    pushl $0
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    # variable b
    pushl $0
      # Emitting (...)
      pushl $0
        # Emitting b = true
        pushl $0
# ________assign______________________________________________________
          # Emitting true
          pushl $0
          movl $1, %edi
          popl %esi
        movl %esi, -4(%ebp)
        addl $4, %esp
        # Emitting if (!(false)) {...} else {...}
        pushl $0
        pushl %edi
# ________ifElse______________________________________________________
          # Emitting !(false)
          pushl $0
            # Emitting false
            pushl $0
            movl $0, %edi
            popl %esi
          negl %esi
          incl %esi
          cmpl $0, %esi
          popl %edx
        je .L3
          # Emitting (...)
          pushl $0
          pushl %esi
          pushl %edi
          popl %esi
          popl %edi
          addl $4, %esp
        jmp .L4
.L3:
          # Emitting nop
          pushl $0
          pushl %esi
          pushl %edi
          popl %esi
          popl %edi
          addl $4, %esp
.L4:
        popl %edi
        addl $4, %esp
        # Emitting if ((b == false)) {...} else {...}
        pushl $0
        pushl %esi
        pushl %edi
# ________ifElse______________________________________________________
          # Emitting (b == false)
          pushl $0
            # Emitting false
            pushl $0
            movl $0, %edi
            popl %esi
            # Emitting b
            pushl $0
            pushl %esi
            pushl %edi
# ____________var_____________________________________________________
            movl -4(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 8(%esp)
            popl %esi
            popl %edi
            popl %edx
          cmpl %esi, %edx
          je .L6
          movl $0, %edx
          jmp .L7
.L6:
          movl $1, %edx
.L7:
          popl %esi
        jne .L8
          # Emitting (...)
          pushl $0
          pushl %edx
          pushl %edi
          popl %edx
          popl %edi
          addl $4, %esp
        jmp .L9
.L8:
          # Emitting nop
          pushl $0
          pushl %edx
          pushl %edi
          popl %edx
          popl %edi
          addl $4, %esp
.L9:
        popl %esi
        popl %edi
        addl $4, %esp
      addl $4, %esp
    addl $4, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    addl $4, %esp
  addl $4, %esp
