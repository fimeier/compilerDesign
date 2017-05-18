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
Main_main:
# store old ebp, set uf new ebp
pushl %ebp
movl %esp, %ebp
# set local variables:
# assign______________________________________________________________
  # Emitting new A()
# __newObject_________________________________________________________
  pushl $4
  pushl $3
  call calloc
  addl $8, %esp
  movl $vtable_A, (%eax)
  movl %eax, %edi
movl 8(%ebp), %esi
movl %edi, 12(%esi)
# assign______________________________________________________________
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
# assign______________________________________________________________
  # Emitting new int[][10]
  pushl %edi
    # Emitting 10
    movl $10, %edi
  cmpl $0, %edi
  jge .L3
  movl $5, %eax
  jmp .ERROR_EXIT
.L3:
  addl $2, %edi
  pushl $4
  pushl %edi
  call calloc
  addl $8, %esp
  movl $vtable_Object, (%eax)
  movl %edi, 4(%eax)
  movl %eax, %esi
  popl %edi
movl 8(%ebp), %edx
movl %esi, 8(%edx)
# assign______________________________________________________________
  # Emitting arr[(arr[arr[(iarr[2] + i)].xs[i]].x * i)]
  pushl %edi
    # Emitting arr
# ____var_____________________________________________________________
    movl 8(%ebp), %edi
    movl 16(%edi), %edi
    # Emitting (arr[arr[(iarr[2] + i)].xs[i]].x * i)
    pushl %edi
      # Emitting arr[arr[(iarr[2] + i)].xs[i]].x
        # Emitting arr[arr[(iarr[2] + i)].xs[i]]
          # Emitting arr
# __________var_______________________________________________________
          movl 8(%ebp), %edi
          movl 16(%edi), %edi
          # Emitting arr[(iarr[2] + i)].xs[i]
          pushl %edi
            # Emitting arr[(iarr[2] + i)].xs
              # Emitting arr[(iarr[2] + i)]
                # Emitting arr
# ________________var_________________________________________________
                movl 8(%ebp), %edi
                movl 16(%edi), %edi
                # Emitting (iarr[2] + i)
                pushl %edi
                  # Emitting iarr[2]
                    # Emitting iarr
# ____________________var_____________________________________________
                    movl 8(%ebp), %edi
                    movl 8(%edi), %edi
                    # Emitting 2
                    pushl %edi
                    movl $2, %edi
# ____________________swap needed_____________________________________
                    movl %edi, %esi
                    popl %edi
                  cmpl $0, %edi
                  jne .L4
                  movl $4, %eax
                  jmp .ERROR_EXIT
.L4:
                  cmpl $0, %esi
                  jge .L5
                  movl $3, %eax
                  jmp .ERROR_EXIT
.L5:
                  cmpl 4(%edi), %esi
                  jl .L6
                  movl $3, %eax
                  jmp .ERROR_EXIT
.L6:
                  imul $4, %esi
                  addl $8, %esi
                  addl %esi, %edi
                  movl (%edi), %edi
                  # Emitting i
                  pushl %edi
# __________________var_______________________________________________
                  movl 8(%ebp), %edi
                  movl 4(%edi), %edi
# __________________swap needed_______________________________________
                  movl %edi, %esi
                  popl %edi
                add %esi, %edi
# ________________swap needed_________________________________________
                movl %edi, %esi
                popl %edi
              cmpl $0, %edi
              jne .L7
              movl $4, %eax
              jmp .ERROR_EXIT
.L7:
              cmpl $0, %esi
              jge .L8
              movl $3, %eax
              jmp .ERROR_EXIT
.L8:
              cmpl 4(%edi), %esi
              jl .L9
              movl $3, %eax
              jmp .ERROR_EXIT
.L9:
              imul $4, %esi
              addl $8, %esi
              addl %esi, %edi
              movl (%edi), %edi
            cmpl $0, %edi
            jne .L10
            movl $4, %eax
            jmp .ERROR_EXIT
.L10:
            movl 8(%edi), %edi
            # Emitting i
            pushl %edi
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 4(%edi), %edi
# ____________swap needed_____________________________________________
            movl %edi, %esi
            popl %edi
          cmpl $0, %edi
          jne .L11
          movl $4, %eax
          jmp .ERROR_EXIT
.L11:
          cmpl $0, %esi
          jge .L12
          movl $3, %eax
          jmp .ERROR_EXIT
.L12:
          cmpl 4(%edi), %esi
          jl .L13
          movl $3, %eax
          jmp .ERROR_EXIT
.L13:
          imul $4, %esi
          addl $8, %esi
          addl %esi, %edi
          movl (%edi), %edi
# __________swap needed_______________________________________________
          movl %edi, %esi
          popl %edi
        cmpl $0, %edi
        jne .L14
        movl $4, %eax
        jmp .ERROR_EXIT
.L14:
        cmpl $0, %esi
        jge .L15
        movl $3, %eax
        jmp .ERROR_EXIT
.L15:
        cmpl 4(%edi), %esi
        jl .L16
        movl $3, %eax
        jmp .ERROR_EXIT
.L16:
        imul $4, %esi
        addl $8, %esi
        addl %esi, %edi
        movl (%edi), %edi
      cmpl $0, %edi
      jne .L17
      movl $4, %eax
      jmp .ERROR_EXIT
.L17:
      movl 4(%edi), %edi
      # Emitting i
      pushl %edi
# ______var___________________________________________________________
      movl 8(%ebp), %edi
      movl 4(%edi), %edi
# ______swap needed___________________________________________________
      movl %edi, %esi
      popl %edi
    imul %esi, %edi
# ____swap needed_____________________________________________________
    movl %edi, %esi
    popl %edi
  cmpl $0, %edi
  jne .L18
  movl $4, %eax
  jmp .ERROR_EXIT
.L18:
  cmpl $0, %esi
  jge .L19
  movl $3, %eax
  jmp .ERROR_EXIT
.L19:
  cmpl 4(%edi), %esi
  jl .L20
  movl $3, %eax
  jmp .ERROR_EXIT
.L20:
  imul $4, %esi
  addl $8, %esi
  addl %esi, %edi
  movl (%edi), %edi
# __swap needed_______________________________________________________
  movl %edi, %esi
  popl %edi
movl 8(%ebp), %edx
movl %esi, 12(%edx)
addl $0, %esp
# restore old ebp
movl %ebp, %esp
popl %ebp
ret
