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
          movl 8(%ebp), %esi
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
          # Emitting this
          movl 8(%ebp), %edx
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
        # Emitting ab = this.arr[4]
# ________assign______________________________________________________
          # Emitting this.arr[4]
            # Emitting this.arr
              # Emitting this
              movl 8(%ebp), %esi
            cmpl $0, %esi
            jne .L5
            movl $4, %eax
            jmp .ERROR_EXIT
.L5:
            movl 4(%esi), %esi
            # Emitting 4
            movl $4, %edx
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
        movl %esi, -4(%ebp)
        # Emitting arr[+(((5 * 3) + 2))].aga[1].m(...)
          # Emitting arr[+(((5 * 3) + 2))].aga[1]
            # Emitting arr[+(((5 * 3) + 2))].aga
              # Emitting arr[+(((5 * 3) + 2))]
                # Emitting arr
# ________________var_________________________________________________
                movl 8(%ebp), %edx
                movl 4(%edx), %edx
                # Emitting +(((5 * 3) + 2))
                  # Emitting ((5 * 3) + 2)
                    # Emitting (5 * 3)
                      # Emitting 3
                      movl $3, %ecx
                      # Emitting 5
                      movl $5, %ebx
                    imul %ecx, %ebx
                    # Emitting 2
                    movl $2, %ecx
                  add %ecx, %ebx
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
            cmpl $0, %edx
            jne .L12
            movl $4, %eax
            jmp .ERROR_EXIT
.L12:
            movl 8(%edx), %edx
            # Emitting 1
            movl $1, %ebx
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
        # Emitting this.arr[4].aga[0].m(...).aga[2].aba.k[this.arr[3].aba.k[3]] = arr[3].m(...).aba.k[7]
# ________assign______________________________________________________
          # Emitting arr[3].m(...).aba.k[7]
            # Emitting arr[3].m(...).aba.k
              # Emitting arr[3].m(...).aba
                # Emitting arr[3].m(...)
                  # Emitting arr[3]
                    # Emitting arr
# ____________________var_____________________________________________
                    movl 8(%ebp), %edx
                    movl 4(%edx), %edx
                    # Emitting 3
                    movl $3, %ebx
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
              cmpl $0, %esi
              jne .L21
              movl $4, %eax
              jmp .ERROR_EXIT
.L21:
              movl 12(%esi), %esi
            cmpl $0, %esi
            jne .L22
            movl $4, %eax
            jmp .ERROR_EXIT
.L22:
            movl 4(%esi), %esi
            # Emitting 7
            movl $7, %edx
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
          # Emitting this.arr[4].aga[0].m(...).aga[2].aba.k
            # Emitting this.arr[4].aga[0].m(...).aga[2].aba
              # Emitting this.arr[4].aga[0].m(...).aga[2]
                # Emitting this.arr[4].aga[0].m(...).aga
                  # Emitting this.arr[4].aga[0].m(...)
                    # Emitting this.arr[4].aga[0]
                      # Emitting this.arr[4].aga
                        # Emitting this.arr[4]
                          # Emitting this.arr
                            # Emitting this
                            movl 8(%ebp), %ebx
                          cmpl $0, %ebx
                          jne .L26
                          movl $4, %eax
                          jmp .ERROR_EXIT
.L26:
                          movl 4(%ebx), %ebx
                          # Emitting 4
                          movl $4, %ecx
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
                      cmpl $0, %ebx
                      jne .L30
                      movl $4, %eax
                      jmp .ERROR_EXIT
.L30:
                      movl 8(%ebx), %ebx
                      # Emitting 0
                      movl $0, %ecx
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
                cmpl $0, %edx
                jne .L35
                movl $4, %eax
                jmp .ERROR_EXIT
.L35:
                movl 8(%edx), %edx
                # Emitting 2
                movl $2, %ebx
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
            cmpl $0, %edx
            jne .L39
            movl $4, %eax
            jmp .ERROR_EXIT
.L39:
            movl 12(%edx), %edx
          cmpl $0, %edx
          jne .L40
          movl $4, %eax
          jmp .ERROR_EXIT
