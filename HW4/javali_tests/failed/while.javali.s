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
    # variable i
    pushl $0
      # Emitting (...)
      pushl $0
        # Emitting i = 0
        pushl $0
# ________assign______________________________________________________
          # Emitting 0
          pushl $0
          movl $0, %edi
          popl %esi
        movl %esi, -4(%ebp)
        addl $4, %esp
        # Emitting while ((i < 5)) {...}
        pushl $0
        pushl %edi
# ________whileLoop___________________________________________________
.L2:
          # Emitting (i < 5)
          pushl $0
            # Emitting 5
            pushl $0
            movl $5, %edi
            popl %esi
            # Emitting i
            pushl $0
            pushl %esi
            pushl %edi
# ____________var_____________________________________________________
            movl -4(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 8(%esp)
            popl %edi
            popl %esi
            popl %edx
          cmpl %esi, %edx
          setl %al
          movzbl %al, %edx
          popl %esi
        jge .L3
          # Emitting (...)
          pushl $0
          pushl %edx
          pushl %edi
            # Emitting i = (i + 1)
            pushl $0
# ____________assign__________________________________________________
              # Emitting (i + 1)
              pushl $0
                # Emitting 1
                pushl $0
                movl $1, %edi
                popl %edx
                # Emitting i
                pushl $0
                pushl %edx
                pushl %edi
# ________________var_________________________________________________
                movl -4(%ebp), %edi
# ________________swap needed_________________________________________
                movl %edi, 8(%esp)
                popl %edi
                popl %edx
                popl %esi
              add %edx, %esi
              popl %edx
            movl %edx, -4(%ebp)
            addl $4, %esp
            # Emitting write(i)
            pushl $0
            pushl %esi
            pushl %edi
              # Emitting i
              pushl $0
# ______________var___________________________________________________
              movl -4(%ebp), %edi
              popl %esi
            sub $16, %esp
            movl %esi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
            popl %edi
            popl %esi
            addl $4, %esp
          popl %edi
          popl %edx
          addl $4, %esp
        jmp .L2
.L3:
.L4:
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
