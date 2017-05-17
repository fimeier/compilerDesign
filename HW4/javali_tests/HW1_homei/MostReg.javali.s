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
      # Emitting (...)
        # Emitting a = (((((1000 * a) + b) + (c + d)) * ((a + b) + (c + d))) + (((a + b) + (c + d)) * ((a + b) + (c + d))))
# ________assign______________________________________________________
          # Emitting (((((1000 * a) + b) + (c + d)) * ((a + b) + (c + d))) + (((a + b) + (c + d)) * ((a + b) + (c + d))))
            # Emitting (((a + b) + (c + d)) * ((a + b) + (c + d)))
              # Emitting ((a + b) + (c + d))
                # Emitting (c + d)
                  # Emitting d
# __________________var_______________________________________________
                  movl -16(%ebp), %edi
                  # Emitting c
# __________________var_______________________________________________
                  movl -12(%ebp), %esi
                add %edi, %esi
                # Emitting (a + b)
                  # Emitting b
# __________________var_______________________________________________
                  movl -8(%ebp), %edi
                  # Emitting a
# __________________var_______________________________________________
                  movl -4(%ebp), %edx
                add %edi, %edx
              add %esi, %edx
              # Emitting ((a + b) + (c + d))
                # Emitting (c + d)
                  # Emitting d
# __________________var_______________________________________________
                  movl -16(%ebp), %esi
                  # Emitting c
# __________________var_______________________________________________
                  movl -12(%ebp), %edi
                add %esi, %edi
                # Emitting (a + b)
                  # Emitting b
# __________________var_______________________________________________
                  movl -8(%ebp), %esi
                  # Emitting a
# __________________var_______________________________________________
                  movl -4(%ebp), %ecx
                add %esi, %ecx
              add %edi, %ecx
            imul %edx, %ecx
            # Emitting ((((1000 * a) + b) + (c + d)) * ((a + b) + (c + d)))
              # Emitting ((a + b) + (c + d))
                # Emitting (c + d)
                  # Emitting d
# __________________var_______________________________________________
                  movl -16(%ebp), %edx
                  # Emitting c
# __________________var_______________________________________________
                  movl -12(%ebp), %edi
                add %edx, %edi
                # Emitting (a + b)
                  # Emitting b
# __________________var_______________________________________________
                  movl -8(%ebp), %edx
                  # Emitting a
# __________________var_______________________________________________
                  movl -4(%ebp), %esi
                add %edx, %esi
              add %edi, %esi
              # Emitting (((1000 * a) + b) + (c + d))
                # Emitting (c + d)
                  # Emitting d
# __________________var_______________________________________________
                  movl -16(%ebp), %edi
                  # Emitting c
# __________________var_______________________________________________
                  movl -12(%ebp), %edx
                add %edi, %edx
                # Emitting ((1000 * a) + b)
                  # Emitting (1000 * a)
                    # Emitting a
# ____________________var_____________________________________________
                    movl -4(%ebp), %edi
                    # Emitting 1000
                    movl $1000, %ebx
                  imul %edi, %ebx
                  # Emitting b
# __________________var_______________________________________________
                  movl -8(%ebp), %edi
                add %edi, %ebx
              add %edx, %ebx
            imul %esi, %ebx
          add %ecx, %ebx
        movl %ebx, -4(%ebp)
        # Emitting b = ((((a + b) + (c + d)) * ((a + b) + (c + d))) + (((a + b) + (c + d)) * ((a + b) + (c + d))))
# ________assign______________________________________________________
          # Emitting ((((a + b) + (c + d)) * ((a + b) + (c + d))) + (((a + b) + (c + d)) * ((a + b) + (c + d))))
            # Emitting (((a + b) + (c + d)) * ((a + b) + (c + d)))
              # Emitting ((a + b) + (c + d))
                # Emitting (c + d)
                  # Emitting d
# __________________var_______________________________________________
                  movl -16(%ebp), %ebx
                  # Emitting c
# __________________var_______________________________________________
                  movl -12(%ebp), %ecx
                add %ebx, %ecx
                # Emitting (a + b)
                  # Emitting b
# __________________var_______________________________________________
                  movl -8(%ebp), %ebx
                  # Emitting a
# __________________var_______________________________________________
                  movl -4(%ebp), %esi
                add %ebx, %esi
              add %ecx, %esi
              # Emitting ((a + b) + (c + d))
                # Emitting (c + d)
                  # Emitting d
