.section .data
	vtable_A:
		.int vtable_Object
		.int A_m
	vtable_Main_array:
		.int vtable_Object
	vtable_A_array:
		.int vtable_Object
	vtable_int_array:
		.int vtable_Object
	vtable_Object:
		.int 0
	vtable_Main:
		.int vtable_Object
		.int Main_k
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
  pushl $0
    # Emitting A[] arr
    pushl $0
    addl $4, %esp
    # Emitting int k(...) {...}
    pushl $0
Main_k:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
      pushl $0
        # Emitting return 5
        pushl $0
          # Emitting 5
          pushl $0
          movl $5, %edi
          popl %esi
        movl %esi, 12(%ebp)
        # restore old ebp
        movl %ebp, %esp
        popl %ebp
        ret
        addl $4, %esp
      addl $4, %esp
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    addl $4, %esp
    # Emitting void main(...) {...}
    pushl $0
    pushl %edi
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    # variable ab
    pushl $0
      # Emitting (...)
      pushl $0
        # Emitting this.k(...)
        pushl $0
          # Emitting this
          pushl $0
          pushl %edi
          movl 8(%ebp), %edi
# __________swap needed_______________________________________________
          movl %edi, 4(%esp)
          popl %edi
          popl %esi
        cmpl $0, %esi
        jne .L2
        movl $4, %eax
        jmp .ERROR_EXIT
.L2:
        movl 0(%esi), %edi
        movl 4(%edi), %edi
        subl $4, %esp
        pushl %esi
        call %edi
        addl $4, %esp
        popl %edi
        addl $4, %esp
        # Emitting ab = new A()
        pushl $0
# ________assign______________________________________________________
          # Emitting new A()
          pushl $0
# __________newObject_________________________________________________
          pushl $4
          pushl $4
          call calloc
          addl $8, %esp
          movl $vtable_A, (%eax)
          movl %eax, %edi
          popl %esi
        movl %esi, -4(%ebp)
        addl $4, %esp
        # Emitting arr = new A[][15]
        pushl $0
        pushl %edi
# ________assign______________________________________________________
          # Emitting new A[][15]
          pushl $0
            # Emitting 15
            pushl $0
            movl $15, %edi
            popl %esi
          cmpl $0, %esi
          jge .L3
          movl $5, %eax
          jmp .ERROR_EXIT
.L3:
          addl $2, %esi
          pushl $4
          pushl %esi
          call calloc
          addl $8, %esp
          movl $vtable_Object, (%eax)
          movl %esi, 4(%eax)
          movl %eax, %edx
          popl %ecx
        movl 8(%ebp), %ebx
        movl %ecx, 4(%ebx)
        popl %edi
        addl $4, %esp
        # Emitting this.k(...)
        pushl $0
        pushl %edx
        pushl %esi
        pushl %edi
          # Emitting this
          pushl $0
          pushl %edi
          movl 8(%ebp), %edi
# __________swap needed_______________________________________________
          movl %edi, 4(%esp)
          popl %edi
          popl %esi
        cmpl $0, %esi
        jne .L4
        movl $4, %eax
        jmp .ERROR_EXIT
.L4:
        movl 0(%esi), %edi
        movl 4(%edi), %edi
        subl $4, %esp
        pushl %esi
        call %edi
        addl $4, %esp
        popl %edi
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting ab = this.arr[4]
        pushl $0
        pushl %edx
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting this.arr[4]
          pushl $0
            # Emitting this.arr
            pushl $0
              # Emitting this
              pushl $0
              movl 8(%ebp), %edi
              popl %esi
            cmpl $0, %esi
            jne .L5
            movl $4, %eax
            jmp .ERROR_EXIT
.L5:
            movl 4(%esi), %esi
            popl %edx
            # Emitting 4
            pushl $0
            pushl %edx
            pushl %esi
            pushl %edi
            movl $4, %edi
# ____________swap needed_____________________________________________
            movl %edi, 12(%esp)
            popl %edx
            popl %esi
            popl %edi
            popl %ecx
          cmpl $0, %edx
          jne .L6
          movl $4, %eax
          jmp .ERROR_EXIT
.L6:
          cmpl $0, %ecx
          jge .L7
          movl $3, %eax
          jmp .ERROR_EXIT
.L7:
          cmpl 4(%edx), %ecx
          jl .L8
          movl $3, %eax
          jmp .ERROR_EXIT
.L8:
          imul $4, %ecx
          addl $8, %ecx
          addl %ecx, %edx
          movl (%edx), %edx
          popl %ecx
        movl %ecx, -4(%ebp)
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting arr[+(((5 * 3) + 2))].aga[1].m(...)
        pushl $0
        pushl %edx
        pushl %esi
        pushl %edi
          # Emitting arr[+(((5 * 3) + 2))].aga[1]
          pushl $0
          pushl %edi
            # Emitting arr[+(((5 * 3) + 2))].aga
            pushl $0
              # Emitting arr[+(((5 * 3) + 2))]
              pushl $0
                # Emitting arr
                pushl $0
# ________________var_________________________________________________
                movl 8(%ebp), %edi
                movl 4(%edi), %edi
                popl %esi
                # Emitting +(((5 * 3) + 2))
                pushl $0
                pushl %esi
                pushl %edi
                  # Emitting ((5 * 3) + 2)
                  pushl $0
                    # Emitting (5 * 3)
                    pushl $0
                      # Emitting 3
                      pushl $0
                      movl $3, %edi
                      popl %esi
                      # Emitting 5
                      pushl $0
                      pushl %esi
                      pushl %edi
                      movl $5, %edi
# ______________________swap needed___________________________________
                      movl %edi, 8(%esp)
                      popl %esi
                      popl %edi
                      popl %edx
                    imul %esi, %edx
                    popl %esi
                    # Emitting 2
                    pushl $0
                    pushl %edx
                    pushl %esi
                    pushl %edi
                    movl $2, %edi
# ____________________swap needed_____________________________________
                    movl %edi, 12(%esp)
                    popl %edx
                    popl %esi
                    popl %edi
                    popl %ecx
                  add %ecx, %esi
                  popl %ecx
                popl %esi
                popl %edi
                popl %ebx
              cmpl $0, %esi
              jne .L9
              movl $4, %eax
              jmp .ERROR_EXIT
.L9:
              cmpl $0, %ebx
              jge .L10
              movl $3, %eax
              jmp .ERROR_EXIT
.L10:
              cmpl 4(%esi), %ebx
              jl .L11
              movl $3, %eax
              jmp .ERROR_EXIT
.L11:
              imul $4, %ebx
              addl $8, %ebx
              addl %ebx, %esi
              movl (%esi), %esi
              popl %ebx
            cmpl $0, %ebx
            jne .L12
            movl $4, %eax
            jmp .ERROR_EXIT
.L12:
            movl 8(%ebx), %ebx
            popl %eax
            # Emitting 1
            pushl $0
            pushl %eax
            pushl %ebx
            pushl %ecx
            pushl %edx
            pushl %esi
            pushl %edi
            movl $1, %edi
# ____________swap needed_____________________________________________
            movl %edi, 24(%esp)
            popl %eax
            popl %ebx
            popl %ecx
            popl %edx
            popl %esi
            popl %edi
