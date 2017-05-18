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
    # variable r1
    pushl $0
    # variable i0
    pushl $0
    # variable i1
    pushl $0
      # Emitting (...)
        # Emitting i0 = 5
# ________assign______________________________________________________
          # Emitting 5
          movl $5, %edi
        movl %edi, -8(%ebp)
        # Emitting i1 = 2
# ________assign______________________________________________________
          # Emitting 2
          movl $2, %edi
        movl %edi, -12(%ebp)
        # Emitting r1 = (i1 * 3)
# ________assign______________________________________________________
          # Emitting (i1 * 3)
            # Emitting 3
            movl $3, %edi
            # Emitting i1
# ____________var_____________________________________________________
            movl -12(%ebp), %esi
          imul %edi, %esi
        movl %esi, -4(%ebp)
        # Emitting write(r1)
          # Emitting r1
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
        # Emitting r1 = (i0 * i1)
# ________assign______________________________________________________
          # Emitting (i0 * i1)
            # Emitting i1
# ____________var_____________________________________________________
            movl -12(%ebp), %esi
            # Emitting i0
# ____________var_____________________________________________________
            movl -8(%ebp), %edi
          imul %esi, %edi
        movl %edi, -4(%ebp)
        # Emitting write(r1)
          # Emitting r1
# __________var_______________________________________________________
          movl -4(%ebp), %edi
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
        # Emitting r1 = (((r1 * i0) * i1) * 3)
# ________assign______________________________________________________
          # Emitting (((r1 * i0) * i1) * 3)
            # Emitting ((r1 * i0) * i1)
              # Emitting (r1 * i0)
                # Emitting i0
# ________________var_________________________________________________
                movl -8(%ebp), %edi
                # Emitting r1
# ________________var_________________________________________________
                movl -4(%ebp), %esi
              imul %edi, %esi
              # Emitting i1
# ______________var___________________________________________________
              movl -12(%ebp), %edi
            imul %edi, %esi
            # Emitting 3
            movl $3, %edi
          imul %edi, %esi
        movl %esi, -4(%ebp)
        # Emitting write(r1)
          # Emitting r1
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
    addl $12, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
