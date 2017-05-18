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
    # Emitting A[] arr
    # Emitting int k(...) {...}
Main_k:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting return 5
          # Emitting 5
          movl $5, %edi
        movl %edi, 12(%ebp)
        # restore old ebp
        movl %ebp, %esp
        popl %ebp
        ret
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    # Emitting void main(...) {...}
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    # variable ab
    pushl $0
      # Emitting (...)
        # Emitting this.k(...)
          # Emitting this
          pushl %edi
          movl 8(%ebp), %esi
          popl %edi
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
        # Emitting ab = new A()
# ________assign______________________________________________________
          # Emitting new A()
# __________newObject_________________________________________________
          pushl $4
          pushl $4
          call calloc
          addl $8, %esp
          movl $vtable_A, (%eax)
          movl %eax, %edi
        movl %edi, -4(%ebp)
        # Emitting arr = new A[][15]
# ________assign______________________________________________________
          # Emitting new A[][15]
            # Emitting 15
            movl $15, %edi
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
        movl 8(%ebp), %edx
        movl %esi, 4(%edx)
        # Emitting this.k(...)
        pushl %edi
          # Emitting this
          pushl %esi
          pushl %edi
          movl 8(%ebp), %edx
          popl %edi
          popl %esi
        cmpl $0, %edx
        jne .L4
        movl $4, %eax
        jmp .ERROR_EXIT
.L4:
        movl 0(%edx), %esi
        movl 4(%esi), %esi
        subl $4, %esp
        pushl %edx
        call %esi
        addl $4, %esp
        popl %esi
        popl %edi
        # Emitting ab = this.arr[4]
        pushl %edi
# ________assign______________________________________________________
          # Emitting this.arr[4]
          pushl %edi
            # Emitting this.arr
            pushl %edi
              # Emitting this
              pushl %edi
              movl 8(%ebp), %esi
              popl %edi
            cmpl $0, %esi
            jne .L5
            movl $4, %eax
            jmp .ERROR_EXIT
.L5:
            movl 4(%esi), %esi
            popl %edi
            # Emitting 4
            pushl %esi
            pushl %edi
            movl $4, %edx
            popl %edi
            popl %esi
          cmpl $0, %esi
          jne .L6
          movl $4, %eax
          jmp .ERROR_EXIT
.L6:
          cmpl $0, %edx
          jge .L7
          movl $3, %eax
          jmp .ERROR_EXIT
.L7:
          cmpl 4(%esi), %edx
          jl .L8
          movl $3, %eax
          jmp .ERROR_EXIT
.L8:
          imul $4, %edx
          addl $8, %edx
          addl %edx, %esi
          movl (%esi), %esi
          popl %edi
        movl %esi, -4(%ebp)
        popl %edi
        # Emitting arr[+(((5 * 3) + 2))].aga[1].m(...)
        pushl %edi
          # Emitting arr[+(((5 * 3) + 2))].aga[1]
          pushl %esi
          pushl %edi
            # Emitting arr[+(((5 * 3) + 2))].aga
            pushl %esi
            pushl %edi
              # Emitting arr[+(((5 * 3) + 2))]
              pushl %esi
              pushl %edi
                # Emitting arr
                pushl %esi
                pushl %edi
# ________________var_________________________________________________
                movl 8(%ebp), %edx
                movl 4(%edx), %edx
                popl %edi
                popl %esi
                # Emitting +(((5 * 3) + 2))
                pushl %edx
                pushl %esi
                pushl %edi
                  # Emitting ((5 * 3) + 2)
                  pushl %edx
                  pushl %esi
                  pushl %edi
                    # Emitting (5 * 3)
                    pushl %edx
                    pushl %esi
                    pushl %edi
                      # Emitting 3
                      pushl %edx
                      pushl %esi
                      pushl %edi
                      movl $3, %ecx
                      popl %edi
                      popl %esi
                      popl %edx
                      # Emitting 5
                      pushl %ecx
                      pushl %edx
                      pushl %esi
                      pushl %edi
                      movl $5, %ebx
                      popl %edi
                      popl %esi
                      popl %edx
                      popl %ecx
                    imul %ecx, %ebx
                    popl %edi
                    popl %esi
                    popl %edx
                    # Emitting 2
                    pushl %ebx
                    pushl %edx
                    pushl %esi
                    pushl %edi
                    movl $2, %ecx
                    popl %edi
                    popl %esi
                    popl %edx
                    popl %ebx
                  add %ecx, %ebx
                  popl %edi
                  popl %esi
                  popl %edx
                popl %edi
                popl %esi
                popl %edx
              cmpl $0, %edx
              jne .L9
              movl $4, %eax
              jmp .ERROR_EXIT
