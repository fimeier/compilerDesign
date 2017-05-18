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
    # Emitting int i
    # Emitting int[] iarr
    # Emitting A a
    # Emitting A[] arr
    # Emitting void main(...) {...}
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting a = new A()
# ________assign______________________________________________________
          # Emitting new A()
# __________newObject_________________________________________________
          pushl $4
          pushl $3
          call calloc
          addl $8, %esp
          movl $vtable_A, (%eax)
          movl %eax, %edi
        movl 8(%ebp), %esi
        movl %edi, 12(%esi)
        # Emitting arr = new A[][42]
# ________assign______________________________________________________
          # Emitting new A[][42]
            # Emitting 42
            movl $42, %edi
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
          movl %edi, 4(%eax)
          movl %eax, %esi
        movl 8(%ebp), %edx
        movl %esi, 16(%edx)
        # Emitting iarr = new int[][10]
        pushl %edi
# ________assign______________________________________________________
          # Emitting new int[][10]
          pushl %edi
            # Emitting 10
            pushl %edi
            movl $10, %esi
            popl %edi
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
          popl %edi
        movl 8(%ebp), %ecx
        movl %edx, 8(%ecx)
        popl %edi
        # Emitting a = arr[(arr[arr[(iarr[2] + i)].xs[i]].x * i)]
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting arr[(arr[arr[(iarr[2] + i)].xs[i]].x * i)]
          pushl %esi
          pushl %edi
            # Emitting arr
            pushl %esi
            pushl %edi
# ____________var_____________________________________________________
            movl 8(%ebp), %edx
            movl 16(%edx), %edx
            popl %edi
            popl %esi
            # Emitting (arr[arr[(iarr[2] + i)].xs[i]].x * i)
            pushl %edx
            pushl %esi
            pushl %edi
              # Emitting arr[arr[(iarr[2] + i)].xs[i]].x
              pushl %edx
              pushl %esi
              pushl %edi
                # Emitting arr[arr[(iarr[2] + i)].xs[i]]
                pushl %edx
                pushl %esi
                pushl %edi
                  # Emitting arr
                  pushl %edx
                  pushl %esi
                  pushl %edi
# __________________var_______________________________________________
                  movl 8(%ebp), %ecx
                  movl 16(%ecx), %ecx
                  popl %edi
                  popl %esi
                  popl %edx
                  # Emitting arr[(iarr[2] + i)].xs[i]
                  pushl %ecx
                  pushl %edx
                  pushl %esi
                  pushl %edi
                    # Emitting arr[(iarr[2] + i)].xs
                    pushl %ecx
                    pushl %edx
                    pushl %esi
                    pushl %edi
                      # Emitting arr[(iarr[2] + i)]
                      pushl %ecx
                      pushl %edx
                      pushl %esi
                      pushl %edi
                        # Emitting arr
                        pushl %ecx
                        pushl %edx
                        pushl %esi
                        pushl %edi
# ________________________var_________________________________________
                        movl 8(%ebp), %ebx
                        movl 16(%ebx), %ebx
                        popl %edi
                        popl %esi
                        popl %edx
                        popl %ecx
                        # Emitting (iarr[2] + i)
                        pushl %ebx
                        pushl %ecx
                        pushl %edx
                        pushl %esi
                        pushl %edi
                          # Emitting iarr[2]
                          pushl %ebx
                          pushl %ecx
                          pushl %edx
                          pushl %esi
                          pushl %edi
                            # Emitting iarr
                            pushl %ebx
                            pushl %ecx
                            pushl %edx
                            pushl %esi
                            pushl %edi
# ____________________________var_____________________________________
                            movl 8(%ebp), %eax
                            movl 8(%eax), %eax
                            popl %edi
                            popl %esi
                            popl %edx
                            popl %ecx
                            popl %ebx
                            # Emitting 2
                            pushl %eax
                            pushl %ebx
                            pushl %ecx
                            pushl %edx
                            pushl %esi
                            pushl %edi
