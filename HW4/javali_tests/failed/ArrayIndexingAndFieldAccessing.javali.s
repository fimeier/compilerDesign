.section .data
	vtable_A:
		.int vtable_Object
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
pushl $5
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
    # Emitting int i
    pushl $0
    addl $4, %esp
    # Emitting int[] iarr
    pushl $0
    addl $4, %esp
    # Emitting A a
    pushl $0
    addl $4, %esp
    # Emitting A[] arr
    pushl $0
    addl $4, %esp
    # Emitting void main(...) {...}
    pushl $0
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
      pushl $0
        # Emitting a = new A()
        pushl $0
# ________assign______________________________________________________
          # Emitting new A()
          pushl $0
# __________newObject_________________________________________________
          pushl $4
          pushl $3
          call calloc
          addl $8, %esp
          movl $vtable_A, (%eax)
          movl %eax, %edi
          popl %esi
        movl 8(%ebp), %edx
        movl %esi, 12(%edx)
        addl $4, %esp
        # Emitting arr = new A[][42]
        pushl $0
        pushl %edi
# ________assign______________________________________________________
          # Emitting new A[][42]
          pushl $0
            # Emitting 42
            pushl $0
            movl $42, %edi
            popl %esi
          cmpl $0, %esi
          jge .L2
          movl $5, %eax
          jmp .ERROR_EXIT
.L2:
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
        movl %ecx, 16(%ebx)
        popl %edi
        addl $4, %esp
        # Emitting iarr = new int[][10]
        pushl $0
        pushl %edx
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting new int[][10]
          pushl $0
            # Emitting 10
            pushl $0
            movl $10, %edi
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
        movl %ecx, 8(%ebx)
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting a = arr[(arr[arr[(iarr[2] + i)].xs[i]].x * i)]
        pushl $0
        pushl %edx
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting arr[(arr[arr[(iarr[2] + i)].xs[i]].x * i)]
          pushl $0
            # Emitting arr
            pushl $0
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 16(%edi), %edi
            popl %esi
            # Emitting (arr[arr[(iarr[2] + i)].xs[i]].x * i)
            pushl $0
            pushl %esi
            pushl %edi
              # Emitting arr[arr[(iarr[2] + i)].xs[i]].x
              pushl $0
                # Emitting arr[arr[(iarr[2] + i)].xs[i]]
                pushl $0
                  # Emitting arr
                  pushl $0
# __________________var_______________________________________________
                  movl 8(%ebp), %edi
                  movl 16(%edi), %edi
                  popl %esi
                  # Emitting arr[(iarr[2] + i)].xs[i]
                  pushl $0
                  pushl %esi
                  pushl %edi
                    # Emitting arr[(iarr[2] + i)].xs
                    pushl $0
                      # Emitting arr[(iarr[2] + i)]
                      pushl $0
                        # Emitting arr
                        pushl $0
# ________________________var_________________________________________
                        movl 8(%ebp), %edi
                        movl 16(%edi), %edi
                        popl %esi
                        # Emitting (iarr[2] + i)
                        pushl $0
                        pushl %esi
                        pushl %edi
                          # Emitting iarr[2]
                          pushl $0
                            # Emitting iarr
                            pushl $0
# ____________________________var_____________________________________
                            movl 8(%ebp), %edi
                            movl 8(%edi), %edi
                            popl %esi
                            # Emitting 2
                            pushl $0
                            pushl %esi
                            pushl %edi
                            movl $2, %edi
# ____________________________swap needed_____________________________
                            movl %edi, 8(%esp)
                            popl %esi
                            popl %edi
                            popl %edx
                          cmpl $0, %esi
                          jne .L4
                          movl $4, %eax
                          jmp .ERROR_EXIT
.L4:
                          cmpl $0, %edx
                          jge .L5
                          movl $3, %eax
                          jmp .ERROR_EXIT
.L5:
                          cmpl 4(%esi), %edx
                          jl .L6
                          movl $3, %eax
                          jmp .ERROR_EXIT
.L6:
                          imul $4, %edx
                          addl $8, %edx
                          addl %edx, %esi
                          movl (%esi), %esi
                          popl %edx
                          # Emitting i
                          pushl $0
                          pushl %edx
                          pushl %esi
                          pushl %edi
# __________________________var_______________________________________
                          movl 8(%ebp), %edi
                          movl 4(%edi), %edi
# __________________________swap needed_______________________________
                          movl %edi, 12(%esp)
                          popl %edx
                          popl %esi
                          popl %edi
                          popl %ecx
                        add %ecx, %edx
                        popl %esi
                        popl %edi
                        popl %ecx
                      cmpl $0, %esi
                      jne .L7
                      movl $4, %eax
                      jmp .ERROR_EXIT
.L7:
                      cmpl $0, %ecx
                      jge .L8
                      movl $3, %eax
                      jmp .ERROR_EXIT
.L8:
                      cmpl 4(%esi), %ecx
                      jl .L9
                      movl $3, %eax
                      jmp .ERROR_EXIT
.L9:
                      imul $4, %ecx
                      addl $8, %ecx
                      addl %ecx, %esi
                      movl (%esi), %esi
                      popl %ecx
                    cmpl $0, %ecx
                    jne .L10
                    movl $4, %eax
                    jmp .ERROR_EXIT
.L10:
                    movl 8(%ecx), %ecx
                    popl %ebx
                    # Emitting i
                    pushl $0
                    pushl %ebx
                    pushl %ecx
                    pushl %edx
                    pushl %esi
                    pushl %edi
# ____________________var_____________________________________________
                    movl 8(%ebp), %edi
                    movl 4(%edi), %edi
# ____________________swap needed_____________________________________
                    movl %edi, 20(%esp)
                    popl %ebx
                    popl %ecx
                    popl %edx
                    popl %esi
                    popl %edi
                    popl %eax
                  cmpl $0, %ebx
                  jne .L11
                  movl $4, %eax
                  jmp .ERROR_EXIT
.L11:
                  cmpl $0, %eax
                  jge .L12
                  movl $3, %eax
                  jmp .ERROR_EXIT
.L12:
                  cmpl 4(%ebx), %eax
                  jl .L13
                  movl $3, %eax
                  jmp .ERROR_EXIT
.L13:
                  imul $4, %eax
                  addl $8, %eax
                  addl %eax, %ebx
                  movl (%ebx), %ebx
                  popl %esi
                  popl %edi
                  popl %eax
                cmpl $0, %esi
                jne .L14
                movl $4, %eax
                jmp .ERROR_EXIT
.L14:
                cmpl $0, %eax
                jge .L15
                movl $3, %eax
                jmp .ERROR_EXIT
.L15:
                cmpl 4(%esi), %eax
                jl .L16
                movl $3, %eax
                jmp .ERROR_EXIT
.L16:
                imul $4, %eax
                addl $8, %eax
                addl %eax, %esi
                movl (%esi), %esi
                popl %eax
              cmpl $0, %eax
              jne .L17
              movl $4, %eax
              jmp .ERROR_EXIT
.L17:
              movl 4(%eax), %eax
