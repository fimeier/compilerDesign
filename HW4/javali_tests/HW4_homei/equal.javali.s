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
    # variable a
    pushl $0
    # variable b
    pushl $0
      # Emitting (...)
        # Emitting a = 1
# ________assign______________________________________________________
          # Emitting 1
          movl $1, %edi
        movl %edi, -4(%ebp)
        # Emitting b = 10
# ________assign______________________________________________________
          # Emitting 10
          movl $10, %edi
        movl %edi, -8(%ebp)
        # Emitting if ((3 == 3)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting (3 == 3)
            # Emitting 3
            movl $3, %edi
            # Emitting 3
            pushl $0
            pushl %edi
            movl $3, %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          cmpl %edi, %esi
          je .L3
          movl $0, %esi
          jmp .L4
.L3:
          movl $1, %esi
.L4:
        jne .L5
          # Emitting (...)
            # Emitting write(1)
              # Emitting 1
              movl $1, %esi
            sub $16, %esp
            movl %esi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
        jmp .L6
.L5:
          # Emitting nop
.L6:
        # Emitting if ((3 > 5)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting (3 > 5)
            # Emitting 5
            movl $5, %esi
            # Emitting 3
            pushl $0
            pushl %esi
            movl $3, %esi
# ____________swap needed_____________________________________________
            movl %esi, 4(%esp)
            popl %esi
            popl %edi
          cmpl %esi, %edi
          setg %al
          movzbl %al, %edi
        jle .L8
          # Emitting (...)
            # Emitting write(2)
              # Emitting 2
              movl $2, %edi
            sub $16, %esp
            movl %edi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
        jmp .L9
.L8:
          # Emitting nop
.L9:
        # Emitting if ((a != b)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting (a != b)
            # Emitting b
# ____________var_____________________________________________________
            movl -8(%ebp), %edi
            # Emitting a
            pushl $0
            pushl %edi
# ____________var_____________________________________________________
            movl -4(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          cmpl %edi, %esi
          jne .L11
          movl $0, %esi
          jmp .L12
.L11:
          movl $1, %esi
.L12:
        je .L13
          # Emitting (...)
            # Emitting write(3)
              # Emitting 3
              movl $3, %esi
            sub $16, %esp
            movl %esi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
        jmp .L14
.L13:
          # Emitting nop
.L14:
    addl $8, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