.L9:
              cmpl $0, %ebx
              jge .L10
              movl $3, %eax
              jmp .ERROR_EXIT
.L10:
              cmpl 4(%edx), %ebx
              jl .L11
              movl $3, %eax
              jmp .ERROR_EXIT
.L11:
              imul $4, %ebx
              addl $8, %ebx
              addl %ebx, %edx
              movl (%edx), %edx
              popl %edi
              popl %esi
            cmpl $0, %edx
            jne .L12
            movl $4, %eax
            jmp .ERROR_EXIT
.L12:
            movl 8(%edx), %edx
            popl %edi
            popl %esi
            # Emitting 1
            pushl %edx
            pushl %esi
            pushl %edi
            movl $1, %ebx
            popl %edi
            popl %esi
            popl %edx
          cmpl $0, %edx
          jne .L13
          movl $4, %eax
          jmp .ERROR_EXIT
.L13:
          cmpl $0, %ebx
          jge .L14
          movl $3, %eax
          jmp .ERROR_EXIT
.L14:
          cmpl 4(%edx), %ebx
          jl .L15
          movl $3, %eax
          jmp .ERROR_EXIT
.L15:
          imul $4, %ebx
          addl $8, %ebx
          addl %ebx, %edx
          movl (%edx), %edx
          popl %edi
          popl %esi
        cmpl $0, %edx
        jne .L16
        movl $4, %eax
        jmp .ERROR_EXIT
.L16:
        movl 0(%edx), %esi
        movl 4(%esi), %esi
        subl $4, %esp
        pushl %edx
        call %esi
        addl $4, %esp
        popl %esi
        popl %edi
        # Emitting this.arr[4].aga[0].m(...).aga[2].aba.k[this.arr[3].aba.k[3]] = arr[3].m(...).aba.k[7]
        pushl %edi
# ________assign______________________________________________________
          # Emitting arr[3].m(...).aba.k[7]
          pushl %edi
            # Emitting arr[3].m(...).aba.k
            pushl %edi
              # Emitting arr[3].m(...).aba
              pushl %edi
                # Emitting arr[3].m(...)
                pushl %edi
                  # Emitting arr[3]
                  pushl %esi
                  pushl %edi
                    # Emitting arr
                    pushl %esi
                    pushl %edi
# ____________________var_____________________________________________
                    movl 8(%ebp), %edx
                    movl 4(%edx), %edx
                    popl %edi
                    popl %esi
                    # Emitting 3
                    pushl %edx
                    pushl %esi
                    pushl %edi
                    movl $3, %ebx
                    popl %edi
                    popl %esi
                    popl %edx
                  cmpl $0, %edx
                  jne .L17
                  movl $4, %eax
                  jmp .ERROR_EXIT
.L17:
                  cmpl $0, %ebx
                  jge .L18
                  movl $3, %eax
                  jmp .ERROR_EXIT
.L18:
                  cmpl 4(%edx), %ebx
                  jl .L19
                  movl $3, %eax
                  jmp .ERROR_EXIT
.L19:
                  imul $4, %ebx
                  addl $8, %ebx
                  addl %ebx, %edx
                  movl (%edx), %edx
                  popl %edi
                  popl %esi
                cmpl $0, %edx
                jne .L20
                movl $4, %eax
                jmp .ERROR_EXIT
.L20:
                movl 0(%edx), %esi
                movl 4(%esi), %esi
                subl $4, %esp
                pushl %edx
                call %esi
                addl $4, %esp
                popl %esi
                popl %edi
              cmpl $0, %esi
              jne .L21
              movl $4, %eax
              jmp .ERROR_EXIT
