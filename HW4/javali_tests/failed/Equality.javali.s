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
  # Emitting class Main {...}
    # Emitting void main(...) {...}
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
        # Emitting a = 3
# ________assign______________________________________________________
          # Emitting 3
          movl $3, %edi
        movl %edi, -12(%ebp)
        # Emitting b = 1
# ________assign______________________________________________________
          # Emitting 1
          movl $1, %edi
        movl %edi, -16(%ebp)
        # Emitting c = (a == b)
# ________assign______________________________________________________
          # Emitting (a == b)
            # Emitting b
# ____________var_____________________________________________________
            movl -16(%ebp), %edi
            # Emitting a
            pushl %edi
# ____________var_____________________________________________________
            movl -12(%ebp), %esi
            popl %edi
          cmpl %edi, %esi
          je .L2
          movl $0, %esi
          jmp .L3
.L2:
          movl $1, %esi
.L3:
        movl %esi, -20(%ebp)
        # Emitting aa = new A()
# ________assign______________________________________________________
          # Emitting new A()
# __________newObject_________________________________________________
          pushl $4
          pushl $1
          call calloc
          addl $8, %esp
          movl $vtable_A, (%eax)
          movl %eax, %esi
        movl %esi, -4(%ebp)
        # Emitting bb = aa
# ________assign______________________________________________________
          # Emitting aa
# __________var_______________________________________________________
          movl -4(%ebp), %esi
        movl %esi, -8(%ebp)
        # Emitting c = (a != b)
# ________assign______________________________________________________
          # Emitting (a != b)
            # Emitting b
# ____________var_____________________________________________________
            movl -16(%ebp), %esi
            # Emitting a
            pushl %esi
# ____________var_____________________________________________________
            movl -12(%ebp), %edi
            popl %esi
          cmpl %esi, %edi
          jne .L4
          movl $0, %edi
          jmp .L5
.L4:
          movl $1, %edi
.L5:
        movl %edi, -20(%ebp)
        # Emitting if ((aa != bb)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting (aa != bb)
            # Emitting bb
# ____________var_____________________________________________________
            movl -8(%ebp), %edi
            # Emitting aa
            pushl %edi
# ____________var_____________________________________________________
            movl -4(%ebp), %esi
            popl %edi
          cmpl %edi, %esi
          jne .L7
          movl $0, %esi
          jmp .L8
.L7:
          movl $1, %esi
.L8:
        je .L9
          # Emitting (...)
            # Emitting write(1)
              # Emitting 1
              movl $1, %esi
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
        jmp .L10
.L9:
          # Emitting (...)
            # Emitting write(0)
              # Emitting 0
              movl $0, %esi
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
.L10:
    addl $20, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
