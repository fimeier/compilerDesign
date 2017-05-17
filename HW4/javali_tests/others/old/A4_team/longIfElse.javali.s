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
    # variable c
    pushl $0
      # Emitting (...)
        # Emitting a = 3
# ________assign______________________________________________________
          # Emitting 3
          movl $3, %edi
        movl %edi, -4(%ebp)
        # Emitting b = 17
# ________assign______________________________________________________
          # Emitting 17
          movl $17, %edi
        movl %edi, -8(%ebp)
        # Emitting c = (b % a)
# ________assign______________________________________________________
          # Emitting (b % a)
            # Emitting a
# ____________var_____________________________________________________
            movl -4(%ebp), %edi
            # Emitting b
# ____________var_____________________________________________________
            movl -8(%ebp), %esi
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
          movl %edx, %esi
        movl %esi, -12(%ebp)
        # Emitting if ((a < b)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting (a < b)
            # Emitting b
# ____________var_____________________________________________________
            movl -8(%ebp), %esi
            # Emitting a
# ____________var_____________________________________________________
            movl -4(%ebp), %edi
          cmpl %esi, %edi
          setl %al
          movzbl %al, %edi
        jge .L3
          # Emitting (...)
            # Emitting b = 3
# ____________assign__________________________________________________
              # Emitting 3
              movl $3, %edi
            movl %edi, -8(%ebp)
            # Emitting if ((b > c)) {...} else {...}
# ____________ifElse__________________________________________________
              # Emitting (b > c)
                # Emitting c
# ________________var_________________________________________________
                movl -12(%ebp), %edi
                # Emitting b
# ________________var_________________________________________________
                movl -8(%ebp), %esi
              cmpl %edi, %esi
              setg %al
              movzbl %al, %esi
            jle .L5
              # Emitting (...)
                # Emitting c = 7
# ________________assign______________________________________________
                  # Emitting 7
                  movl $7, %esi
                movl %esi, -12(%ebp)
            jmp .L6
.L5:
              # Emitting (...)
                # Emitting a = 0
# ________________assign______________________________________________
                  # Emitting 0
                  movl $0, %esi
                movl %esi, -4(%ebp)
.L6:
        jmp .L4
.L3:
          # Emitting (...)
            # Emitting a = 2
# ____________assign__________________________________________________
              # Emitting 2
              movl $2, %esi
            movl %esi, -4(%ebp)
            # Emitting c = 9
# ____________assign__________________________________________________
              # Emitting 9
              movl $9, %esi
            movl %esi, -12(%ebp)
            # Emitting if ((b < c)) {...} else {...}
# ____________ifElse__________________________________________________
              # Emitting (b < c)
                # Emitting c
# ________________var_________________________________________________
                movl -12(%ebp), %esi
                # Emitting b
# ________________var_________________________________________________
                movl -8(%ebp), %edi
              cmpl %esi, %edi
              setl %al
              movzbl %al, %edi
            jge .L7
              # Emitting (...)
                # Emitting a = 3
# ________________assign______________________________________________
                  # Emitting 3
                  movl $3, %edi
                movl %edi, -4(%ebp)
            jmp .L8
.L7:
              # Emitting (...)
                # Emitting b = (a + c)
# ________________assign______________________________________________
                  # Emitting (a + c)
                    # Emitting c
# ____________________var_____________________________________________
                    movl -12(%ebp), %edi
                    # Emitting a
# ____________________var_____________________________________________
                    movl -4(%ebp), %esi
                  add %edi, %esi
                movl %esi, -8(%ebp)
.L8:
.L4:
        # Emitting write(a)
          # Emitting a
# __________var_______________________________________________________
          movl -4(%ebp), %esi
        sub $16, %esp
        movl %esi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        # Emitting write(b)
          # Emitting b
# __________var_______________________________________________________
          movl -8(%ebp), %esi
        sub $16, %esp
        movl %esi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        # Emitting write(c)
          # Emitting c
# __________var_______________________________________________________
          movl -12(%ebp), %esi
        sub $16, %esp
        movl %esi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
    addl $12, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
