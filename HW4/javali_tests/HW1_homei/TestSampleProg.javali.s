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
        # Emitting a = 100
# ________assign______________________________________________________
          # Emitting 100
          movl $100, %edi
        movl %edi, -4(%ebp)
        # Emitting write(a)
          # Emitting a
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
        # Emitting b = read()
# ________assign______________________________________________________
          # Emitting read()
          sub $16, %esp
          leal 8(%esp), %edi
          movl %edi, 4(%esp)
          movl $STR_D, 0(%esp)
          call scanf
          movl 8(%esp), %edi
          add $16, %esp
        movl %edi, -8(%ebp)
        # Emitting c = 0
# ________assign______________________________________________________
          # Emitting 0
          movl $0, %edi
        movl %edi, -12(%ebp)
        # Emitting c = (c + ((a / b) * -(-(64))))
# ________assign______________________________________________________
          # Emitting (c + ((a / b) * -(-(64))))
            # Emitting ((a / b) * -(-(64)))
              # Emitting (a / b)
                # Emitting b
# ________________var_________________________________________________
                movl -8(%ebp), %edi
                # Emitting a
                pushl $0
                pushl %edi
# ________________var_________________________________________________
                movl -4(%ebp), %edi
# ________________swap needed_________________________________________
                movl %edi, 4(%esp)
                popl %edi
                popl %esi
              cmpl $0, %edi
              jne .L2
              movl $7, %eax
              jmp .ERROR_EXIT
.L2:
              pushl %edi
              pushl %esi
              popl %eax
              popl %ebx
              cltd
              idivl %ebx
              movl %eax, %esi
              # Emitting -(-(64))
              pushl $0
              pushl %esi
                # Emitting -(64)
                  # Emitting 64
                  movl $64, %esi
                negl %esi
              negl %esi
# ______________swap needed___________________________________________
              movl %esi, 4(%esp)
              popl %esi
              popl %edi
            imul %edi, %esi
            # Emitting c
            pushl $0
            pushl %esi
# ____________var_____________________________________________________
            movl -12(%ebp), %esi
# ____________swap needed_____________________________________________
            movl %esi, 4(%esp)
            popl %esi
            popl %edi
          add %esi, %edi
        movl %edi, -12(%ebp)
        # Emitting write(c)
          # Emitting c
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
        # Emitting c = 0
# ________assign______________________________________________________
          # Emitting 0
          movl $0, %edi
        movl %edi, -12(%ebp)
        # Emitting write((c + ((a / b) * -(-(64)))))
          # Emitting (c + ((a / b) * -(-(64))))
            # Emitting ((a / b) * -(-(64)))
              # Emitting (a / b)
                # Emitting b
# ________________var_________________________________________________
                movl -8(%ebp), %edi
                # Emitting a
                pushl $0
                pushl %edi
# ________________var_________________________________________________
                movl -4(%ebp), %edi
# ________________swap needed_________________________________________
                movl %edi, 4(%esp)
                popl %edi
                popl %esi
              cmpl $0, %edi
              jne .L3
              movl $7, %eax
              jmp .ERROR_EXIT
.L3:
              pushl %edi
              pushl %esi
              popl %eax
              popl %ebx
              cltd
              idivl %ebx
              movl %eax, %esi
              # Emitting -(-(64))
              pushl $0
              pushl %esi
                # Emitting -(64)
                  # Emitting 64
                  movl $64, %esi
                negl %esi
              negl %esi
# ______________swap needed___________________________________________
              movl %esi, 4(%esp)
              popl %esi
              popl %edi
            imul %edi, %esi
            # Emitting c
            pushl $0
            pushl %esi
# ____________var_____________________________________________________
            movl -12(%ebp), %esi
# ____________swap needed_____________________________________________
            movl %esi, 4(%esp)
            popl %esi
            popl %edi
          add %esi, %edi
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
        # Emitting d = -(1000000000)
# ________assign______________________________________________________
          # Emitting -(1000000000)
            # Emitting 1000000000
            movl $1000000000, %edi
          negl %edi
        movl %edi, -16(%ebp)
        # Emitting write((d / -(3)))
          # Emitting (d / -(3))
            # Emitting -(3)
              # Emitting 3
              movl $3, %edi
            negl %edi
            # Emitting d
            pushl $0
            pushl %edi
# ____________var_____________________________________________________
            movl -16(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          cmpl $0, %edi
          jne .L4
          movl $7, %eax
          jmp .ERROR_EXIT
.L4:
          pushl %edi
          pushl %esi
          popl %eax
          popl %ebx
          cltd
          idivl %ebx
          movl %eax, %esi
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
    addl $16, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
