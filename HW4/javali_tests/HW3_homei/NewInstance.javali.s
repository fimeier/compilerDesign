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
          # Emitting this.k(...)
            # Emitting this
            pushl $0
            pushl %edi
            movl 8(%ebp), %edi
# ____________swap needed_____________________________________________
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
          subl $2, %edi
          movl %edi, 4(%eax)
          movl %eax, %esi
        movl 8(%ebp), %edi
        movl %esi, 4(%edi)
        # Emitting this.k(...)
          # Emitting this.k(...)
            # Emitting this
            pushl $0
            pushl %esi
            movl 8(%ebp), %esi
# ____________swap needed_____________________________________________
            movl %esi, 4(%esp)
            popl %esi
            popl %edi
          cmpl $0, %edi
          jne .L4
          movl $4, %eax
          jmp .ERROR_EXIT
.L4:
          movl 0(%edi), %esi
          movl 4(%esi), %esi
          subl $4, %esp
          pushl %edi
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
            pushl $0
            pushl %esi
            movl $4, %esi
# ____________swap needed_____________________________________________
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
        movl %esi, -4(%ebp)
        # Emitting arr[+(((5 * 3) + 2))].aga[1].m(...)
          # Emitting arr[+(((5 * 3) + 2))].aga[1].m(...)
            # Emitting arr[+(((5 * 3) + 2))].aga[1]
            pushl $0
            pushl %esi
              # Emitting arr[+(((5 * 3) + 2))].aga
                # Emitting arr[+(((5 * 3) + 2))]
                  # Emitting arr
# __________________var_______________________________________________
                  movl 8(%ebp), %esi
                  movl 4(%esi), %esi
                  # Emitting +(((5 * 3) + 2))
                  pushl $0
                  pushl %esi
                    # Emitting ((5 * 3) + 2)
                      # Emitting (5 * 3)
                        # Emitting 3
                        movl $3, %esi
                        # Emitting 5
                        pushl $0
                        pushl %esi
                        movl $5, %esi
# ________________________swap needed_________________________________
                        movl %esi, 4(%esp)
                        popl %esi
                        popl %edi
                      imul %esi, %edi
                      # Emitting 2
                      pushl $0
                      pushl %edi
                      movl $2, %edi
# ______________________swap needed___________________________________
                      movl %edi, 4(%esp)
                      popl %edi
                      popl %esi
                    add %esi, %edi
                  popl %esi
                  addl $4, %esp
                cmpl $0, %esi
                jne .L9
                movl $4, %eax
                jmp .ERROR_EXIT
.L9:
                cmpl $0, %edi
                jge .L10
                movl $3, %eax
                jmp .ERROR_EXIT
.L10:
                cmpl 4(%esi), %edi
                jl .L11
                movl $3, %eax
                jmp .ERROR_EXIT
.L11:
                imul $4, %edi
                addl $8, %edi
                addl %edi, %esi
                movl (%esi), %esi
              cmpl $0, %esi
              jne .L12
              movl $4, %eax
              jmp .ERROR_EXIT
.L12:
              movl 8(%esi), %esi
              # Emitting 1
              pushl $0
              pushl %esi
              movl $1, %esi
# ______________swap needed___________________________________________
              movl %esi, 4(%esp)
              popl %esi
              popl %edi
            cmpl $0, %esi
            jne .L13
            movl $4, %eax
            jmp .ERROR_EXIT
.L13:
            cmpl $0, %edi
            jge .L14
            movl $3, %eax
            jmp .ERROR_EXIT
.L14:
            cmpl 4(%esi), %edi
            jl .L15
            movl $3, %eax
            jmp .ERROR_EXIT
.L15:
            imul $4, %edi
            addl $8, %edi
            addl %edi, %esi
            movl (%esi), %esi
# ____________swap needed_____________________________________________
            movl %esi, 4(%esp)
            popl %esi
            popl %edi
          cmpl $0, %edi
          jne .L16
          movl $4, %eax
          jmp .ERROR_EXIT
.L16:
          movl 0(%edi), %esi
          movl 4(%esi), %esi
          subl $4, %esp
          pushl %edi
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
                  pushl $0
                  pushl %esi
                    # Emitting arr
# ____________________var_____________________________________________
                    movl 8(%ebp), %esi
                    movl 4(%esi), %esi
                    # Emitting 3
                    pushl $0
                    pushl %esi
                    movl $3, %esi
# ____________________swap needed_____________________________________
                    movl %esi, 4(%esp)
                    popl %esi
                    popl %edi
                  cmpl $0, %esi
                  jne .L17
                  movl $4, %eax
                  jmp .ERROR_EXIT
