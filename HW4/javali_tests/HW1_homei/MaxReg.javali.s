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
                    pushl $0
                    pushl %edi
                    movl $1, %edi
# ____________________swap needed_____________________________________
                    movl %edi, 4(%esp)
                    popl %edi
                    popl %esi
                  add %edi, %esi
                  # Emitting (1 + 1)
                  pushl $0
                  pushl %esi
                    # Emitting 1
                    movl $1, %esi
                    # Emitting 1
                    pushl $0
                    pushl %esi
                    movl $1, %esi
# ____________________swap needed_____________________________________
                    movl %esi, 4(%esp)
                    popl %esi
                    popl %edi
                  add %esi, %edi
                  popl %esi
                  addl $4, %esp
                add %esi, %edi
                # Emitting ((1 + 1) + (1 + 1))
                pushl $0
                pushl %edi
                  # Emitting (1 + 1)
                    # Emitting 1
                    movl $1, %edi
                    # Emitting 1
                    pushl $0
                    pushl %edi
                    movl $1, %edi
# ____________________swap needed_____________________________________
                    movl %edi, 4(%esp)
                    popl %edi
                    popl %esi
                  add %edi, %esi
                  # Emitting (1 + 1)
                  pushl $0
                  pushl %esi
                    # Emitting 1
                    movl $1, %esi
                    # Emitting 1
                    pushl $0
                    pushl %esi
                    movl $1, %esi
# ____________________swap needed_____________________________________
                    movl %esi, 4(%esp)
                    popl %esi
                    popl %edi
                  add %esi, %edi
                  popl %esi
                  addl $4, %esp
                add %esi, %edi
# ________________swap needed_________________________________________
                movl %edi, 4(%esp)
                popl %edi
                popl %esi
              imul %edi, %esi
              # Emitting (((1 + 1) + (1 + 1)) * ((1 + 1) + (1 + a)))
              pushl $0
              pushl %esi
                # Emitting ((1 + 1) + (1 + a))
                  # Emitting (1 + a)
                    # Emitting a
# ____________________var_____________________________________________
                    movl -8(%ebp), %esi
                    # Emitting 1
                    pushl $0
                    pushl %esi
                    movl $1, %esi
# ____________________swap needed_____________________________________
                    movl %esi, 4(%esp)
                    popl %esi
                    popl %edi
                  add %esi, %edi
                  # Emitting (1 + 1)
                  pushl $0
                  pushl %edi
                    # Emitting 1
                    movl $1, %edi
                    # Emitting 1
                    pushl $0
                    pushl %edi
                    movl $1, %edi
# ____________________swap needed_____________________________________
                    movl %edi, 4(%esp)
                    popl %edi
                    popl %esi
                  add %edi, %esi
                  popl %edi
                  addl $4, %esp
                add %edi, %esi
                # Emitting ((1 + 1) + (1 + 1))
                pushl $0
                pushl %esi
                  # Emitting (1 + 1)
                    # Emitting 1
                    movl $1, %esi
                    # Emitting 1
                    pushl $0
                    pushl %esi
                    movl $1, %esi
# ____________________swap needed_____________________________________
                    movl %esi, 4(%esp)
                    popl %esi
                    popl %edi
                  add %esi, %edi
                  # Emitting (1 + 1)
                  pushl $0
                  pushl %edi
                    # Emitting 1
                    movl $1, %edi
                    # Emitting 1
                    pushl $0
                    pushl %edi
                    movl $1, %edi
# ____________________swap needed_____________________________________
                    movl %edi, 4(%esp)
                    popl %edi
                    popl %esi
                  add %edi, %esi
                  popl %edi
                  addl $4, %esp
                add %edi, %esi
# ________________swap needed_________________________________________
                movl %esi, 4(%esp)
                popl %esi
                popl %edi
              imul %esi, %edi
              popl %esi
              addl $4, %esp
            add %esi, %edi
            # Emitting (100 * ((((b + 1) + (1 + 1)) * ((1 + 1) + (1 + 1))) + (((1 + 1) + (1 + 1)) * ((1 + 1) + (1 + 1)))))
            pushl $0
            pushl %edi
              # Emitting ((((b + 1) + (1 + 1)) * ((1 + 1) + (1 + 1))) + (((1 + 1) + (1 + 1)) * ((1 + 1) + (1 + 1))))
                # Emitting (((1 + 1) + (1 + 1)) * ((1 + 1) + (1 + 1)))
                  # Emitting ((1 + 1) + (1 + 1))
                    # Emitting (1 + 1)
                      # Emitting 1
                      movl $1, %edi
                      # Emitting 1
                      pushl $0
                      pushl %edi
                      movl $1, %edi
