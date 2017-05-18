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
pushl $2
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
    # Emitting int x
    # Emitting void main(...) {...}
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    # variable y
    pushl $0
    # variable arr
    pushl $0
      # Emitting (...)
        # Emitting write(1)
          # Emitting 1
          movl $1, %edi
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
        # Emitting y = read()
# ________assign______________________________________________________
          # Emitting read()
          sub $16, %esp
          leal 8(%esp), %edi
          movl %edi, 4(%esp)
          movl $STR_D, 0(%esp)
          call scanf
          movl 8(%esp), %edi
          add $16, %esp
        movl %edi, -4(%ebp)
        # Emitting write((y + 1))
          # Emitting (y + 1)
            # Emitting 1
            movl $1, %edi
            # Emitting y
            pushl $0
            pushl %edi
# ____________var_____________________________________________________
            movl -4(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          add %edi, %esi
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
        # Emitting x = read()
# ________assign______________________________________________________
          # Emitting read()
          sub $16, %esp
          leal 8(%esp), %esi
          movl %esi, 4(%esp)
          movl $STR_D, 0(%esp)
          call scanf
          movl 8(%esp), %esi
          add $16, %esp
        movl 8(%ebp), %edi
        movl %esi, 4(%edi)
        # Emitting write((x + 1))
          # Emitting (x + 1)
            # Emitting 1
            movl $1, %esi
            # Emitting x
            pushl $0
            pushl %esi
# ____________var_____________________________________________________
            movl 8(%ebp), %esi
            movl 4(%esi), %esi
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
        # Emitting arr = new int[][64]
# ________assign______________________________________________________
          # Emitting new int[][64]
            # Emitting 64
            movl $64, %edi
          cmpl $0, %edi
          jge .L2
          movl $5, %eax
          jmp .ERROR_EXIT
.L2:
          addl $2, %edi
          pushl $4
          pushl %edi
          call calloc
          addl $8, %esp
          movl $vtable_Object, (%eax)
          subl $2, %edi
          movl %edi, 4(%eax)
          movl %eax, %esi
        movl %esi, -8(%ebp)
        # Emitting arr[x] = read()
# ________assign______________________________________________________
          # Emitting read()
          sub $16, %esp
          leal 8(%esp), %esi
          movl %esi, 4(%esp)
          movl $STR_D, 0(%esp)
          call scanf
          movl 8(%esp), %esi
          add $16, %esp
          # Emitting arr
          pushl $0
          pushl %esi
# __________var_______________________________________________________
          movl -8(%ebp), %esi
# __________swap needed_______________________________________________
          movl %esi, 4(%esp)
          popl %esi
          popl %edi
          # Emitting x
          pushl $0
          pushl %esi
          pushl %edi
# __________var_______________________________________________________
          movl 8(%ebp), %edi
          movl 4(%edi), %edi
# __________swap needed_______________________________________________
          movl %edi, 8(%esp)
          popl %edi
          popl %esi
          popl %edx
        cmpl $0, %edi
        jne .L3
        movl $4, %eax
        jmp .ERROR_EXIT
.L3:
        cmpl $0, %edx
        jge .L4
        movl $3, %eax
        jmp .ERROR_EXIT
.L4:
        cmpl 4(%edi), %edx
        jl .L5
        movl $3, %eax
        jmp .ERROR_EXIT
.L5:
        imul $4, %edx
        addl $8, %edx
        addl %edx, %edi
        movl %esi, (%edi)
        # Emitting write((arr[x] + 1))
          # Emitting (arr[x] + 1)
            # Emitting arr[x]
              # Emitting arr
# ______________var___________________________________________________
              movl -8(%ebp), %esi
              # Emitting x
              pushl $0
              pushl %esi
# ______________var___________________________________________________
              movl 8(%ebp), %esi
              movl 4(%esi), %esi
# ______________swap needed___________________________________________
              movl %esi, 4(%esp)
              popl %esi
              popl %edi
            cmpl $0, %esi
            jne .L6
            movl $4, %eax
            jmp .ERROR_EXIT
.L6:
            cmpl $0, %edi
            jge .L7
            movl $3, %eax
            jmp .ERROR_EXIT
.L7:
            cmpl 4(%esi), %edi
            jl .L8
            movl $3, %eax
            jmp .ERROR_EXIT
.L8:
            imul $4, %edi
            addl $8, %edi
            addl %edi, %esi
            movl (%esi), %esi
            # Emitting 1
            pushl $0
            pushl %esi
            movl $1, %esi
# ____________swap needed_____________________________________________
            movl %esi, 4(%esp)
            popl %esi
            popl %edi
          add %edi, %esi
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
    addl $8, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