.L21:
              movl 12(%esi), %esi
              popl %edi
            cmpl $0, %esi
            jne .L22
            movl $4, %eax
            jmp .ERROR_EXIT
.L22:
            movl 4(%esi), %esi
            popl %edi
            # Emitting 7
            pushl %esi
            pushl %edi
            movl $7, %edx
            popl %edi
            popl %esi
          cmpl $0, %esi
          jne .L23
          movl $4, %eax
          jmp .ERROR_EXIT
.L23:
          cmpl $0, %edx
          jge .L24
          movl $3, %eax
          jmp .ERROR_EXIT
.L24:
          cmpl 4(%esi), %edx
          jl .L25
          movl $3, %eax
          jmp .ERROR_EXIT
.L25:
          imul $4, %edx
          addl $8, %edx
          addl %edx, %esi
          movl (%esi), %esi
          popl %edi
          # Emitting this.arr[4].aga[0].m(...).aga[2].aba.k
          pushl %esi
          pushl %edi
            # Emitting this.arr[4].aga[0].m(...).aga[2].aba
            pushl %esi
            pushl %edi
              # Emitting this.arr[4].aga[0].m(...).aga[2]
              pushl %esi
              pushl %edi
                # Emitting this.arr[4].aga[0].m(...).aga
                pushl %esi
                pushl %edi
                  # Emitting this.arr[4].aga[0].m(...)
                  pushl %esi
                  pushl %edi
                    # Emitting this.arr[4].aga[0]
                    pushl %edx
                    pushl %esi
                    pushl %edi
                      # Emitting this.arr[4].aga
                      pushl %edx
                      pushl %esi
                      pushl %edi
                        # Emitting this.arr[4]
                        pushl %edx
                        pushl %esi
                        pushl %edi
                          # Emitting this.arr
                          pushl %edx
                          pushl %esi
                          pushl %edi
                            # Emitting this
                            pushl %edx
                            pushl %esi
                            pushl %edi
                            movl 8(%ebp), %ebx
                            popl %edi
                            popl %esi
                            popl %edx
                          cmpl $0, %ebx
                          jne .L26
                          movl $4, %eax
                          jmp .ERROR_EXIT
.L26:
                          movl 4(%ebx), %ebx
                          popl %edi
                          popl %esi
                          popl %edx
                          # Emitting 4
                          pushl %ebx
                          pushl %edx
                          pushl %esi
                          pushl %edi
                          movl $4, %ecx
                          popl %edi
                          popl %esi
                          popl %edx
                          popl %ebx
                        cmpl $0, %ebx
                        jne .L27
                        movl $4, %eax
                        jmp .ERROR_EXIT
.L27:
                        cmpl $0, %ecx
                        jge .L28
                        movl $3, %eax
                        jmp .ERROR_EXIT
.L28:
                        cmpl 4(%ebx), %ecx
                        jl .L29
                        movl $3, %eax
                        jmp .ERROR_EXIT
.L29:
                        imul $4, %ecx
                        addl $8, %ecx
                        addl %ecx, %ebx
                        movl (%ebx), %ebx
                        popl %edi
                        popl %esi
                        popl %edx
                      cmpl $0, %ebx
                      jne .L30
                      movl $4, %eax
                      jmp .ERROR_EXIT
.L30:
                      movl 8(%ebx), %ebx
                      popl %edi
                      popl %esi
                      popl %edx
                      # Emitting 0
                      pushl %ebx
                      pushl %edx
                      pushl %esi
                      pushl %edi
                      movl $0, %ecx
                      popl %edi
                      popl %esi
                      popl %edx
                      popl %ebx
                    cmpl $0, %ebx
                    jne .L31
                    movl $4, %eax
                    jmp .ERROR_EXIT
.L31:
                    cmpl $0, %ecx
                    jge .L32
                    movl $3, %eax
                    jmp .ERROR_EXIT
.L32:
                    cmpl 4(%ebx), %ecx
                    jl .L33
                    movl $3, %eax
                    jmp .ERROR_EXIT
