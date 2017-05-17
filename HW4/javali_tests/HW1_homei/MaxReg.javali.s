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
    # variable b
    pushl $0
    # variable a
    pushl $0
      # Emitting (...)
        # Emitting a = 0
# ________assign______________________________________________________
          # Emitting 0
          movl $0, %edi
        movl %edi, -8(%ebp)
        # Emitting b = 2
# ________assign______________________________________________________
          # Emitting 2
          movl $2, %edi
        movl %edi, -4(%ebp)
        # Emitting write(((100 * ((((b + 1) + (1 + 1)) * ((1 + 1) + (1 + 1))) + (((1 + 1) + (1 + 1)) * ((1 + 1) + (1 + 1))))) * ((((1 + 1) + (1 + 1)) * ((1 + 1) + (1 + a))) + (((1 + 1) + (1 + 1)) * ((1 + 1) + (1 + 1))))))
          # Emitting ((100 * ((((b + 1) + (1 + 1)) * ((1 + 1) + (1 + 1))) + (((1 + 1) + (1 + 1)) * ((1 + 1) + (1 + 1))))) * ((((1 + 1) + (1 + 1)) * ((1 + 1) + (1 + a))) + (((1 + 1) + (1 + 1)) * ((1 + 1) + (1 + 1)))))
            # Emitting ((((1 + 1) + (1 + 1)) * ((1 + 1) + (1 + a))) + (((1 + 1) + (1 + 1)) * ((1 + 1) + (1 + 1))))
              # Emitting (((1 + 1) + (1 + 1)) * ((1 + 1) + (1 + 1)))
                # Emitting ((1 + 1) + (1 + 1))
                  # Emitting (1 + 1)
                    # Emitting 1
                    movl $1, %edi
                    # Emitting 1
                    movl $1, %esi
                  add %edi, %esi
                  # Emitting (1 + 1)
                    # Emitting 1
                    movl $1, %edi
                    # Emitting 1
                    movl $1, %edx
                  add %edi, %edx
                add %esi, %edx
                # Emitting ((1 + 1) + (1 + 1))
                  # Emitting (1 + 1)
                    # Emitting 1
                    movl $1, %esi
                    # Emitting 1
                    movl $1, %edi
                  add %esi, %edi
                  # Emitting (1 + 1)
                    # Emitting 1
                    movl $1, %esi
                    # Emitting 1
                    movl $1, %ecx
                  add %esi, %ecx
                add %edi, %ecx
              imul %edx, %ecx
              # Emitting (((1 + 1) + (1 + 1)) * ((1 + 1) + (1 + a)))
                # Emitting ((1 + 1) + (1 + a))
                  # Emitting (1 + a)
                    # Emitting a
# ____________________var_____________________________________________
                    movl -8(%ebp), %edx
                    # Emitting 1
                    movl $1, %edi
                  add %edx, %edi
                  # Emitting (1 + 1)
                    # Emitting 1
                    movl $1, %edx
                    # Emitting 1
                    movl $1, %esi
                  add %edx, %esi
                add %edi, %esi
                # Emitting ((1 + 1) + (1 + 1))
                  # Emitting (1 + 1)
                    # Emitting 1
                    movl $1, %edi
                    # Emitting 1
                    movl $1, %edx
                  add %edi, %edx
                  # Emitting (1 + 1)
                    # Emitting 1
                    movl $1, %edi
                    # Emitting 1
                    movl $1, %ebx
                  add %edi, %ebx
                add %edx, %ebx
              imul %esi, %ebx
            add %ecx, %ebx
            # Emitting (100 * ((((b + 1) + (1 + 1)) * ((1 + 1) + (1 + 1))) + (((1 + 1) + (1 + 1)) * ((1 + 1) + (1 + 1)))))
              # Emitting ((((b + 1) + (1 + 1)) * ((1 + 1) + (1 + 1))) + (((1 + 1) + (1 + 1)) * ((1 + 1) + (1 + 1))))
                # Emitting (((1 + 1) + (1 + 1)) * ((1 + 1) + (1 + 1)))
                  # Emitting ((1 + 1) + (1 + 1))
                    # Emitting (1 + 1)
                      # Emitting 1
                      movl $1, %ecx
                      # Emitting 1
                      movl $1, %esi
                    add %ecx, %esi
                    # Emitting (1 + 1)
                      # Emitting 1
                      movl $1, %ecx
                      # Emitting 1
                      movl $1, %edx
                    add %ecx, %edx
                  add %esi, %edx
                  # Emitting ((1 + 1) + (1 + 1))
                    # Emitting (1 + 1)
                      # Emitting 1
                      movl $1, %esi
                      # Emitting 1
                      movl $1, %ecx
                    add %esi, %ecx
                    # Emitting (1 + 1)
                      # Emitting 1
                      movl $1, %esi
                      # Emitting 1
                      movl $1, %edi
                    add %esi, %edi
                  add %ecx, %edi
                imul %edx, %edi
                # Emitting (((b + 1) + (1 + 1)) * ((1 + 1) + (1 + 1)))
                  # Emitting ((1 + 1) + (1 + 1))
                    # Emitting (1 + 1)
                      # Emitting 1
                      movl $1, %edx
                      # Emitting 1
                      movl $1, %ecx
                    add %edx, %ecx
                    # Emitting (1 + 1)
                      # Emitting 1
                      movl $1, %edx
                      # Emitting 1
                      movl $1, %esi
                    add %edx, %esi
                  add %ecx, %esi
                  # Emitting ((b + 1) + (1 + 1))
                    # Emitting (1 + 1)
                      # Emitting 1
                      movl $1, %ecx
                      # Emitting 1
                      movl $1, %edx
                    add %ecx, %edx
                    # Emitting (b + 1)
                      # Emitting 1
                      movl $1, %ecx
                      # Emitting b
# ______________________var___________________________________________
                      movl -4(%ebp), %eax
                    add %ecx, %eax
                  add %edx, %eax
                imul %esi, %eax
              add %edi, %eax
              # Emitting 100
              movl $100, %edi
            imul %eax, %edi
          imul %ebx, %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
    addl $8, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