# __________________var_______________________________________________
                  movl -16(%ebp), %ecx
                  # Emitting c
# __________________var_______________________________________________
                  movl -12(%ebp), %ebx
                add %ecx, %ebx
                # Emitting (a + b)
                  # Emitting b
# __________________var_______________________________________________
                  movl -8(%ebp), %ecx
                  # Emitting a
# __________________var_______________________________________________
                  movl -4(%ebp), %edx
                add %ecx, %edx
              add %ebx, %edx
            imul %esi, %edx
            # Emitting (((a + b) + (c + d)) * ((a + b) + (c + d)))
              # Emitting ((a + b) + (c + d))
                # Emitting (c + d)
                  # Emitting d
# __________________var_______________________________________________
                  movl -16(%ebp), %esi
                  # Emitting c
# __________________var_______________________________________________
                  movl -12(%ebp), %ebx
                add %esi, %ebx
                # Emitting (a + b)
                  # Emitting b
# __________________var_______________________________________________
                  movl -8(%ebp), %esi
                  # Emitting a
# __________________var_______________________________________________
                  movl -4(%ebp), %ecx
                add %esi, %ecx
              add %ebx, %ecx
              # Emitting ((a + b) + (c + d))
                # Emitting (c + d)
                  # Emitting d
# __________________var_______________________________________________
                  movl -16(%ebp), %ebx
                  # Emitting c
# __________________var_______________________________________________
                  movl -12(%ebp), %esi
                add %ebx, %esi
                # Emitting (a + b)
                  # Emitting b
# __________________var_______________________________________________
                  movl -8(%ebp), %ebx
                  # Emitting a
# __________________var_______________________________________________
                  movl -4(%ebp), %edi
                add %ebx, %edi
              add %esi, %edi
            imul %ecx, %edi
          add %edx, %edi
        movl %edi, -8(%ebp)
        # Emitting c = ((((a + b) + (c + d)) * ((a + b) + (c + d))) + (((a + b) + (c + d)) * ((a + b) + (c + d))))
# ________assign______________________________________________________
          # Emitting ((((a + b) + (c + d)) * ((a + b) + (c + d))) + (((a + b) + (c + d)) * ((a + b) + (c + d))))
            # Emitting (((a + b) + (c + d)) * ((a + b) + (c + d)))
              # Emitting ((a + b) + (c + d))
                # Emitting (c + d)
                  # Emitting d
# __________________var_______________________________________________
                  movl -16(%ebp), %edi
                  # Emitting c
# __________________var_______________________________________________
                  movl -12(%ebp), %edx
                add %edi, %edx
                # Emitting (a + b)
                  # Emitting b
# __________________var_______________________________________________
                  movl -8(%ebp), %edi
                  # Emitting a
# __________________var_______________________________________________
                  movl -4(%ebp), %ecx
                add %edi, %ecx
              add %edx, %ecx
              # Emitting ((a + b) + (c + d))
                # Emitting (c + d)
                  # Emitting d
# __________________var_______________________________________________
                  movl -16(%ebp), %edx
                  # Emitting c
# __________________var_______________________________________________
                  movl -12(%ebp), %edi
                add %edx, %edi
                # Emitting (a + b)
                  # Emitting b
# __________________var_______________________________________________
                  movl -8(%ebp), %edx
                  # Emitting a
# __________________var_______________________________________________
                  movl -4(%ebp), %esi
                add %edx, %esi
              add %edi, %esi
            imul %ecx, %esi
            # Emitting (((a + b) + (c + d)) * ((a + b) + (c + d)))
              # Emitting ((a + b) + (c + d))
                # Emitting (c + d)
                  # Emitting d
# __________________var_______________________________________________
                  movl -16(%ebp), %ecx
                  # Emitting c
# __________________var_______________________________________________
                  movl -12(%ebp), %edi
                add %ecx, %edi
                # Emitting (a + b)
                  # Emitting b
# __________________var_______________________________________________
                  movl -8(%ebp), %ecx
                  # Emitting a
# __________________var_______________________________________________
                  movl -4(%ebp), %edx
                add %ecx, %edx
              add %edi, %edx
              # Emitting ((a + b) + (c + d))
                # Emitting (c + d)
                  # Emitting d
# __________________var_______________________________________________
                  movl -16(%ebp), %edi
                  # Emitting c
