.section .data
	vtable_Main_array:
		.int vtable_Object
	vtable_int_array:
		.int vtable_Object
	vtable_Object:
		.int 0
	vtable_Main:
		.int vtable_Object
		.int Main_bla
		.int Main_ok
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
    # Emitting boolean bla(...) {...}
Main_bla:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting if ((a < 2)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting (a < 2)
            # Emitting 2
            movl $2, %edi
            # Emitting a
            pushl $0
            pushl %edi
# ____________var_____________________________________________________
            movl 12(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          cmpl %edi, %esi
          setl %al
          movzbl %al, %esi
        jge .L3
          # Emitting (...)
            # Emitting return true
              # Emitting true
              movl $1, %esi
            movl %esi, 16(%ebp)
            # restore old ebp
            movl %ebp, %esp
            popl %ebp
            ret
        jmp .L4
.L3:
          # Emitting nop
.L4:
        # Emitting return false
          # Emitting false
          movl $0, %esi
        movl %esi, 16(%ebp)
        # restore old ebp
        movl %ebp, %esp
        popl %ebp
        ret
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    # Emitting boolean ok(...) {...}
Main_ok:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    # variable b
    pushl $0
      # Emitting (...)
        # Emitting this.bla(...)
          # Emitting this.bla(...)
            # Emitting this
            pushl $0
            pushl %esi
            movl 8(%ebp), %esi
# ____________swap needed_____________________________________________
            movl %esi, 4(%esp)
            popl %esi
            popl %edi
          cmpl $0, %edi
          jne .L5
          movl $4, %eax
          jmp .ERROR_EXIT
.L5:
          movl 0(%edi), %esi
          movl 4(%esi), %esi
          subl $4, %esp
            # Emitting a
            pushl $0
            pushl %edx
            pushl %esi
            pushl %edi
# ____________var_____________________________________________________
            movl 12(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 12(%esp)
            popl %edi
            popl %esi
            popl %edx
            popl %ecx
          pushl %ecx
          pushl %edi
          call %esi
          addl $8, %esp
          popl %esi
        # Emitting write(a)
        pushl $0
        pushl %edx
          # Emitting a
# __________var_______________________________________________________
          movl 12(%ebp), %edx
        sub $16, %esp
        movl %edx, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
# ________NO swap needed______________________________________________
        popl %edx
        addl $4, %esp
        # Emitting if ((a < 5)) {...} else {...}
        pushl $0
        pushl %edx
# ________ifElse______________________________________________________
          # Emitting (a < 5)
            # Emitting 5
            movl $5, %edx
            # Emitting a
            pushl $0
            pushl %edx
# ____________var_____________________________________________________
            movl 12(%ebp), %edx
# ____________swap needed_____________________________________________
            movl %edx, 4(%esp)
            popl %edx
            popl %esi
          cmpl %edx, %esi
          setl %al
          movzbl %al, %esi
        jge .L7
          # Emitting (...)
            # Emitting b = 3
# ____________assign__________________________________________________
              # Emitting 3
              movl $3, %esi
            movl %esi, -4(%ebp)
            # Emitting return true
              # Emitting true
              movl $1, %esi
            movl %esi, 16(%ebp)
            # restore old ebp
            movl %ebp, %esp
            popl %ebp
            ret
        jmp .L8
.L7:
          # Emitting (...)
            # Emitting if ((a < 2)) {...} else {...}
# ____________ifElse__________________________________________________
              # Emitting (a < 2)
                # Emitting 2
                movl $2, %esi
                # Emitting a
                pushl $0
                pushl %esi
# ________________var_________________________________________________
                movl 12(%ebp), %esi
# ________________swap needed_________________________________________
                movl %esi, 4(%esp)
                popl %esi
                popl %edx
              cmpl %esi, %edx
              setl %al
              movzbl %al, %edx
            jge .L10
              # Emitting (...)
            jmp .L11
.L10:
              # Emitting (...)
                # Emitting a = 4
# ________________assign______________________________________________
                  # Emitting 4
                  movl $4, %edx
                movl %edx, 12(%ebp)
.L11:
.L8:
# ________NO swap needed______________________________________________
        popl %edx
        addl $4, %esp
        # Emitting return true
        pushl $0
        pushl %edx
          # Emitting true
          movl $1, %edx
        movl %edx, 16(%ebp)
        # restore old ebp
        movl %ebp, %esp
        popl %ebp
        ret
# ________NO swap needed______________________________________________
        popl %edx
        addl $4, %esp
    addl $4, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    # Emitting void main(...) {...}
    pushl $0
    pushl %edx
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    # variable a
    pushl $0
    # variable b
    pushl $0
      # Emitting (...)
        # Emitting a = 6
# ________assign______________________________________________________
          # Emitting 6
          movl $6, %edx
        movl %edx, -4(%ebp)
        # Emitting b = this.ok(...)
# ________assign______________________________________________________
          # Emitting this.ok(...)
            # Emitting this
            pushl $0
            pushl %edx
            movl 8(%ebp), %edx
# ____________swap needed_____________________________________________
            movl %edx, 4(%esp)
            popl %edx
            popl %esi
          cmpl $0, %esi
          jne .L12
          movl $4, %eax
          jmp .ERROR_EXIT
.L12:
          movl 0(%esi), %edx
          movl 8(%edx), %edx
          subl $4, %esp
            # Emitting 6
            pushl $0
            pushl %edx
            pushl %esi
            pushl %edi
            movl $6, %edi
# ____________swap needed_____________________________________________
            movl %edi, 12(%esp)
            popl %edi
            popl %esi
            popl %edx
            popl %ecx
          pushl %ecx
          pushl %esi
          call %edx
          addl $8, %esp
          popl %edx
        movl %edx, -8(%ebp)
    addl $8, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
# ____NO swap needed__________________________________________________
    popl %edx
    addl $4, %esp