.L33:
                    imul $4, %ecx
                    addl $8, %ecx
                    addl %ecx, %ebx
                    movl (%ebx), %ebx
                    popl %edi
                    popl %esi
                    popl %edx
                  cmpl $0, %ebx
                  jne .L34
                  movl $4, %eax
                  jmp .ERROR_EXIT
.L34:
                  movl 0(%ebx), %edx
                  movl 4(%edx), %edx
                  subl $4, %esp
                  pushl %ebx
                  call %edx
                  addl $4, %esp
                  popl %edx
                  popl %edi
                  popl %esi
                cmpl $0, %edx
                jne .L35
                movl $4, %eax
                jmp .ERROR_EXIT
.L35:
                movl 8(%edx), %edx
                popl %edi
                popl %esi
                # Emitting 2
                pushl %edx
                pushl %esi
                pushl %edi
                movl $2, %ebx
                popl %edi
                popl %esi
                popl %edx
              cmpl $0, %edx
              jne .L36
              movl $4, %eax
              jmp .ERROR_EXIT
.L36:
              cmpl $0, %ebx
              jge .L37
              movl $3, %eax
              jmp .ERROR_EXIT
.L37:
              cmpl 4(%edx), %ebx
              jl .L38
              movl $3, %eax
              jmp .ERROR_EXIT
.L38:
              imul $4, %ebx
              addl $8, %ebx
              addl %ebx, %edx
              movl (%edx), %edx
              popl %edi
              popl %esi
            cmpl $0, %edx
            jne .L39
            movl $4, %eax
            jmp .ERROR_EXIT
.L39:
            movl 12(%edx), %edx
            popl %edi
            popl %esi
          cmpl $0, %edx
          jne .L40
          movl $4, %eax
          jmp .ERROR_EXIT
.L40:
          movl 4(%edx), %edx
          popl %edi
          popl %esi
          # Emitting this.arr[3].aba.k[3]
          pushl %edx
          pushl %esi
          pushl %edi
            # Emitting this.arr[3].aba.k
            pushl %edx
            pushl %esi
            pushl %edi
              # Emitting this.arr[3].aba
              pushl %edx
              pushl %esi
              pushl %edi
                # Emitting this.arr[3]
                pushl %edx
                pushl %esi
                pushl %edi
                  # Emitting this.arr
                  pushl %edx
                  pushl %esi
                  pushl %edi
                    # Emitting this
                    pushl %edx
                    pushl %esi
                    pushl %edi
                    movl 8(%ebp), %ebx
                    popl %edi
                    popl %esi
                    popl %edx
                  cmpl $0, %ebx
                  jne .L41
                  movl $4, %eax
                  jmp .ERROR_EXIT
.L41:
                  movl 4(%ebx), %ebx
                  popl %edi
                  popl %esi
                  popl %edx
                  # Emitting 3
                  pushl %ebx
                  pushl %edx
                  pushl %esi
                  pushl %edi
                  movl $3, %ecx
                  popl %edi
                  popl %esi
                  popl %edx
                  popl %ebx
                cmpl $0, %ebx
                jne .L42
                movl $4, %eax
                jmp .ERROR_EXIT
.L42:
                cmpl $0, %ecx
                jge .L43
                movl $3, %eax
                jmp .ERROR_EXIT
.L43:
                cmpl 4(%ebx), %ecx
                jl .L44
                movl $3, %eax
                jmp .ERROR_EXIT
.L44:
                imul $4, %ecx
                addl $8, %ecx
                addl %ecx, %ebx
                movl (%ebx), %ebx
                popl %edi
                popl %esi
                popl %edx
              cmpl $0, %ebx
              jne .L45
              movl $4, %eax
              jmp .ERROR_EXIT
.L45:
              movl 12(%ebx), %ebx
              popl %edi
              popl %esi
              popl %edx
            cmpl $0, %ebx
            jne .L46
            movl $4, %eax
            jmp .ERROR_EXIT
