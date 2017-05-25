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
.L2:
          # Emitting (a > 0)
            # Emitting 0
            movl $0, %edi
            # Emitting a
            pushl $0
            pushl %edi
# ____________var_____________________________________________________
            movl -4(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          cmpl %edi, %esi
          setg %al
          movzbl %al, %esi
        jle .L3
          # Emitting (...)
            # Emitting a = (a - 1)
# ____________assign__________________________________________________
              # Emitting (a - 1)
                # Emitting 1
                movl $1, %esi
                # Emitting a
                pushl $0
                pushl %esi
# ________________var_________________________________________________
                movl -4(%ebp), %esi
# ________________swap needed_________________________________________
                movl %esi, 4(%esp)
                popl %esi
                popl %edi
              sub %esi, %edi
            movl %edi, -4(%ebp)
            # Emitting b = (b + 1)
# ____________assign__________________________________________________
              # Emitting (b + 1)
                # Emitting 1
                movl $1, %edi
                # Emitting b
                pushl $0
                pushl %edi
# ________________var_________________________________________________
                movl -8(%ebp), %edi
# ________________swap needed_________________________________________
                movl %edi, 4(%esp)
                popl %edi
                popl %esi
              add %edi, %esi
            movl %esi, -8(%ebp)
            # Emitting if ((b != 0)) {...} else {...}
# ____________ifElse__________________________________________________
              # Emitting (b != 0)
                # Emitting 0
                movl $0, %esi
                # Emitting b
                pushl $0
                pushl %esi
# ________________var_________________________________________________
                movl -8(%ebp), %esi
# ________________swap needed_________________________________________
                movl %esi, 4(%esp)
                popl %esi
                popl %edi
              cmpl %esi, %edi
              jne .L6
              movl $0, %edi
              jmp .L7
.L6:
              movl $1, %edi
.L7:
            je .L8
              # Emitting (...)
                # Emitting c = 5
# ________________assign______________________________________________
                  # Emitting 5
                  movl $5, %edi
                movl %edi, -12(%ebp)
                # Emitting d = 10
# ________________assign______________________________________________
                  # Emitting 10
                  movl $10, %edi
                movl %edi, -16(%ebp)
            jmp .L9
.L8:
              # Emitting (...)
                # Emitting c = (25 + c)
# ________________assign______________________________________________
                  # Emitting (25 + c)
                    # Emitting c
# ____________________var_____________________________________________
                    movl -12(%ebp), %edi
                    # Emitting 25
                    pushl $0
                    pushl %edi
                    movl $25, %edi
# ____________________swap needed_____________________________________
                    movl %edi, 4(%esp)
                    popl %edi
                    popl %esi
                  add %edi, %esi
                movl %esi, -12(%ebp)
                # Emitting e = 37
# ________________assign______________________________________________
                  # Emitting 37
                  movl $37, %esi
                movl %esi, -20(%ebp)
.L9:
            # Emitting if ((a <= 0)) {...} else {...}
# ____________ifElse__________________________________________________
              # Emitting (a <= 0)
                # Emitting 0
                movl $0, %esi
                # Emitting a
                pushl $0
                pushl %esi
# ________________var_________________________________________________
                movl -4(%ebp), %esi
# ________________swap needed_________________________________________
                movl %esi, 4(%esp)
                popl %esi
                popl %edi
              cmpl %esi, %edi
              setle %al
              movzbl %al, %edi
            jg .L11
              # Emitting (...)
                # Emitting return
                # restore old ebp
                movl %ebp, %esp
                popl %ebp
                ret
            jmp .L12
.L11:
              # Emitting nop
.L12:
        jmp .L2
.L3:
.L4:
    addl $20, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
