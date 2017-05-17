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
    # variable d
    pushl $0
    # variable e
    pushl $0
    # variable f
    pushl $0
    # variable g
    pushl $0
      # Emitting (...)
        # Emitting a = (false || false)
# ________assign______________________________________________________
          # Emitting (false || false)
            # Emitting false
            movl $0, %edi
            # Emitting false
            movl $0, %esi
          orl %edi, %esi
          cmpl $0, %esi
        movl %esi, -4(%ebp)
        # Emitting b = (false || true)
# ________assign______________________________________________________
          # Emitting (false || true)
            # Emitting true
            movl $1, %esi
            # Emitting false
            movl $0, %edi
          orl %esi, %edi
          cmpl $0, %edi
        movl %edi, -8(%ebp)
        # Emitting c = (true || false)
# ________assign______________________________________________________
          # Emitting (true || false)
            # Emitting false
            movl $0, %edi
            # Emitting true
            movl $1, %esi
          orl %edi, %esi
          cmpl $0, %esi
        movl %esi, -12(%ebp)
        # Emitting d = (true && false)
# ________assign______________________________________________________
          # Emitting (true && false)
            # Emitting false
            movl $0, %esi
            # Emitting true
            movl $1, %edi
          andl %esi, %edi
          cmpl $0, %edi
        movl %edi, -16(%ebp)
        # Emitting e = (false && false)
# ________assign______________________________________________________
          # Emitting (false && false)
            # Emitting false
            movl $0, %edi
            # Emitting false
            movl $0, %esi
          andl %edi, %esi
          cmpl $0, %esi
        movl %esi, -20(%ebp)
        # Emitting if (a) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting a
# __________var_______________________________________________________
          movl -4(%ebp), %esi
        cmpl $0, %esi
        je .L2
          # Emitting (...)
            # Emitting if (((b || a) || c)) {...} else {...}
# ____________ifElse__________________________________________________
              # Emitting ((b || a) || c)
                # Emitting (b || a)
                  # Emitting a
# __________________var_______________________________________________
                  movl -4(%ebp), %esi
                  # Emitting b
# __________________var_______________________________________________
                  movl -8(%ebp), %edi
                orl %esi, %edi
                cmpl $0, %edi
                # Emitting c
# ________________var_________________________________________________
                movl -12(%ebp), %esi
              orl %esi, %edi
              cmpl $0, %edi
            je .L4
              # Emitting (...)
                # Emitting write(0)
                  # Emitting 0
                  movl $0, %edi
                sub $16, %esp
                movl %edi, 4(%esp)
                movl $STR_D, 0(%esp)
                call printf
                add $16, %esp
            jmp .L5
.L4:
              # Emitting (...)
                # Emitting write(1)
                  # Emitting 1
                  movl $1, %edi
                sub $16, %esp
                movl %edi, 4(%esp)
                movl $STR_D, 0(%esp)
                call printf
                add $16, %esp
.L5:
        jmp .L3
.L2:
          # Emitting (...)
            # Emitting if (((d && d) || d)) {...} else {...}
# ____________ifElse__________________________________________________
              # Emitting ((d && d) || d)
                # Emitting (d && d)
                  # Emitting d
# __________________var_______________________________________________
                  movl -16(%ebp), %edi
                  # Emitting d
# __________________var_______________________________________________
                  movl -16(%ebp), %esi
                andl %edi, %esi
                cmpl $0, %esi
                # Emitting d
# ________________var_________________________________________________
                movl -16(%ebp), %edi
              orl %edi, %esi
              cmpl $0, %esi
            je .L6
              # Emitting (...)
                # Emitting write(2)
                  # Emitting 2
                  movl $2, %esi
                sub $16, %esp
                movl %esi, 4(%esp)
                movl $STR_D, 0(%esp)
                call printf
                add $16, %esp
            jmp .L7
.L6:
              # Emitting nop
.L7:
            # Emitting if ((e && false)) {...} else {...}
# ____________ifElse__________________________________________________
              # Emitting (e && false)
                # Emitting false
                movl $0, %esi
                # Emitting e
# ________________var_________________________________________________
                movl -20(%ebp), %edi
              andl %esi, %edi
              cmpl $0, %edi
            je .L8
              # Emitting (...)
                # Emitting write(3)
                  # Emitting 3
                  movl $3, %edi
                sub $16, %esp
                movl %edi, 4(%esp)
                movl $STR_D, 0(%esp)
                call printf
                add $16, %esp
            jmp .L9
.L8:
              # Emitting (...)
                # Emitting if ((true || e)) {...} else {...}
# ________________ifElse______________________________________________
                  # Emitting (true || e)
                    # Emitting e
# ____________________var_____________________________________________
                    movl -20(%ebp), %edi
                    # Emitting true
                    movl $1, %esi
                  orl %edi, %esi
                  cmpl $0, %esi
                je .L10
                  # Emitting (...)
                    # Emitting e = false
# ____________________assign__________________________________________
                      # Emitting false
                      movl $0, %esi
                    movl %esi, -20(%ebp)
                    # Emitting write(4)
                      # Emitting 4
                      movl $4, %esi
                    sub $16, %esp
                    movl %esi, 4(%esp)
                    movl $STR_D, 0(%esp)
                    call printf
                    add $16, %esp
                jmp .L11
.L10:
                  # Emitting nop
.L11:
.L9:
            # Emitting if (!(e)) {...} else {...}
# ____________ifElse__________________________________________________
              # Emitting !(e)
                # Emitting e
# ________________var_________________________________________________
                movl -20(%ebp), %esi
              negl %esi
              incl %esi
              cmpl $0, %esi
            je .L12
              # Emitting (...)
                # Emitting e = ((a || b) || c)
# ________________assign______________________________________________
                  # Emitting ((a || b) || c)
                    # Emitting (a || b)
                      # Emitting b
# ______________________var___________________________________________
                      movl -8(%ebp), %esi
                      # Emitting a
# ______________________var___________________________________________
                      movl -4(%ebp), %edi
                    orl %esi, %edi
                    cmpl $0, %edi
                    # Emitting c
# ____________________var_____________________________________________
                    movl -12(%ebp), %esi
                  orl %esi, %edi
                  cmpl $0, %edi
                movl %edi, -20(%ebp)
                # Emitting write(7)
                  # Emitting 7
                  movl $7, %edi
                sub $16, %esp
                movl %edi, 4(%esp)
                movl $STR_D, 0(%esp)
                call printf
                add $16, %esp
            jmp .L13
.L12:
              # Emitting nop
.L13:
.L3:
    addl $28, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
