.section .data
	vtable_A:
		.int vtable_Object
	vtable_B:
		.int vtable_A
	vtable_Main_array:
		.int vtable_Object
	vtable_A_array:
		.int vtable_Object
	vtable_int_array:
		.int vtable_Object
	vtable_B_array:
		.int vtable_Object
	vtable_Object:
		.int 0
	vtable_Main:
		.int vtable_Object
		.int Main_main
		.int Main_method
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
  # Emitting class B {...}
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
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    addl $4, %esp
    # Emitting int method(...) {...}
    pushl $0
Main_method:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
      pushl $0
        # Emitting if (true) {...} else {...}
        pushl $0
# ________ifElse______________________________________________________
          # Emitting true
          pushl $0
          movl $1, %edi
          popl %esi
        cmpl $0, %esi
        je .L3
          # Emitting (...)
          pushl $0
          pushl %edi
            # Emitting return 1
            pushl $0
              # Emitting 1
              pushl $0
              movl $1, %edi
              popl %esi
            movl %esi, 12(%ebp)
            # restore old ebp
            movl %ebp, %esp
            popl %ebp
            ret
            addl $4, %esp
          popl %edi
          addl $4, %esp
        jmp .L4
.L3:
          # Emitting (...)
          pushl $0
          pushl %edi
            # Emitting if (false) {...} else {...}
            pushl $0
# ____________ifElse__________________________________________________
              # Emitting false
              pushl $0
              movl $0, %edi
              popl %esi
            cmpl $0, %esi
            je .L6
              # Emitting (...)
              pushl $0
              pushl %edi
                # Emitting return 1
                pushl $0
                  # Emitting 1
                  pushl $0
                  movl $1, %edi
                  popl %esi
                movl %esi, 12(%ebp)
                # restore old ebp
                movl %ebp, %esp
                popl %ebp
                ret
                addl $4, %esp
              popl %edi
              addl $4, %esp
            jmp .L7
.L6:
              # Emitting (...)
              pushl $0
              pushl %edi
              popl %edi
              addl $4, %esp
.L7:
            addl $4, %esp
          popl %edi
          addl $4, %esp
.L4:
        addl $4, %esp
        # Emitting return 1
        pushl $0
        pushl %edi
          # Emitting 1
          pushl $0
          movl $1, %edi
          popl %esi
        movl %esi, 12(%ebp)
        # restore old ebp
        movl %ebp, %esp
        popl %ebp
        ret
        popl %edi
        addl $4, %esp
      addl $4, %esp
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    addl $4, %esp
  addl $4, %esp