.L17:
                  cmpl $0, %edi
                  jge .L18
                  movl $3, %eax
                  jmp .ERROR_EXIT
.L18:
                  cmpl 4(%esi), %edi
                  jl .L19
                  movl $3, %eax
                  jmp .ERROR_EXIT
.L19:
                  imul $4, %edi
                  addl $8, %edi
                  addl %edi, %esi
                  movl (%esi), %esi
# __________________swap needed_______________________________________
                  movl %esi, 4(%esp)
                  popl %esi
                  popl %edi
                cmpl $0, %edi
                jne .L20
                movl $4, %eax
                jmp .ERROR_EXIT
.L20:
                movl 0(%edi), %esi
                movl 4(%esi), %esi
                subl $4, %esp
                pushl %edi
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
            pushl $0
            pushl %esi
            movl $7, %esi
# ____________swap needed_____________________________________________
            movl %esi, 4(%esp)
            popl %esi
            popl %edi
          cmpl $0, %esi
          jne .L23
          movl $4, %eax
          jmp .ERROR_EXIT
.L23:
          cmpl $0, %edi
          jge .L24
          movl $3, %eax
          jmp .ERROR_EXIT
.L24:
          cmpl 4(%esi), %edi
          jl .L25
          movl $3, %eax
          jmp .ERROR_EXIT
.L25:
          imul $4, %edi
          addl $8, %edi
          addl %edi, %esi
          movl (%esi), %esi
          # Emitting this.arr[4].aga[0].m(...).aga[2].aba.k
          pushl $0
          pushl %esi
            # Emitting this.arr[4].aga[0].m(...).aga[2].aba
              # Emitting this.arr[4].aga[0].m(...).aga[2]
                # Emitting this.arr[4].aga[0].m(...).aga
                  # Emitting this.arr[4].aga[0].m(...)
                    # Emitting this.arr[4].aga[0]
                    pushl $0
                    pushl %esi
                      # Emitting this.arr[4].aga
                        # Emitting this.arr[4]
                          # Emitting this.arr
                            # Emitting this
                            movl 8(%ebp), %esi
                          cmpl $0, %esi
                          jne .L26
                          movl $4, %eax
                          jmp .ERROR_EXIT
.L26:
                          movl 4(%esi), %esi
                          # Emitting 4
                          pushl $0
                          pushl %esi
                          movl $4, %esi
# __________________________swap needed_______________________________
                          movl %esi, 4(%esp)
                          popl %esi
                          popl %edi
                        cmpl $0, %esi
                        jne .L27
                        movl $4, %eax
                        jmp .ERROR_EXIT
.L27:
                        cmpl $0, %edi
                        jge .L28
                        movl $3, %eax
                        jmp .ERROR_EXIT
.L28:
                        cmpl 4(%esi), %edi
                        jl .L29
                        movl $3, %eax
                        jmp .ERROR_EXIT
.L29:
                        imul $4, %edi
                        addl $8, %edi
                        addl %edi, %esi
                        movl (%esi), %esi
                      cmpl $0, %esi
                      jne .L30
                      movl $4, %eax
                      jmp .ERROR_EXIT
.L30:
                      movl 8(%esi), %esi
                      # Emitting 0
                      pushl $0
                      pushl %esi
                      movl $0, %esi
# ______________________swap needed___________________________________
                      movl %esi, 4(%esp)
                      popl %esi
                      popl %edi
                    cmpl $0, %esi
                    jne .L31
                    movl $4, %eax
                    jmp .ERROR_EXIT
.L31:
                    cmpl $0, %edi
                    jge .L32
                    movl $3, %eax
                    jmp .ERROR_EXIT
.L32:
                    cmpl 4(%esi), %edi
                    jl .L33
                    movl $3, %eax
                    jmp .ERROR_EXIT
.L33:
                    imul $4, %edi
                    addl $8, %edi
                    addl %edi, %esi
                    movl (%esi), %esi
# ____________________swap needed_____________________________________
                    movl %esi, 4(%esp)
                    popl %esi
                    popl %edi
                  cmpl $0, %edi
                  jne .L34
                  movl $4, %eax
                  jmp .ERROR_EXIT
.L34:
                  movl 0(%edi), %esi
                  movl 4(%esi), %esi
                  subl $4, %esp
                  pushl %edi
                  call %esi
                  addl $4, %esp
                  popl %esi
                cmpl $0, %esi
                jne .L35
                movl $4, %eax
                jmp .ERROR_EXIT
.L35:
                movl 8(%esi), %esi
                # Emitting 2
                pushl $0
                pushl %esi
                movl $2, %esi
