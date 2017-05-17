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
      # Emitting (...)
        # Emitting a = b
# ________assign______________________________________________________
          # Emitting b
# __________var_______________________________________________________
          movl -8(%ebp), %edi
        movl %edi, -4(%ebp)
        # Emitting c = (a / 1)
# ________assign______________________________________________________
          # Emitting (a / 1)
            # Emitting 1
            movl $1, %edi
            # Emitting a
# ____________var_____________________________________________________
            movl -4(%ebp), %esi
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
        movl %esi, -12(%ebp)
        # Emitting a = (((b / (c + 1)) / (d + 2)) / -(-(3)))
# ________assign______________________________________________________
          # Emitting (((b / (c + 1)) / (d + 2)) / -(-(3)))
            # Emitting ((b / (c + 1)) / (d + 2))
              # Emitting (d + 2)
                # Emitting 2
                movl $2, %esi
                # Emitting d
# ________________var_________________________________________________
                movl -16(%ebp), %edi
              add %esi, %edi
              # Emitting (b / (c + 1))
                # Emitting (c + 1)
                  # Emitting 1
                  movl $1, %esi
                  # Emitting c
# __________________var_______________________________________________
                  movl -12(%ebp), %edx
                add %esi, %edx
                # Emitting b
# ________________var_________________________________________________
                movl -8(%ebp), %esi
              cmpl $0, %edx
              jne .L3
              movl $7, %eax
              jmp .ERROR_EXIT
.L3:
              pushl %edx
              pushl %esi
              popl %eax
              popl %ebx
              cltd
              idivl %ebx
              movl %eax, %esi
            cmpl $0, %edi
            jne .L4
            movl $7, %eax
            jmp .ERROR_EXIT
.L4:
            pushl %edi
            pushl %esi
            popl %eax
            popl %ebx
            cltd
            idivl %ebx
            movl %eax, %esi
            # Emitting -(-(3))
              # Emitting -(3)
                # Emitting 3
                movl $3, %edi
              negl %edi
            negl %edi
          cmpl $0, %edi
          jne .L5
          movl $7, %eax
          jmp .ERROR_EXIT
.L5:
          pushl %edi
          pushl %esi
          popl %eax
          popl %ebx
          cltd
          idivl %ebx
          movl %eax, %esi
        movl %esi, -4(%ebp)
        # Emitting e = -(-(-(-(-(-(+(+(+(0)))))))))
# ________assign______________________________________________________
          # Emitting -(-(-(-(-(-(+(+(+(0)))))))))
            # Emitting -(-(-(-(-(+(+(+(0))))))))
              # Emitting -(-(-(-(+(+(+(0)))))))
                # Emitting -(-(-(+(+(+(0))))))
                  # Emitting -(-(+(+(+(0)))))
                    # Emitting -(+(+(+(0))))
                      # Emitting +(+(+(0)))
                        # Emitting +(+(0))
                          # Emitting +(0)
                            # Emitting 0
                            movl $0, %esi
                    negl %esi
                  negl %esi
                negl %esi
              negl %esi
            negl %esi
          negl %esi
        movl %esi, -20(%ebp)
        # Emitting write(-(-(0)))
          # Emitting -(-(0))
            # Emitting -(0)
              # Emitting 0
              movl $0, %esi
            negl %esi
          negl %esi
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
        # Emitting write(-(0))
          # Emitting -(0)
            # Emitting 0
            movl $0, %esi
          negl %esi
        sub $16, %esp
        movl %esi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
    addl $20, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
