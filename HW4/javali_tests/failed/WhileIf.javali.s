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
  pushl $0
    # Emitting void main(...) {...}
    pushl $0
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
      pushl $0
        # Emitting a = 100
        pushl $0
# ________assign______________________________________________________
          # Emitting 100
          pushl $0
          movl $100, %edi
          popl %esi
        movl %esi, -4(%ebp)
        addl $4, %esp
        # Emitting b = -(50)
        pushl $0
        pushl %edi
# ________assign______________________________________________________
          # Emitting -(50)
          pushl $0
            # Emitting 50
            pushl $0
            movl $50, %edi
            popl %esi
          negl %esi
          popl %edx
        movl %edx, -8(%ebp)
        popl %edi
        addl $4, %esp
        # Emitting while ((a > 0)) {...}
        pushl $0
        pushl %esi
        pushl %edi
# ________whileLoop___________________________________________________
.L2:
          # Emitting (a > 0)
          pushl $0
            # Emitting 0
            pushl $0
            movl $0, %edi
            popl %esi
            # Emitting a
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
          setg %al
          movzbl %al, %edx
          popl %esi
        jle .L3
          # Emitting (...)
          pushl $0
          pushl %edx
          pushl %edi
            # Emitting a = (a - 1)
            pushl $0
# ____________assign__________________________________________________
              # Emitting (a - 1)
              pushl $0
                # Emitting 1
                pushl $0
                movl $1, %edi
                popl %edx
                # Emitting a
                pushl $0
                pushl %edx
                pushl %edi
# ________________var_________________________________________________
                movl -4(%ebp), %edi
# ________________swap needed_________________________________________
                movl %edi, 8(%esp)
                popl %edx
                popl %edi
                popl %esi
              sub %edx, %esi
              popl %edx
            movl %edx, -4(%ebp)
            addl $4, %esp
            # Emitting b = (b + 1)
            pushl $0
            pushl %esi
            pushl %edi
# ____________assign__________________________________________________
              # Emitting (b + 1)
              pushl $0
                # Emitting 1
                pushl $0
                movl $1, %edi
                popl %esi
                # Emitting b
                pushl $0
                pushl %esi
                pushl %edi
# ________________var_________________________________________________
                movl -8(%ebp), %edi
# ________________swap needed_________________________________________
                movl %edi, 8(%esp)
                popl %esi
                popl %edi
                popl %edx
              add %esi, %edx
              popl %esi
            movl %esi, -8(%ebp)
            popl %esi
            popl %edi
            addl $4, %esp
            # Emitting if ((b != 0)) {...} else {...}
            pushl $0
            pushl %edx
            pushl %esi
            pushl %edi
# ____________ifElse__________________________________________________
              # Emitting (b != 0)
              pushl $0
                # Emitting 0
                pushl $0
                movl $0, %edi
                popl %esi
                # Emitting b
                pushl $0
                pushl %esi
                pushl %edi
# ________________var_________________________________________________
                movl -8(%ebp), %edi
# ________________swap needed_________________________________________
                movl %edi, 8(%esp)
                popl %esi
                popl %edi
                popl %edx
              cmpl %esi, %edx
              jne .L6
              movl $0, %edx
              jmp .L7
.L6:
              movl $1, %edx
.L7:
              popl %esi
            je .L8
              # Emitting (...)
              pushl $0
              pushl %edx
              pushl %edi
                # Emitting c = 5
                pushl $0
# ________________assign______________________________________________
                  # Emitting 5
                  pushl $0
                  movl $5, %edi
                  popl %edx
                movl %edx, -12(%ebp)
                addl $4, %esp
                # Emitting d = 10
                pushl $0
                pushl %edi
# ________________assign______________________________________________
                  # Emitting 10
                  pushl $0
                  movl $10, %edi
                  popl %edx
                movl %edx, -16(%ebp)
                popl %edi
                addl $4, %esp
              popl %edx
              popl %edi
              addl $4, %esp
            jmp .L9
.L8:
              # Emitting (...)
              pushl $0
              pushl %edx
              pushl %edi
                # Emitting c = (25 + c)
                pushl $0
# ________________assign______________________________________________
                  # Emitting (25 + c)
                  pushl $0
                    # Emitting c
                    pushl $0
# ____________________var_____________________________________________
                    movl -12(%ebp), %edi
                    popl %edx
                    # Emitting 25
                    pushl $0
                    pushl %edx
                    pushl %edi
                    movl $25, %edi
# ____________________swap needed_____________________________________
                    movl %edi, 8(%esp)
                    popl %edx
                    popl %edi
                    popl %esi
                  add %edx, %esi
                  popl %edx
                movl %edx, -12(%ebp)
                addl $4, %esp
                # Emitting e = 37
                pushl $0
                pushl %esi
                pushl %edi
# ________________assign______________________________________________
                  # Emitting 37
                  pushl $0
                  movl $37, %edi
                  popl %esi
                movl %esi, -20(%ebp)
                popl %esi
                popl %edi
                addl $4, %esp
              popl %edx
              popl %edi
              addl $4, %esp
.L9:
            popl %edx
            popl %esi
            popl %edi
            addl $4, %esp
            # Emitting if ((a <= 0)) {...} else {...}
            pushl $0
            pushl %edx
            pushl %esi
            pushl %edi
# ____________ifElse__________________________________________________
              # Emitting (a <= 0)
              pushl $0
                # Emitting 0
                pushl $0
                movl $0, %edi
                popl %esi
                # Emitting a
                pushl $0
                pushl %esi
                pushl %edi
# ________________var_________________________________________________
                movl -4(%ebp), %edi
# ________________swap needed_________________________________________
                movl %edi, 8(%esp)
                popl %esi
                popl %edi
                popl %edx
              cmpl %esi, %edx
              setle %al
              movzbl %al, %edx
              popl %esi
            jg .L11
              # Emitting (...)
              pushl $0
              pushl %edx
              pushl %edi
                # Emitting return
                pushl $0
                # restore old ebp
                movl %ebp, %esp
                popl %ebp
                ret
                addl $4, %esp
              popl %edx
              popl %edi
              addl $4, %esp
            jmp .L12
.L11:
              # Emitting nop
              pushl $0
              pushl %edx
              pushl %edi
              popl %edx
              popl %edi
              addl $4, %esp
.L12:
            popl %edx
            popl %esi
            popl %edi
            addl $4, %esp
          popl %edx
          popl %edi
          addl $4, %esp
        jmp .L2
.L3:
.L4:
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