# ________________swap needed_________________________________________
                movl %esi, 4(%esp)
                popl %esi
                popl %edi
              cmpl $0, %esi
              jne .L36
              movl $4, %eax
              jmp .ERROR_EXIT
.L36:
              cmpl $0, %edi
              jge .L37
              movl $3, %eax
              jmp .ERROR_EXIT
.L37:
              cmpl 4(%esi), %edi
              jl .L38
              movl $3, %eax
              jmp .ERROR_EXIT
.L38:
              imul $4, %edi
              addl $8, %edi
              addl %edi, %esi
              movl (%esi), %esi
            cmpl $0, %esi
            jne .L39
            movl $4, %eax
            jmp .ERROR_EXIT
.L39:
            movl 12(%esi), %esi
          cmpl $0, %esi
          jne .L40
          movl $4, %eax
          jmp .ERROR_EXIT
.L40:
          movl 4(%esi), %esi
# __________swap needed_______________________________________________
          movl %esi, 4(%esp)
          popl %esi
          popl %edi
          # Emitting this.arr[3].aba.k[3]
          pushl $0
          pushl %esi
          pushl %edi
            # Emitting this.arr[3].aba.k
              # Emitting this.arr[3].aba
                # Emitting this.arr[3]
                  # Emitting this.arr
                    # Emitting this
                    movl 8(%ebp), %edi
                  cmpl $0, %edi
                  jne .L41
                  movl $4, %eax
                  jmp .ERROR_EXIT
.L41:
                  movl 4(%edi), %edi
                  # Emitting 3
                  pushl $0
                  pushl %edi
                  movl $3, %edi
# __________________swap needed_______________________________________
                  movl %edi, 4(%esp)
                  popl %edi
                  popl %esi
                cmpl $0, %edi
                jne .L42
                movl $4, %eax
                jmp .ERROR_EXIT
.L42:
                cmpl $0, %esi
                jge .L43
                movl $3, %eax
                jmp .ERROR_EXIT
.L43:
                cmpl 4(%edi), %esi
                jl .L44
                movl $3, %eax
                jmp .ERROR_EXIT
.L44:
                imul $4, %esi
                addl $8, %esi
                addl %esi, %edi
                movl (%edi), %edi
              cmpl $0, %edi
              jne .L45
              movl $4, %eax
              jmp .ERROR_EXIT
.L45:
              movl 12(%edi), %edi
            cmpl $0, %edi
            jne .L46
            movl $4, %eax
            jmp .ERROR_EXIT
.L46:
            movl 4(%edi), %edi
            # Emitting 3
            pushl $0
            pushl %edi
            movl $3, %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          cmpl $0, %edi
          jne .L47
          movl $4, %eax
          jmp .ERROR_EXIT
.L47:
          cmpl $0, %esi
          jge .L48
          movl $3, %eax
          jmp .ERROR_EXIT
.L48:
          cmpl 4(%edi), %esi
          jl .L49
          movl $3, %eax
          jmp .ERROR_EXIT
.L49:
          imul $4, %esi
          addl $8, %esi
          addl %esi, %edi
          movl (%edi), %edi
# __________swap needed_______________________________________________
          movl %edi, 8(%esp)
          popl %edi
          popl %esi
          popl %edx
        cmpl $0, %edi
        jne .L50
        movl $4, %eax
        jmp .ERROR_EXIT
.L50:
        cmpl $0, %edx
        jge .L51
        movl $3, %eax
        jmp .ERROR_EXIT
.L51:
        cmpl 4(%edi), %edx
        jl .L52
        movl $3, %eax
        jmp .ERROR_EXIT
.L52:
        imul $4, %edx
        addl $8, %edx
        addl %edx, %edi
        movl %esi, (%edi)
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
    # set local variables:
    # variable ret
    pushl $0
      # Emitting (...)
        # Emitting this.aga = new A[][50]
# ________assign______________________________________________________
          # Emitting new A[][50]
            # Emitting 50
            movl $50, %esi
          cmpl $0, %esi
          jge .L53
          movl $5, %eax
          jmp .ERROR_EXIT
.L53:
          addl $2, %esi
          pushl $4
          pushl %esi
          call calloc
          addl $8, %esp
          movl $vtable_Object, (%eax)
          subl $2, %esi
          movl %esi, 4(%eax)
          movl %eax, %edi
          # Emitting this
          pushl $0
          pushl %edi
          movl 8(%ebp), %edi
# __________swap needed_______________________________________________
          movl %edi, 4(%esp)
          popl %edi
          popl %esi
        cmpl $0, %esi
        jne .L54
        movl $4, %eax
        jmp .ERROR_EXIT
.L54:
        movl %edi, 8(%esi)
        # Emitting this.k = new int[][(4 + 5)]