# __________________var_______________________________________________
                  movl -12(%ebp), %ecx
                add %edi, %ecx
                # Emitting (a + b)
                  # Emitting b
# __________________var_______________________________________________
                  movl -8(%ebp), %edi
                  # Emitting a
# __________________var_______________________________________________
                  movl -4(%ebp), %ebx
                add %edi, %ebx
              add %ecx, %ebx
            imul %edx, %ebx
          add %esi, %ebx
        movl %ebx, -12(%ebp)
        # Emitting d = ((((a + b) + (c + d)) * ((a + b) + (c + d))) + (((a + b) + (c + d)) * ((a + b) + (c + d))))
# ________assign______________________________________________________
          # Emitting ((((a + b) + (c + d)) * ((a + b) + (c + d))) + (((a + b) + (c + d)) * ((a + b) + (c + d))))
            # Emitting (((a + b) + (c + d)) * ((a + b) + (c + d)))
              # Emitting ((a + b) + (c + d))
                # Emitting (c + d)
                  # Emitting d
# __________________var_______________________________________________
                  movl -16(%ebp), %ebx
                  # Emitting c
# __________________var_______________________________________________
                  movl -12(%ebp), %esi
                add %ebx, %esi
                # Emitting (a + b)
                  # Emitting b
# __________________var_______________________________________________
                  movl -8(%ebp), %ebx
                  # Emitting a
# __________________var_______________________________________________
                  movl -4(%ebp), %edx
                add %ebx, %edx
              add %esi, %edx
              # Emitting ((a + b) + (c + d))
                # Emitting (c + d)
                  # Emitting d
# __________________var_______________________________________________
                  movl -16(%ebp), %esi
                  # Emitting c
# __________________var_______________________________________________
                  movl -12(%ebp), %ebx
                add %esi, %ebx
                # Emitting (a + b)
                  # Emitting b
# __________________var_______________________________________________
                  movl -8(%ebp), %esi
                  # Emitting a
# __________________var_______________________________________________
                  movl -4(%ebp), %ecx
                add %esi, %ecx
              add %ebx, %ecx
            imul %edx, %ecx
            # Emitting (((a + b) + (c + d)) * ((a + b) + (c + d)))
              # Emitting ((a + b) + (c + d))
                # Emitting (c + d)
                  # Emitting d
# __________________var_______________________________________________
                  movl -16(%ebp), %edx
                  # Emitting c
# __________________var_______________________________________________
                  movl -12(%ebp), %ebx
                add %edx, %ebx
                # Emitting (a + b)
                  # Emitting b
# __________________var_______________________________________________
                  movl -8(%ebp), %edx
                  # Emitting a
# __________________var_______________________________________________
                  movl -4(%ebp), %esi
                add %edx, %esi
              add %ebx, %esi
              # Emitting ((a + b) + (c + d))
                # Emitting (c + d)
                  # Emitting d
# __________________var_______________________________________________
                  movl -16(%ebp), %ebx
                  # Emitting c
# __________________var_______________________________________________
                  movl -12(%ebp), %edx
                add %ebx, %edx
                # Emitting (a + b)
                  # Emitting b
# __________________var_______________________________________________
                  movl -8(%ebp), %ebx
                  # Emitting a
# __________________var_______________________________________________
                  movl -4(%ebp), %edi
                add %ebx, %edi
              add %edx, %edi
            imul %esi, %edi
          add %ecx, %edi
        movl %edi, -16(%ebp)
        # Emitting write(((a * b) + (c * d)))
          # Emitting ((a * b) + (c * d))
            # Emitting (c * d)
              # Emitting d
# ______________var___________________________________________________
              movl -16(%ebp), %edi
              # Emitting c
# ______________var___________________________________________________
              movl -12(%ebp), %ecx
            imul %edi, %ecx
            # Emitting (a * b)
              # Emitting b
# ______________var___________________________________________________
              movl -8(%ebp), %edi
              # Emitting a
# ______________var___________________________________________________
              movl -4(%ebp), %esi
            imul %edi, %esi
          add %ecx, %esi
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
        # Emitting write((c * 0))
          # Emitting (c * 0)
            # Emitting 0
            movl $0, %esi
            # Emitting c
# ____________var_____________________________________________________
            movl -12(%ebp), %ecx
          imul %esi, %ecx
        sub $16, %esp
        movl %ecx, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
    addl $16, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