.L46:
            movl 4(%ebx), %ebx
            popl %edi
            popl %esi
            popl %edx
            # Emitting 3
            pushl %ebx
            pushl %edx
            pushl %esi
            pushl %edi
            movl $3, %ecx
            popl %edi
            popl %esi
            popl %edx
            popl %ebx
          cmpl $0, %ebx
          jne .L47
          movl $4, %eax
          jmp .ERROR_EXIT
.L47:
          cmpl $0, %ecx
          jge .L48
          movl $3, %eax
          jmp .ERROR_EXIT
.L48:
          cmpl 4(%ebx), %ecx
          jl .L49
          movl $3, %eax
          jmp .ERROR_EXIT
.L49:
          imul $4, %ecx
          addl $8, %ecx
          addl %ecx, %ebx
          movl (%ebx), %ebx
          popl %edi
          popl %esi
          popl %edx
        cmpl $0, %edx
        jne .L50
        movl $4, %eax
        jmp .ERROR_EXIT
.L50:
        cmpl $0, %ebx
        jge .L51
        movl $3, %eax
        jmp .ERROR_EXIT
.L51:
        cmpl 4(%edx), %ebx
        jl .L52
        movl $3, %eax
        jmp .ERROR_EXIT
.L52:
        imul $4, %ebx
        addl $8, %ebx
        addl %ebx, %edx
        movl %esi, (%edx)
        popl %edi
    addl $4, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
  # Emitting class A {...}
  pushl %edi
    # Emitting int[] k
    pushl %edi
    popl %edi
    # Emitting A[] aga
    pushl %edi
    popl %edi
    # Emitting A aba
    pushl %edi
    popl %edi
    # Emitting A m(...) {...}
    pushl %edi
A_m:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    pushl %edi
    # set local variables:
    # variable ret
    pushl $0
      # Emitting (...)
        # Emitting this.aga = new A[][50]
# ________assign______________________________________________________
          # Emitting new A[][50]
            # Emitting 50
            movl $50, %edi
          cmpl $0, %edi
          jge .L53
          movl $5, %eax
          jmp .ERROR_EXIT
.L53:
          addl $2, %edi
          pushl $4
          pushl %edi
          call calloc
          addl $8, %esp
          movl $vtable_Object, (%eax)
          movl %edi, 4(%eax)
          movl %eax, %esi
          # Emitting this
          pushl %esi
          pushl %edi
          movl 8(%ebp), %edx
          popl %edi
          popl %esi
        cmpl $0, %edx
        jne .L54
        movl $4, %eax
        jmp .ERROR_EXIT
.L54:
        movl %esi, 8(%edx)
        # Emitting this.k = new int[][(4 + 5)]
        pushl %edi
# ________assign______________________________________________________
          # Emitting new int[][(4 + 5)]
          pushl %edi
            # Emitting (4 + 5)
            pushl %edi
              # Emitting 5
              pushl %edi
              movl $5, %esi
              popl %edi
              # Emitting 4
              pushl %esi
              pushl %edi
              movl $4, %edx
              popl %edi
              popl %esi
            add %esi, %edx
            popl %edi
          cmpl $0, %edx
          jge .L55
          movl $5, %eax
          jmp .ERROR_EXIT
.L55:
          addl $2, %edx
          pushl $4
          pushl %edx
          call calloc
          addl $8, %esp
          movl $vtable_Object, (%eax)
          movl %edx, 4(%eax)
          movl %eax, %esi
          popl %edi
          # Emitting this
          pushl %edx
          pushl %esi
          pushl %edi
          movl 8(%ebp), %ebx
          popl %edi
          popl %esi
          popl %edx
        cmpl $0, %ebx
        jne .L56
        movl $4, %eax
        jmp .ERROR_EXIT
.L56:
        movl %esi, 4(%ebx)
        popl %edi
        # Emitting k = new int[][(aga[7].m(...).k[4] + 4)]
        pushl %edx
        pushl %edi