# ________assign______________________________________________________
          # Emitting new int[][(4 + 5)]
            # Emitting (4 + 5)
              # Emitting 5
              movl $5, %edi
              # Emitting 4
              pushl $0
              pushl %edi
              movl $4, %edi
# ______________swap needed___________________________________________
              movl %edi, 4(%esp)
              popl %edi
              popl %esi
            add %edi, %esi
          cmpl $0, %esi
          jge .L55
          movl $5, %eax
          jmp .ERROR_EXIT
.L55:
          addl $2, %esi
          pushl $4
          pushl %esi
          call calloc
          addl $8, %esp
          movl $vtable_Object, (%eax)
          subl $2, %esi
          movl %esi, 4(%eax)
          movl %eax, %edi
          # Emitting this
          pushl $0
          pushl %edi
          movl 8(%ebp), %edi
# __________swap needed_______________________________________________
          movl %edi, 4(%esp)
          popl %edi
          popl %esi
        cmpl $0, %esi
        jne .L56
        movl $4, %eax
        jmp .ERROR_EXIT
.L56:
        movl %edi, 4(%esi)
        # Emitting k = new int[][(aga[7].m(...).k[4] + 4)]
# ________assign______________________________________________________
          # Emitting new int[][(aga[7].m(...).k[4] + 4)]
            # Emitting (aga[7].m(...).k[4] + 4)
              # Emitting aga[7].m(...).k[4]
                # Emitting aga[7].m(...).k
                  # Emitting aga[7].m(...)
                    # Emitting aga[7]
                    pushl $0
                    pushl %edi
                      # Emitting aga
# ______________________var___________________________________________
                      movl 8(%ebp), %edi
                      movl 8(%edi), %edi
                      # Emitting 7
                      pushl $0
                      pushl %edi
                      movl $7, %edi
# ______________________swap needed___________________________________
                      movl %edi, 4(%esp)
                      popl %edi
                      popl %esi
                    cmpl $0, %edi
                    jne .L57
                    movl $4, %eax
                    jmp .ERROR_EXIT
.L57:
                    cmpl $0, %esi
                    jge .L58
                    movl $3, %eax
                    jmp .ERROR_EXIT
.L58:
                    cmpl 4(%edi), %esi
                    jl .L59
                    movl $3, %eax
                    jmp .ERROR_EXIT
.L59:
                    imul $4, %esi
                    addl $8, %esi
                    addl %esi, %edi
                    movl (%edi), %edi
# ____________________swap needed_____________________________________
                    movl %edi, 4(%esp)
                    popl %edi
                    popl %esi
                  cmpl $0, %esi
                  jne .L60
                  movl $4, %eax
                  jmp .ERROR_EXIT
.L60:
                  movl 0(%esi), %edi
                  movl 4(%edi), %edi
                  subl $4, %esp
                  pushl %esi
                  call %edi
                  addl $4, %esp
                  popl %edi
                cmpl $0, %edi
                jne .L61
                movl $4, %eax
                jmp .ERROR_EXIT
.L61:
                movl 4(%edi), %edi
                # Emitting 4
                pushl $0
                pushl %edi
                movl $4, %edi
# ________________swap needed_________________________________________
                movl %edi, 4(%esp)
                popl %edi
                popl %esi
              cmpl $0, %edi
              jne .L62
              movl $4, %eax
              jmp .ERROR_EXIT
.L62:
              cmpl $0, %esi
              jge .L63
              movl $3, %eax
              jmp .ERROR_EXIT
.L63:
              cmpl 4(%edi), %esi
              jl .L64
              movl $3, %eax
              jmp .ERROR_EXIT
.L64:
              imul $4, %esi
              addl $8, %esi
              addl %esi, %edi
              movl (%edi), %edi
              # Emitting 4
              pushl $0
              pushl %edi
              movl $4, %edi
# ______________swap needed___________________________________________
              movl %edi, 4(%esp)
              popl %edi
              popl %esi
            add %esi, %edi
          cmpl $0, %edi
          jge .L65
          movl $5, %eax
          jmp .ERROR_EXIT
.L65:
          addl $2, %edi
          pushl $4
          pushl %edi
          call calloc
          addl $8, %esp
          movl $vtable_Object, (%eax)
          subl $2, %edi
          movl %edi, 4(%eax)
          movl %eax, %esi
        movl 8(%ebp), %edi
        movl %esi, 4(%edi)
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
        movl %esi, -4(%ebp)
        # Emitting return ret
          # Emitting ret
# __________var_______________________________________________________
          movl -4(%ebp), %esi
        movl %esi, 12(%ebp)
        # restore old ebp
        movl %ebp, %esp
        popl %ebp
        ret
    addl $4, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
