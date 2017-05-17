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
        # Emitting a = 100
# ________assign______________________________________________________
          # Emitting 100
          movl $100, %edi
        movl %edi, -4(%ebp)
        # Emitting b = -(50)
# ________assign______________________________________________________
          # Emitting -(50)
            # Emitting 50
            movl $50, %edi
          negl %edi
        movl %edi, -8(%ebp)
        # Emitting while ((a > 0)) {...}
# ________whileLoop___________________________________________________
          # Emitting (a > 0)
            # Emitting 0
            movl $0, %edi
            # Emitting a
# ____________var_____________________________________________________
            movl -4(%ebp), %esi
          cmpl %edi, %esi
          setg %al
          movzbl %al, %esi
        jle .L2
          # Emitting (...)
            # Emitting a = (a - 1)
# ____________assign__________________________________________________
              # Emitting (a - 1)
                # Emitting 1
                movl $1, %esi
                # Emitting a
# ________________var_________________________________________________
                movl -4(%ebp), %edi
              sub %esi, %edi
            movl %edi, -4(%ebp)
            # Emitting b = (b + 1)
# ____________assign__________________________________________________
              # Emitting (b + 1)
                # Emitting 1
                movl $1, %edi
                # Emitting b
# ________________var_________________________________________________
                movl -8(%ebp), %esi
              add %edi, %esi
            movl %esi, -8(%ebp)
            # Emitting if ((b != 0)) {...} else {...}
# ____________ifElse__________________________________________________
              # Emitting (b != 0)
                # Emitting 0
                movl $0, %esi
                # Emitting b
# ________________var_________________________________________________
                movl -8(%ebp), %edi