# ________assign______________________________________________________
          # Emitting new int[][(aga[7].m(...).k[4] + 4)]
          pushl %edx
          pushl %edi
            # Emitting (aga[7].m(...).k[4] + 4)
            pushl %edx
            pushl %edi
              # Emitting aga[7].m(...).k[4]
              pushl %edx
              pushl %edi
                # Emitting aga[7].m(...).k
                pushl %edx
                pushl %edi
                  # Emitting aga[7].m(...)
                  pushl %edx
                  pushl %edi
                  pushl %edx
                    # Emitting aga[7]
                    pushl %edx
                    pushl %edi
                      # Emitting aga
                      pushl %edx
                      pushl %edi
# ______________________var___________________________________________
                      movl 8(%ebp), %esi
                      movl 8(%esi), %esi
                      popl %edi
                      popl %edx
                      # Emitting 7
                      pushl %edx
                      pushl %esi
                      pushl %edi
                      movl $7, %ebx
                      popl %edi
                      popl %esi
                      popl %edx
                    cmpl $0, %esi
                    jne .L57
                    movl $4, %eax
                    jmp .ERROR_EXIT
.L57:
                    cmpl $0, %ebx
                    jge .L58
                    movl $3, %eax
                    jmp .ERROR_EXIT
.L58:
                    cmpl 4(%esi), %ebx
                    jl .L59
                    movl $3, %eax
                    jmp .ERROR_EXIT
.L59:
                    imul $4, %ebx
                    addl $8, %ebx
                    addl %ebx, %esi
                    movl (%esi), %esi
                    popl %edi
                    popl %edx
                  cmpl $0, %esi
                  jne .L60
                  movl $4, %eax
                  jmp .ERROR_EXIT
.L60:
                  movl 0(%esi), %edx
                  movl 4(%edx), %edx
                  subl $4, %esp
                  pushl %esi
                  call %edx
                  addl $4, %esp
                  popl %edx
# __________________swap needed_______________________________________
                  movl %edx, %esi
                  popl %edi
                cmpl $0, %esi
                jne .L61
                movl $4, %eax
                jmp .ERROR_EXIT
.L61:
                movl 4(%esi), %esi
                popl %edi
                # Emitting 4
                pushl %esi
                pushl %edi
                movl $4, %edx
                popl %edi
                popl %esi
              cmpl $0, %esi
              jne .L62
              movl $4, %eax
              jmp .ERROR_EXIT
.L62:
              cmpl $0, %edx
              jge .L63
              movl $3, %eax
              jmp .ERROR_EXIT
.L63:
              cmpl 4(%esi), %edx
              jl .L64
              movl $3, %eax
              jmp .ERROR_EXIT
.L64:
              imul $4, %edx
              addl $8, %edx
              addl %edx, %esi
              movl (%esi), %esi
              popl %edi
              # Emitting 4
              pushl %esi
              pushl %edi
              movl $4, %edx
              popl %edi
              popl %esi
            add %edx, %esi
            popl %edi
          cmpl $0, %esi
          jge .L65
          movl $5, %eax
          jmp .ERROR_EXIT
.L65:
          addl $2, %esi
          pushl $4
          pushl %esi
          call calloc
          addl $8, %esp
          movl $vtable_Object, (%eax)
          movl %esi, 4(%eax)
          movl %eax, %edx
# __________swap needed_______________________________________________
          movl %edx, %ebx
          popl %edi
        movl 8(%ebp), %edx
        movl %ebx, 4(%edx)
        popl %edi
        # Emitting ret = new A()
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting new A()
          pushl %esi
          pushl %edi
# __________newObject_________________________________________________
          pushl $4
          pushl $4
          call calloc
          addl $8, %esp
          movl $vtable_A, (%eax)
          movl %eax, %ebx
          popl %edi
          popl %esi
        movl %ebx, -8(%ebp)
        popl %edi
        popl %esi
        # Emitting return ret
        pushl %esi
        pushl %edi
          # Emitting ret
          pushl %esi
          pushl %edi
# __________var_______________________________________________________
          movl -8(%ebp), %ebx
          popl %edi
          popl %esi
        movl %ebx, 12(%ebp)
        # restore old ebp
        movl %ebp, %esp
        popl %ebp
        ret
        popl %edi
        popl %esi
    addl $4, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    popl %edi
  popl %edi
