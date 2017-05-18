.section .data
	vtable_A:
		.int vtable_Object
	vtable_Main_array:
		.int vtable_Object
	vtable_A_array:
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
  # Emitting class A {...}
  pushl $0
  addl $4, %esp
  # Emitting class Main {...}
  pushl $0
    # Emitting void main(...) {...}
    pushl $0
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    # variable aa
    pushl $0
    # variable bb
    pushl $0
    # variable a
    pushl $0
    # variable b
    pushl $0
    # variable c
    pushl $0
      # Emitting (...)
      pushl $0
        # Emitting a = 3
        pushl $0
# ________assign______________________________________________________
          # Emitting 3
          pushl $0
          movl $3, %edi
          popl %esi
        movl %esi, -12(%ebp)
        addl $4, %esp
        # Emitting b = 1
        pushl $0
        pushl %edi
# ________assign______________________________________________________
          # Emitting 1
          pushl $0
          movl $1, %edi
          popl %esi
        movl %esi, -16(%ebp)
        popl %edi
        addl $4, %esp
        # Emitting c = (a == b)
        pushl $0
        pushl %edi
# ________assign______________________________________________________
          # Emitting (a == b)
          pushl $0
            # Emitting b
            pushl $0
# ____________var_____________________________________________________
            movl -16(%ebp), %edi
            popl %esi
            # Emitting a
            pushl $0
            pushl %esi
            pushl %edi
# ____________var_____________________________________________________
            movl -12(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 8(%esp)
            popl %esi
            popl %edi
            popl %edx
          cmpl %esi, %edx
          je .L2
          movl $0, %edx
          jmp .L3
.L2:
          movl $1, %edx
.L3:
          popl %esi
        movl %esi, -20(%ebp)
        popl %edi
        addl $4, %esp
        # Emitting aa = new A()
        pushl $0
        pushl %edx
        pushl %edi
# ________assign______________________________________________________
          # Emitting new A()
          pushl $0
# __________newObject_________________________________________________
          pushl $4
          pushl $1
          call calloc
          addl $8, %esp
          movl $vtable_A, (%eax)
          movl %eax, %edi
          popl %edx
        movl %edx, -4(%ebp)
        popl %edx
        popl %edi
        addl $4, %esp
        # Emitting bb = aa
        pushl $0
        pushl %edx
        pushl %edi
# ________assign______________________________________________________
          # Emitting aa
          pushl $0
# __________var_______________________________________________________
          movl -4(%ebp), %edi
          popl %edx
        movl %edx, -8(%ebp)
        popl %edx
        popl %edi
        addl $4, %esp
        # Emitting c = (a != b)
        pushl $0
        pushl %edx
        pushl %edi
# ________assign______________________________________________________
          # Emitting (a != b)
          pushl $0
            # Emitting b
            pushl $0
# ____________var_____________________________________________________
            movl -16(%ebp), %edi
            popl %edx
            # Emitting a
            pushl $0
            pushl %edx
            pushl %edi
# ____________var_____________________________________________________
            movl -12(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 8(%esp)
            popl %edx
            popl %edi
            popl %esi
          cmpl %edx, %esi
          jne .L4
          movl $0, %esi
          jmp .L5
.L4:
          movl $1, %esi
.L5:
          popl %edx
        movl %edx, -20(%ebp)
        popl %edx
        popl %edi
        addl $4, %esp
        # Emitting if ((aa != bb)) {...} else {...}
        pushl $0
        pushl %edx
        pushl %esi
        pushl %edi
# ________ifElse______________________________________________________
          # Emitting (aa != bb)
          pushl $0
            # Emitting bb
            pushl $0
# ____________var_____________________________________________________
            movl -8(%ebp), %edi
            popl %esi
            # Emitting aa
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
          jne .L7
          movl $0, %edx
          jmp .L8
.L7:
          movl $1, %edx
.L8:
          popl %esi
        je .L9
          # Emitting (...)
          pushl $0
          pushl %edx
          pushl %edi
            # Emitting write(1)
            pushl $0
              # Emitting 1
              pushl $0
              movl $1, %edi
              popl %edx
            sub $16, %esp
            movl %edx, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
            addl $4, %esp
            # Emitting writeln()
            pushl $0
            pushl %edi
            sub $16, %esp
            movl $STR_NL, 0(%esp)
            call printf
            add $16, %esp
            popl %edi
            addl $4, %esp
          popl %edx
          popl %edi
          addl $4, %esp
        jmp .L10
.L9:
          # Emitting (...)
          pushl $0
          pushl %edx
          pushl %edi
            # Emitting write(0)
            pushl $0
              # Emitting 0
              pushl $0
              movl $0, %edi
              popl %edx
            sub $16, %esp
            movl %edx, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
            addl $4, %esp
            # Emitting writeln()
            pushl $0
            pushl %edi
            sub $16, %esp
            movl $STR_NL, 0(%esp)
            call printf
            add $16, %esp
            popl %edi
            addl $4, %esp
          popl %edx
          popl %edi
          addl $4, %esp
.L10:
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
      addl $4, %esp
    addl $20, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    addl $4, %esp
  addl $4, %esp