.L40:
          movl 4(%edx), %edx
          # Emitting this.arr[3].aba.k[3]
            # Emitting this.arr[3].aba.k
              # Emitting this.arr[3].aba
                # Emitting this.arr[3]
                  # Emitting this.arr
                    # Emitting this
                    movl 8(%ebp), %ebx
                  cmpl $0, %ebx
                  jne .L41
                  movl $4, %eax
                  jmp .ERROR_EXIT
.L41:
                  movl 4(%ebx), %ebx
                  # Emitting 3
                  movl $3, %ecx
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
              cmpl $0, %ebx
              jne .L45
              movl $4, %eax
              jmp .ERROR_EXIT
.L45:
              movl 12(%ebx), %ebx
            cmpl $0, %ebx
            jne .L46
            movl $4, %eax
            jmp .ERROR_EXIT
.L46:
            movl 4(%ebx), %ebx
            # Emitting 3
            movl $3, %ecx
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
    addl $4, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
  # Emitting class A {...}
    # Emitting int[] k
    # Emitting A[] aga
    # Emitting A aba
    # Emitting A m(...) {...}
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
          movl 8(%ebp), %edx
        cmpl $0, %edx
        jne .L54
        movl $4, %eax
        jmp .ERROR_EXIT
.L54:
        movl %esi, 8(%edx)
        # Emitting this.k = new int[][(4 + 5)]
# ________assign______________________________________________________
          # Emitting new int[][(4 + 5)]
            # Emitting (4 + 5)
              # Emitting 5
              movl $5, %esi
              # Emitting 4
              movl $4, %edx
            add %esi, %edx
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
          # Emitting this
          movl 8(%ebp), %ebx
        cmpl $0, %ebx
        jne .L56
        movl $4, %eax
        jmp .ERROR_EXIT
.L56:
        movl %esi, 4(%ebx)
        # Emitting k = new int[][(aga[7].m(...).k[4] + 4)]
# ________assign______________________________________________________
          # Emitting new int[][(aga[7].m(...).k[4] + 4)]
            # Emitting (aga[7].m(...).k[4] + 4)
              # Emitting aga[7].m(...).k[4]
                # Emitting aga[7].m(...).k
                  # Emitting aga[7].m(...)
                  pushl %edx
                    # Emitting aga[7]
                      # Emitting aga
# ______________________var___________________________________________
                      movl 8(%ebp), %esi
                      movl 8(%esi), %esi
                      # Emitting 7
                      movl $7, %ebx
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
                cmpl $0, %edx
                jne .L61
                movl $4, %eax
                jmp .ERROR_EXIT
.L61:
                movl 4(%edx), %edx
                # Emitting 4
                movl $4, %esi
              cmpl $0, %edx
              jne .L62
              movl $4, %eax
              jmp .ERROR_EXIT
.L62:
              cmpl $0, %esi
              jge .L63
              movl $3, %eax
              jmp .ERROR_EXIT
.L63:
              cmpl 4(%edx), %esi
              jl .L64
              movl $3, %eax
              jmp .ERROR_EXIT
.L64:
              imul $4, %esi
              addl $8, %esi
              addl %esi, %edx
              movl (%edx), %edx
              # Emitting 4
              movl $4, %esi
            add %esi, %edx
          cmpl $0, %edx
          jge .L65
          movl $5, %eax
          jmp .ERROR_EXIT
.L65:
          addl $2, %edx
          pushl $4
          pushl %edx
          call calloc
          addl $8, %esp
          movl $vtable_Object, (%eax)
          movl %edx, 4(%eax)
          movl %eax, %esi
        movl 8(%ebp), %ebx
        movl %esi, 4(%ebx)
        # Emitting ret = new A()
# ________assign______________________________________________________
          # Emitting new A()
# __________newObject_________________________________________________
          pushl $4
          pushl $4
          call calloc
          addl $8, %esp
          movl $vtable_A, (%eax)
          movl %eax, %esi
        movl %esi, -8(%ebp)
        # Emitting return ret
          # Emitting ret
# __________var_______________________________________________________
          movl -8(%ebp), %esi
        movl %esi, 12(%ebp)
    addl $4, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret