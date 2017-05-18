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
    # variable A
    pushl $0
    # variable B
    pushl $0
    # variable a
    pushl $0
    # variable b
    pushl $0
    # variable c
    pushl $0
    # variable d
    pushl $0
      # Emitting (...)
        # Emitting A = 1
# ________assign______________________________________________________
          # Emitting 1
          movl $1, %edi
        movl %edi, -4(%ebp)
        # Emitting B = 1
# ________assign______________________________________________________
          # Emitting 1
          movl $1, %edi
        movl %edi, -8(%ebp)
        # Emitting a = (A * -(B))
# ________assign______________________________________________________
          # Emitting (A * -(B))
            # Emitting -(B)
              # Emitting B
# ______________var___________________________________________________
              movl -8(%ebp), %edi
            negl %edi
            # Emitting A
# ____________var_____________________________________________________
            movl -4(%ebp), %esi
          imul %edi, %esi
        movl %esi, -12(%ebp)
        # Emitting b = (-(A) * B)
# ________assign______________________________________________________
          # Emitting (-(A) * B)
            # Emitting B
# ____________var_____________________________________________________
            movl -8(%ebp), %esi
            # Emitting -(A)
              # Emitting A
# ______________var___________________________________________________
              movl -4(%ebp), %edi
            negl %edi
          imul %esi, %edi
        movl %edi, -16(%ebp)
        # Emitting c = -((A + B))
# ________assign______________________________________________________
          # Emitting -((A + B))
            # Emitting (A + B)
              # Emitting B
# ______________var___________________________________________________
              movl -8(%ebp), %edi
              # Emitting A
# ______________var___________________________________________________
              movl -4(%ebp), %esi
            add %edi, %esi
          negl %esi
        movl %esi, -20(%ebp)
        # Emitting d = -((A * B))
# ________assign______________________________________________________
          # Emitting -((A * B))
            # Emitting (A * B)
              # Emitting B
# ______________var___________________________________________________
              movl -8(%ebp), %esi
              # Emitting A
# ______________var___________________________________________________
              movl -4(%ebp), %edi
            imul %esi, %edi
          negl %edi
        movl %edi, -24(%ebp)
        # Emitting write(a)
          # Emitting a
# __________var_______________________________________________________
          movl -12(%ebp), %edi
        sub $16, %esp
        movl %edi, 4(%esp)
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
          movl -16(%ebp), %edi
        sub $16, %esp
        movl %edi, 4(%esp)
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
          movl -20(%ebp), %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        # Emitting write(d)
          # Emitting d
# __________var_______________________________________________________
          movl -24(%ebp), %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
    addl $24, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