# ______________________swap needed___________________________________
                      movl %edi, 4(%esp)
                      popl %edi
                      popl %esi
                    add %edi, %esi
                    # Emitting (1 + 1)
                    pushl $0
                    pushl %esi
                      # Emitting 1
                      movl $1, %esi
                      # Emitting 1
                      pushl $0
                      pushl %esi
                      movl $1, %esi
# ______________________swap needed___________________________________
                      movl %esi, 4(%esp)
                      popl %esi
                      popl %edi
                    add %esi, %edi
                    popl %esi
                    addl $4, %esp
                  add %esi, %edi
                  # Emitting ((1 + 1) + (1 + 1))
                  pushl $0
                  pushl %edi
                    # Emitting (1 + 1)
                      # Emitting 1
                      movl $1, %edi
                      # Emitting 1
                      pushl $0
                      pushl %edi
                      movl $1, %edi
# ______________________swap needed___________________________________
                      movl %edi, 4(%esp)
                      popl %edi
                      popl %esi
                    add %edi, %esi
                    # Emitting (1 + 1)
                    pushl $0
                    pushl %esi
                      # Emitting 1
                      movl $1, %esi
                      # Emitting 1
                      pushl $0
                      pushl %esi
                      movl $1, %esi
# ______________________swap needed___________________________________
                      movl %esi, 4(%esp)
                      popl %esi
                      popl %edi
                    add %esi, %edi
                    popl %esi
                    addl $4, %esp
                  add %esi, %edi
# __________________swap needed_______________________________________
                  movl %edi, 4(%esp)
                  popl %edi
                  popl %esi
                imul %edi, %esi
                # Emitting (((b + 1) + (1 + 1)) * ((1 + 1) + (1 + 1)))
                pushl $0
                pushl %esi
                  # Emitting ((1 + 1) + (1 + 1))
                    # Emitting (1 + 1)
                      # Emitting 1
                      movl $1, %esi
                      # Emitting 1
                      pushl $0
                      pushl %esi
                      movl $1, %esi
# ______________________swap needed___________________________________
                      movl %esi, 4(%esp)
                      popl %esi
                      popl %edi
                    add %esi, %edi
                    # Emitting (1 + 1)
                    pushl $0
                    pushl %edi
                      # Emitting 1
                      movl $1, %edi
                      # Emitting 1
                      pushl $0
                      pushl %edi
                      movl $1, %edi
# ______________________swap needed___________________________________
                      movl %edi, 4(%esp)
                      popl %edi
                      popl %esi
                    add %edi, %esi
                    popl %edi
                    addl $4, %esp
                  add %edi, %esi
                  # Emitting ((b + 1) + (1 + 1))
                  pushl $0
                  pushl %esi
                    # Emitting (1 + 1)
                      # Emitting 1
                      movl $1, %esi
                      # Emitting 1
                      pushl $0
                      pushl %esi
                      movl $1, %esi
# ______________________swap needed___________________________________
                      movl %esi, 4(%esp)
                      popl %esi
                      popl %edi
                    add %esi, %edi
                    # Emitting (b + 1)
                    pushl $0
                    pushl %edi
                      # Emitting 1
                      movl $1, %edi
                      # Emitting b
                      pushl $0
                      pushl %edi
# ______________________var___________________________________________
                      movl -4(%ebp), %edi
# ______________________swap needed___________________________________
                      movl %edi, 4(%esp)
                      popl %edi
                      popl %esi
                    add %edi, %esi
                    popl %edi
                    addl $4, %esp
                  add %edi, %esi
# __________________swap needed_______________________________________
                  movl %esi, 4(%esp)
                  popl %esi
                  popl %edi
                imul %esi, %edi
                popl %esi
                addl $4, %esp
              add %esi, %edi
              # Emitting 100
              pushl $0
              pushl %edi
              movl $100, %edi
# ______________swap needed___________________________________________
              movl %edi, 4(%esp)
              popl %edi
              popl %esi
            imul %edi, %esi
            popl %edi
            addl $4, %esp
          imul %edi, %esi
        sub $16, %esp
        movl %esi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
    addl $8, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
