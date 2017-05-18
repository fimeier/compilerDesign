.section .data
	vtable_Main_array:
		.int vtable_Object
	vtable_int_array:
		.int vtable_Object
	vtable_Record_array:
		.int vtable_Object
	vtable_Object:
		.int 0
	vtable_Record:
		.int vtable_Object
		.int Record_print
	vtable_Main:
		.int vtable_Object
		.int Main_swap
		.int Main_sort
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
pushl $3
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
  # Emitting class Record {...}
    # Emitting int a
    # Emitting void print(...) {...}
Record_print:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting write(a)
          # Emitting a
# __________var_______________________________________________________
          movl 8(%ebp), %edi
          movl 4(%edi), %edi
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
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
  # Emitting class Main {...}
    # Emitting Record[] a
    # Emitting int i
    # Emitting void swap(...) {...}
Main_swap:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    # variable temp
    pushl $0
      # Emitting (...)
        # Emitting temp = r1.a
# ________assign______________________________________________________
          # Emitting r1.a
            # Emitting r1
# ____________var_____________________________________________________
            movl 12(%ebp), %edi
          cmpl $0, %edi
          jne .L2
          movl $4, %eax
          jmp .ERROR_EXIT
.L2:
          movl 4(%edi), %edi
        movl %edi, -4(%ebp)
        # Emitting r1.a = r2.a
# ________assign______________________________________________________
          # Emitting r2.a
            # Emitting r2
# ____________var_____________________________________________________
            movl 16(%ebp), %edi
          cmpl $0, %edi
          jne .L3
          movl $4, %eax
          jmp .ERROR_EXIT
.L3:
          movl 4(%edi), %edi
          # Emitting r1
          pushl $0
          pushl %edi
# __________var_______________________________________________________
          movl 12(%ebp), %edi
# __________swap needed_______________________________________________
          movl %edi, 4(%esp)
          popl %edi
          popl %esi
        cmpl $0, %esi
        jne .L4
        movl $4, %eax
        jmp .ERROR_EXIT
.L4:
        movl %edi, 4(%esi)
        # Emitting r2.a = temp
# ________assign______________________________________________________
          # Emitting temp
# __________var_______________________________________________________
          movl -4(%ebp), %edi
          # Emitting r2
          pushl $0
          pushl %edi
# __________var_______________________________________________________
          movl 16(%ebp), %edi
# __________swap needed_______________________________________________
          movl %edi, 4(%esp)
          popl %edi
          popl %esi
        cmpl $0, %esi
        jne .L5
        movl $4, %eax
        jmp .ERROR_EXIT
.L5:
        movl %edi, 4(%esi)
    addl $4, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    # Emitting void sort(...) {...}
Main_sort:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    # variable i
    pushl $0
    # variable j
    pushl $0
    # variable m
    pushl $0
      # Emitting (...)
        # Emitting m = ((a[left].a + a[right].a) / 2)
# ________assign______________________________________________________
          # Emitting ((a[left].a + a[right].a) / 2)
            # Emitting (a[left].a + a[right].a)
              # Emitting a[right].a
                # Emitting a[right]
                  # Emitting a
# __________________var_______________________________________________
                  movl 8(%ebp), %edi
                  movl 4(%edi), %edi
                  # Emitting right
                  pushl $0
                  pushl %edi
# __________________var_______________________________________________
                  movl 16(%ebp), %edi
# __________________swap needed_______________________________________
                  movl %edi, 4(%esp)
                  popl %edi
                  popl %esi
                cmpl $0, %edi
                jne .L6
                movl $4, %eax
                jmp .ERROR_EXIT
.L6:
                cmpl $0, %esi
                jge .L7
                movl $3, %eax
                jmp .ERROR_EXIT
.L7:
                cmpl 4(%edi), %esi
                jl .L8
                movl $3, %eax
                jmp .ERROR_EXIT
.L8:
                imul $4, %esi
                addl $8, %esi
                addl %esi, %edi
                movl (%edi), %edi
              cmpl $0, %edi
              jne .L9
              movl $4, %eax
              jmp .ERROR_EXIT
.L9:
              movl 4(%edi), %edi
              # Emitting a[left].a
              pushl $0
              pushl %edi
                # Emitting a[left]
                  # Emitting a
# __________________var_______________________________________________
                  movl 8(%ebp), %edi
                  movl 4(%edi), %edi
                  # Emitting left
                  pushl $0
                  pushl %edi
# __________________var_______________________________________________
                  movl 12(%ebp), %edi
# __________________swap needed_______________________________________
                  movl %edi, 4(%esp)
                  popl %edi
                  popl %esi
                cmpl $0, %edi
                jne .L10
                movl $4, %eax
                jmp .ERROR_EXIT
.L10:
                cmpl $0, %esi
                jge .L11
                movl $3, %eax
                jmp .ERROR_EXIT
.L11:
                cmpl 4(%edi), %esi
                jl .L12
                movl $3, %eax
                jmp .ERROR_EXIT
.L12:
                imul $4, %esi
                addl $8, %esi
                addl %esi, %edi
                movl (%edi), %edi
              cmpl $0, %edi
              jne .L13
              movl $4, %eax
              jmp .ERROR_EXIT
.L13:
              movl 4(%edi), %edi
# ______________swap needed___________________________________________
              movl %edi, 4(%esp)
              popl %edi
              popl %esi
            add %edi, %esi
            # Emitting 2
            pushl $0
            pushl %esi
            movl $2, %esi
# ____________swap needed_____________________________________________
            movl %esi, 4(%esp)
            popl %esi
            popl %edi
          cmpl $0, %edi
          jne .L14
          movl $7, %eax
          jmp .ERROR_EXIT
.L14:
          pushl %edi
          pushl %esi
          popl %eax
          popl %ebx
          cltd
          idivl %ebx
          movl %eax, %esi
        movl %esi, -12(%ebp)
        # Emitting i = left
# ________assign______________________________________________________
          # Emitting left
# __________var_______________________________________________________
          movl 12(%ebp), %esi
        movl %esi, -4(%ebp)
        # Emitting j = right
# ________assign______________________________________________________
          # Emitting right
# __________var_______________________________________________________
          movl 16(%ebp), %esi
        movl %esi, -8(%ebp)
        # Emitting while ((i <= j)) {...}
# ________whileLoop___________________________________________________
.L15:
          # Emitting (i <= j)
            # Emitting j
# ____________var_____________________________________________________
            movl -8(%ebp), %esi
            # Emitting i
            pushl $0
            pushl %esi
# ____________var_____________________________________________________
            movl -4(%ebp), %esi
# ____________swap needed_____________________________________________
            movl %esi, 4(%esp)
            popl %esi
            popl %edi
          cmpl %esi, %edi
          setle %al
          movzbl %al, %edi
        jg .L16
          # Emitting (...)
            # Emitting while ((a[i].a < m)) {...}
# ____________whileLoop_______________________________________________
.L18:
              # Emitting (a[i].a < m)
                # Emitting a[i].a
                  # Emitting a[i]
                    # Emitting a
# ____________________var_____________________________________________
                    movl 8(%ebp), %edi
                    movl 4(%edi), %edi
                    # Emitting i
                    pushl $0
                    pushl %edi
# ____________________var_____________________________________________
                    movl -4(%ebp), %edi
# ____________________swap needed_____________________________________
                    movl %edi, 4(%esp)
                    popl %edi
                    popl %esi
                  cmpl $0, %edi
                  jne .L19
                  movl $4, %eax
                  jmp .ERROR_EXIT
.L19:
                  cmpl $0, %esi
                  jge .L20
                  movl $3, %eax
                  jmp .ERROR_EXIT
.L20:
                  cmpl 4(%edi), %esi
                  jl .L21
                  movl $3, %eax
                  jmp .ERROR_EXIT
.L21:
                  imul $4, %esi
                  addl $8, %esi
                  addl %esi, %edi
                  movl (%edi), %edi
                cmpl $0, %edi
                jne .L22
                movl $4, %eax
                jmp .ERROR_EXIT
.L22:
                movl 4(%edi), %edi
                # Emitting m
                pushl $0
                pushl %edi
# ________________var_________________________________________________
                movl -12(%ebp), %edi
# ________________swap needed_________________________________________
                movl %edi, 4(%esp)
                popl %edi
                popl %esi
              cmpl %esi, %edi
              setl %al
              movzbl %al, %edi
            jge .L23
              # Emitting (...)
                # Emitting i = (i + 1)
# ________________assign______________________________________________
                  # Emitting (i + 1)
                    # Emitting 1
                    movl $1, %edi
                    # Emitting i
                    pushl $0
                    pushl %edi
# ____________________var_____________________________________________
                    movl -4(%ebp), %edi
# ____________________swap needed_____________________________________
                    movl %edi, 4(%esp)
                    popl %edi
                    popl %esi
                  add %edi, %esi
                movl %esi, -4(%ebp)
            jmp .L18
.L23:
.L24:
            # Emitting while ((a[j].a > m)) {...}
# ____________whileLoop_______________________________________________
.L25:
              # Emitting (a[j].a > m)
                # Emitting a[j].a
                  # Emitting a[j]
                    # Emitting a
# ____________________var_____________________________________________
                    movl 8(%ebp), %esi
                    movl 4(%esi), %esi
                    # Emitting j
                    pushl $0
                    pushl %esi
# ____________________var_____________________________________________
                    movl -8(%ebp), %esi
# ____________________swap needed_____________________________________
                    movl %esi, 4(%esp)
                    popl %esi
                    popl %edi
                  cmpl $0, %esi
                  jne .L26
                  movl $4, %eax
                  jmp .ERROR_EXIT
.L26:
                  cmpl $0, %edi
                  jge .L27
                  movl $3, %eax
                  jmp .ERROR_EXIT
.L27:
                  cmpl 4(%esi), %edi
                  jl .L28
                  movl $3, %eax
                  jmp .ERROR_EXIT
.L28:
                  imul $4, %edi
                  addl $8, %edi
                  addl %edi, %esi
                  movl (%esi), %esi
                cmpl $0, %esi
                jne .L29
                movl $4, %eax
                jmp .ERROR_EXIT
.L29:
                movl 4(%esi), %esi
                # Emitting m
                pushl $0
                pushl %esi
# ________________var_________________________________________________
                movl -12(%ebp), %esi
# ________________swap needed_________________________________________
                movl %esi, 4(%esp)
                popl %esi
                popl %edi
              cmpl %edi, %esi
              setg %al
              movzbl %al, %esi
            jle .L30
              # Emitting (...)
                # Emitting j = (j - 1)
# ________________assign______________________________________________
                  # Emitting (j - 1)
                    # Emitting 1
                    movl $1, %esi
                    # Emitting j
                    pushl $0
                    pushl %esi
# ____________________var_____________________________________________
                    movl -8(%ebp), %esi
# ____________________swap needed_____________________________________
                    movl %esi, 4(%esp)
                    popl %esi
                    popl %edi
                  sub %esi, %edi
                movl %edi, -8(%ebp)
            jmp .L25
.L30:
.L31:
            # Emitting if ((i <= j)) {...} else {...}
# ____________ifElse__________________________________________________
              # Emitting (i <= j)
                # Emitting j
# ________________var_________________________________________________
                movl -8(%ebp), %edi
                # Emitting i
                pushl $0
                pushl %edi
# ________________var_________________________________________________
                movl -4(%ebp), %edi
# ________________swap needed_________________________________________
                movl %edi, 4(%esp)
                popl %edi
                popl %esi
              cmpl %edi, %esi
              setle %al
              movzbl %al, %esi
            jg .L33
              # Emitting (...)
                # Emitting this.swap(...)
                  # Emitting this
                  pushl $0
                  pushl %esi
                  movl 8(%ebp), %esi
# __________________swap needed_______________________________________
                  movl %esi, 4(%esp)
                  popl %esi
                  popl %edi
                cmpl $0, %edi
                jne .L35
                movl $4, %eax
                jmp .ERROR_EXIT
.L35:
                movl 0(%edi), %esi
                movl 4(%esi), %esi
                subl $4, %esp
                  # Emitting a[j]
                  pushl $0
                  pushl %edx
                  pushl %esi
                  pushl %edi
                    # Emitting a
# ____________________var_____________________________________________
                    movl 8(%ebp), %edi
                    movl 4(%edi), %edi
                    # Emitting j
                    pushl $0
                    pushl %edi
# ____________________var_____________________________________________
                    movl -8(%ebp), %edi
# ____________________swap needed_____________________________________
                    movl %edi, 4(%esp)
                    popl %edi
                    popl %esi
                  cmpl $0, %edi
                  jne .L36
                  movl $4, %eax
                  jmp .ERROR_EXIT
.L36:
                  cmpl $0, %esi
                  jge .L37
                  movl $3, %eax
                  jmp .ERROR_EXIT
.L37:
                  cmpl 4(%edi), %esi
                  jl .L38
                  movl $3, %eax
                  jmp .ERROR_EXIT
.L38:
                  imul $4, %esi
                  addl $8, %esi
                  addl %esi, %edi
                  movl (%edi), %edi
# __________________swap needed_______________________________________
                  movl %edi, 12(%esp)
                  popl %edi
                  popl %esi
                  popl %edx
                  popl %ecx
                pushl %ecx
                  # Emitting a[i]
                  pushl $0
                  pushl %ecx
                  pushl %edx
                  pushl %esi
                  pushl %edi
                    # Emitting a
# ____________________var_____________________________________________
                    movl 8(%ebp), %edi
                    movl 4(%edi), %edi
                    # Emitting i
                    pushl $0
                    pushl %edi
# ____________________var_____________________________________________
                    movl -4(%ebp), %edi
# ____________________swap needed_____________________________________
                    movl %edi, 4(%esp)
                    popl %edi
                    popl %esi
                  cmpl $0, %edi
                  jne .L39
                  movl $4, %eax
                  jmp .ERROR_EXIT
.L39:
                  cmpl $0, %esi
                  jge .L40
                  movl $3, %eax
                  jmp .ERROR_EXIT
.L40:
                  cmpl 4(%edi), %esi
                  jl .L41
                  movl $3, %eax
                  jmp .ERROR_EXIT
.L41:
                  imul $4, %esi
                  addl $8, %esi
                  addl %esi, %edi
                  movl (%edi), %edi
# __________________swap needed_______________________________________
                  movl %edi, 16(%esp)
                  popl %edi
                  popl %esi
                  popl %edx
                  popl %ecx
                  popl %ebx
                pushl %ebx
                pushl %edi
                call %esi
                addl $12, %esp
                popl %esi
                # Emitting i = (i + 1)
                pushl $0
                pushl %ecx
                pushl %edx
# ________________assign______________________________________________
                  # Emitting (i + 1)
                    # Emitting 1
                    movl $1, %edx
                    # Emitting i
                    pushl $0
                    pushl %edx
# ____________________var_____________________________________________
                    movl -4(%ebp), %edx
# ____________________swap needed_____________________________________
                    movl %edx, 4(%esp)
                    popl %edx
                    popl %ecx
                  add %edx, %ecx
                movl %ecx, -4(%ebp)
# ________________NO swap needed______________________________________
                popl %edx
                popl %ecx
                addl $4, %esp
                # Emitting j = (j - 1)
                pushl $0
                pushl %ecx
                pushl %edx
# ________________assign______________________________________________
                  # Emitting (j - 1)
                    # Emitting 1
                    movl $1, %edx
                    # Emitting j
                    pushl $0
                    pushl %edx
# ____________________var_____________________________________________
                    movl -8(%ebp), %edx
# ____________________swap needed_____________________________________
                    movl %edx, 4(%esp)
                    popl %edx
                    popl %ecx
                  sub %edx, %ecx
                movl %ecx, -8(%ebp)
# ________________NO swap needed______________________________________
                popl %edx
                popl %ecx
                addl $4, %esp
            jmp .L34
.L33:
              # Emitting nop
              pushl $0
              pushl %ecx
              pushl %edx
# ______________NO swap needed________________________________________
              popl %edx
              popl %ecx
              addl $4, %esp
.L34:
        jmp .L15
.L16:
.L17:
        # Emitting if ((left < j)) {...} else {...}
        pushl $0
        pushl %ecx
        pushl %edx
# ________ifElse______________________________________________________
          # Emitting (left < j)
            # Emitting j
# ____________var_____________________________________________________
            movl -8(%ebp), %edx
            # Emitting left
            pushl $0
            pushl %edx
# ____________var_____________________________________________________
            movl 12(%ebp), %edx
# ____________swap needed_____________________________________________
            movl %edx, 4(%esp)
            popl %edx
            popl %ecx
          cmpl %edx, %ecx
          setl %al
          movzbl %al, %ecx
        jge .L43
          # Emitting (...)
            # Emitting this.sort(...)
              # Emitting this
              pushl $0
              pushl %ecx
              movl 8(%ebp), %ecx
# ______________swap needed___________________________________________
              movl %ecx, 4(%esp)
              popl %ecx
              popl %edx
            cmpl $0, %edx
            jne .L45
            movl $4, %eax
            jmp .ERROR_EXIT
.L45:
            movl 0(%edx), %ecx
            movl 8(%ecx), %ecx
            subl $4, %esp
              # Emitting j
              pushl $0
              pushl %ecx
              pushl %edx
              pushl %esi
# ______________var___________________________________________________
              movl -8(%ebp), %esi
# ______________swap needed___________________________________________
              movl %esi, 12(%esp)
              popl %esi
              popl %edx
              popl %ecx
              popl %edi
            pushl %edi
              # Emitting left
              pushl $0
              pushl %ecx
              pushl %edx
              pushl %esi
              pushl %edi
# ______________var___________________________________________________
              movl 12(%ebp), %edi
# ______________swap needed___________________________________________
              movl %edi, 16(%esp)
              popl %edi
              popl %esi
              popl %edx
              popl %ecx
              popl %ebx
            pushl %ebx
            pushl %edx
            call %ecx
            addl $12, %esp
            popl %ecx
        jmp .L44
.L43:
          # Emitting nop
          pushl $0
          pushl %esi
          pushl %edi
# __________NO swap needed____________________________________________
          popl %edi
          popl %esi
          addl $4, %esp
.L44:
# ________NO swap needed______________________________________________
        popl %edx
        popl %ecx
        addl $4, %esp
        # Emitting if ((i < right)) {...} else {...}
        pushl $0
        pushl %ecx
        pushl %edx
        pushl %esi
        pushl %edi
# ________ifElse______________________________________________________
          # Emitting (i < right)
            # Emitting right
# ____________var_____________________________________________________
            movl 16(%ebp), %edi
            # Emitting i
            pushl $0
            pushl %edi
# ____________var_____________________________________________________
            movl -4(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          cmpl %edi, %esi
          setl %al
          movzbl %al, %esi
        jge .L47
          # Emitting (...)
            # Emitting this.sort(...)
              # Emitting this
              pushl $0
              pushl %esi
              movl 8(%ebp), %esi
# ______________swap needed___________________________________________
              movl %esi, 4(%esp)
              popl %esi
              popl %edi
            cmpl $0, %edi
            jne .L49
            movl $4, %eax
            jmp .ERROR_EXIT
.L49:
            movl 0(%edi), %esi
            movl 8(%esi), %esi
            subl $4, %esp
              # Emitting right
              pushl $0
              pushl %edx
              pushl %esi
              pushl %edi
# ______________var___________________________________________________
              movl 16(%ebp), %edi
# ______________swap needed___________________________________________
              movl %edi, 12(%esp)
              popl %edi
              popl %esi
              popl %edx
              popl %ecx
            pushl %ecx
              # Emitting i
              pushl $0
              pushl %ecx
              pushl %edx
              pushl %esi
              pushl %edi
# ______________var___________________________________________________
              movl -4(%ebp), %edi
# ______________swap needed___________________________________________
              movl %edi, 16(%esp)
              popl %edi
              popl %esi
              popl %edx
              popl %ecx
              popl %ebx
            pushl %ebx
            pushl %edi
            call %esi
            addl $12, %esp
            popl %esi
        jmp .L48
.L47:
          # Emitting nop
          pushl $0
          pushl %ecx
          pushl %edx
# __________NO swap needed____________________________________________
          popl %edx
          popl %ecx
          addl $4, %esp
.L48:
# ________NO swap needed______________________________________________
        popl %edi
        popl %esi
        popl %edx
        popl %ecx
        addl $4, %esp
    addl $12, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    # Emitting void main(...) {...}
    pushl $0
    pushl %ecx
    pushl %edx
    pushl %esi
    pushl %edi
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    # variable SIZE
    pushl $0
    # variable j
    pushl $0
      # Emitting (...)
        # Emitting SIZE = 5
# ________assign______________________________________________________
          # Emitting 5
          movl $5, %edi
        movl %edi, -4(%ebp)
        # Emitting a = new Record[][SIZE]
# ________assign______________________________________________________
          # Emitting new Record[][SIZE]
            # Emitting SIZE
# ____________var_____________________________________________________
            movl -4(%ebp), %edi
          cmpl $0, %edi
          jge .L50
          movl $5, %eax
          jmp .ERROR_EXIT
.L50:
          addl $2, %edi
          pushl $4
          pushl %edi
          call calloc
          addl $8, %esp
          movl $vtable_Object, (%eax)
          subl $2, %edi
          movl %edi, 4(%eax)
          movl %eax, %esi
        movl 8(%ebp), %edx
        movl %esi, 4(%edx)
        # Emitting j = 0
        pushl $0
        pushl %edi
# ________assign______________________________________________________
          # Emitting 0
          movl $0, %edi
        movl %edi, -8(%ebp)
# ________NO swap needed______________________________________________
        popl %edi
        addl $4, %esp
        # Emitting while ((j < SIZE)) {...}
        pushl $0
        pushl %edi
# ________whileLoop___________________________________________________
.L51:
          # Emitting (j < SIZE)
            # Emitting SIZE
# ____________var_____________________________________________________
            movl -4(%ebp), %edi
            # Emitting j
            pushl $0
            pushl %edi
# ____________var_____________________________________________________
            movl -8(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          cmpl %edi, %esi
          setl %al
          movzbl %al, %esi
        jge .L52
          # Emitting (...)
            # Emitting a[j] = new Record()
# ____________assign__________________________________________________
              # Emitting new Record()
# ______________newObject_____________________________________________
              pushl $4
              pushl $2
              call calloc
              addl $8, %esp
              movl $vtable_Record, (%eax)
              movl %eax, %esi
              # Emitting a
              pushl $0
              pushl %esi
# ______________var___________________________________________________
              movl 8(%ebp), %esi
              movl 4(%esi), %esi
# ______________swap needed___________________________________________
              movl %esi, 4(%esp)
              popl %esi
              popl %edi
              # Emitting j
              pushl $0
              pushl %esi
              pushl %edi
# ______________var___________________________________________________
              movl -8(%ebp), %edi
# ______________swap needed___________________________________________
              movl %edi, 8(%esp)
              popl %edi
              popl %esi
              popl %edx
            cmpl $0, %edi
            jne .L54
            movl $4, %eax
            jmp .ERROR_EXIT
.L54:
            cmpl $0, %edx
            jge .L55
            movl $3, %eax
            jmp .ERROR_EXIT
.L55:
            cmpl 4(%edi), %edx
            jl .L56
            movl $3, %eax
            jmp .ERROR_EXIT
.L56:
            imul $4, %edx
            addl $8, %edx
            addl %edx, %edi
            movl %esi, (%edi)
            # Emitting j = (j + 1)
# ____________assign__________________________________________________
              # Emitting (j + 1)
                # Emitting 1
                movl $1, %esi
                # Emitting j
                pushl $0
                pushl %esi
# ________________var_________________________________________________
                movl -8(%ebp), %esi
# ________________swap needed_________________________________________
                movl %esi, 4(%esp)
                popl %esi
                popl %edi
              add %esi, %edi
            movl %edi, -8(%ebp)
        jmp .L51
.L52:
.L53:
# ________NO swap needed______________________________________________
        popl %edi
        addl $4, %esp
        # Emitting a[0].a = 5
        pushl $0
        pushl %edi
# ________assign______________________________________________________
          # Emitting 5
          movl $5, %edi
          # Emitting a[0]
          pushl $0
          pushl %edi
            # Emitting a
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 4(%edi), %edi
            # Emitting 0
            pushl $0
            pushl %edi
            movl $0, %edi
# ____________swap needed_____________________________________________
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
# __________swap needed_______________________________________________
          movl %edi, 4(%esp)
          popl %edi
          popl %esi
        cmpl $0, %esi
        jne .L60
        movl $4, %eax
        jmp .ERROR_EXIT
.L60:
        movl %edi, 4(%esi)
# ________NO swap needed______________________________________________
        popl %edi
        addl $4, %esp
        # Emitting a[1].a = 3
        pushl $0
        pushl %edi
# ________assign______________________________________________________
          # Emitting 3
          movl $3, %edi
          # Emitting a[1]
          pushl $0
          pushl %edi
            # Emitting a
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 4(%edi), %edi
            # Emitting 1
            pushl $0
            pushl %edi
            movl $1, %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          cmpl $0, %edi
          jne .L61
          movl $4, %eax
          jmp .ERROR_EXIT
.L61:
          cmpl $0, %esi
          jge .L62
          movl $3, %eax
          jmp .ERROR_EXIT
.L62:
          cmpl 4(%edi), %esi
          jl .L63
          movl $3, %eax
          jmp .ERROR_EXIT
.L63:
          imul $4, %esi
          addl $8, %esi
          addl %esi, %edi
          movl (%edi), %edi
# __________swap needed_______________________________________________
          movl %edi, 4(%esp)
          popl %edi
          popl %esi
        cmpl $0, %esi
        jne .L64
        movl $4, %eax
        jmp .ERROR_EXIT
.L64:
        movl %edi, 4(%esi)
# ________NO swap needed______________________________________________
        popl %edi
        addl $4, %esp
        # Emitting a[2].a = 1
        pushl $0
        pushl %edi
# ________assign______________________________________________________
          # Emitting 1
          movl $1, %edi
          # Emitting a[2]
          pushl $0
          pushl %edi
            # Emitting a
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 4(%edi), %edi
            # Emitting 2
            pushl $0
            pushl %edi
            movl $2, %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          cmpl $0, %edi
          jne .L65
          movl $4, %eax
          jmp .ERROR_EXIT
.L65:
          cmpl $0, %esi
          jge .L66
          movl $3, %eax
          jmp .ERROR_EXIT
.L66:
          cmpl 4(%edi), %esi
          jl .L67
          movl $3, %eax
          jmp .ERROR_EXIT
.L67:
          imul $4, %esi
          addl $8, %esi
          addl %esi, %edi
          movl (%edi), %edi
# __________swap needed_______________________________________________
          movl %edi, 4(%esp)
          popl %edi
          popl %esi
        cmpl $0, %esi
        jne .L68
        movl $4, %eax
        jmp .ERROR_EXIT
.L68:
        movl %edi, 4(%esi)
# ________NO swap needed______________________________________________
        popl %edi
        addl $4, %esp
        # Emitting a[3].a = 4
        pushl $0
        pushl %edi
# ________assign______________________________________________________
          # Emitting 4
          movl $4, %edi
          # Emitting a[3]
          pushl $0
          pushl %edi
            # Emitting a
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
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
          jne .L69
          movl $4, %eax
          jmp .ERROR_EXIT
.L69:
          cmpl $0, %esi
          jge .L70
          movl $3, %eax
          jmp .ERROR_EXIT
.L70:
          cmpl 4(%edi), %esi
          jl .L71
          movl $3, %eax
          jmp .ERROR_EXIT
.L71:
          imul $4, %esi
          addl $8, %esi
          addl %esi, %edi
          movl (%edi), %edi
# __________swap needed_______________________________________________
          movl %edi, 4(%esp)
          popl %edi
          popl %esi
        cmpl $0, %esi
        jne .L72
        movl $4, %eax
        jmp .ERROR_EXIT
.L72:
        movl %edi, 4(%esi)
# ________NO swap needed______________________________________________
        popl %edi
        addl $4, %esp
        # Emitting a[4].a = 2
        pushl $0
        pushl %edi
# ________assign______________________________________________________
          # Emitting 2
          movl $2, %edi
          # Emitting a[4]
          pushl $0
          pushl %edi
            # Emitting a
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 4(%edi), %edi
            # Emitting 4
            pushl $0
            pushl %edi
            movl $4, %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          cmpl $0, %edi
          jne .L73
          movl $4, %eax
          jmp .ERROR_EXIT
.L73:
          cmpl $0, %esi
          jge .L74
          movl $3, %eax
          jmp .ERROR_EXIT
.L74:
          cmpl 4(%edi), %esi
          jl .L75
          movl $3, %eax
          jmp .ERROR_EXIT
.L75:
          imul $4, %esi
          addl $8, %esi
          addl %esi, %edi
          movl (%edi), %edi
# __________swap needed_______________________________________________
          movl %edi, 4(%esp)
          popl %edi
          popl %esi
        cmpl $0, %esi
        jne .L76
        movl $4, %eax
        jmp .ERROR_EXIT
.L76:
        movl %edi, 4(%esi)
# ________NO swap needed______________________________________________
        popl %edi
        addl $4, %esp
        # Emitting j = 0
        pushl $0
        pushl %edi
# ________assign______________________________________________________
          # Emitting 0
          movl $0, %edi
        movl %edi, -8(%ebp)
# ________NO swap needed______________________________________________
        popl %edi
        addl $4, %esp
        # Emitting while ((j < SIZE)) {...}
        pushl $0
        pushl %edi
# ________whileLoop___________________________________________________
.L77:
          # Emitting (j < SIZE)
            # Emitting SIZE
# ____________var_____________________________________________________
            movl -4(%ebp), %edi
            # Emitting j
            pushl $0
            pushl %edi
# ____________var_____________________________________________________
            movl -8(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          cmpl %edi, %esi
          setl %al
          movzbl %al, %esi
        jge .L78
          # Emitting (...)
            # Emitting a[j].print(...)
              # Emitting a[j]
              pushl $0
              pushl %esi
                # Emitting a
# ________________var_________________________________________________
                movl 8(%ebp), %esi
                movl 4(%esi), %esi
                # Emitting j
                pushl $0
                pushl %esi
# ________________var_________________________________________________
                movl -8(%ebp), %esi
# ________________swap needed_________________________________________
                movl %esi, 4(%esp)
                popl %esi
                popl %edi
              cmpl $0, %esi
              jne .L80
              movl $4, %eax
              jmp .ERROR_EXIT
.L80:
              cmpl $0, %edi
              jge .L81
              movl $3, %eax
              jmp .ERROR_EXIT
.L81:
              cmpl 4(%esi), %edi
              jl .L82
              movl $3, %eax
              jmp .ERROR_EXIT
.L82:
              imul $4, %edi
              addl $8, %edi
              addl %edi, %esi
              movl (%esi), %esi
# ______________swap needed___________________________________________
              movl %esi, 4(%esp)
              popl %esi
              popl %edi
            cmpl $0, %edi
            jne .L83
            movl $4, %eax
            jmp .ERROR_EXIT
.L83:
            movl 0(%edi), %esi
            movl 4(%esi), %esi
            subl $4, %esp
            pushl %edi
            call %esi
            addl $4, %esp
            popl %esi
            # Emitting j = (j + 1)
# ____________assign__________________________________________________
              # Emitting (j + 1)
                # Emitting 1
                movl $1, %esi
                # Emitting j
                pushl $0
                pushl %esi
# ________________var_________________________________________________
                movl -8(%ebp), %esi
# ________________swap needed_________________________________________
                movl %esi, 4(%esp)
                popl %esi
                popl %edi
              add %esi, %edi
            movl %edi, -8(%ebp)
        jmp .L77
.L78:
.L79:
# ________NO swap needed______________________________________________
        popl %edi
        addl $4, %esp
        # Emitting writeln()
        pushl $0
        pushl %edi
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
# ________NO swap needed______________________________________________
        popl %edi
        addl $4, %esp
        # Emitting this.sort(...)
        pushl $0
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
        jne .L84
        movl $4, %eax
        jmp .ERROR_EXIT
.L84:
        movl 0(%esi), %edi
        movl 8(%edi), %edi
        subl $4, %esp
          # Emitting 4
          pushl $0
          pushl %edx
          pushl %esi
          pushl %edi
          movl $4, %edi
# __________swap needed_______________________________________________
          movl %edi, 12(%esp)
          popl %edi
          popl %esi
          popl %edx
          popl %ecx
        pushl %ecx
          # Emitting 0
          pushl $0
          pushl %ecx
          pushl %edx
          pushl %esi
          pushl %edi
          movl $0, %edi
# __________swap needed_______________________________________________
          movl %edi, 16(%esp)
          popl %edi
          popl %esi
          popl %edx
          popl %ecx
          popl %ebx
        pushl %ebx
        pushl %esi
        call %edi
        addl $12, %esp
        popl %edi
# ________NO swap needed______________________________________________
        popl %edi
        addl $4, %esp
        # Emitting j = 0
        pushl $0
        pushl %ecx
        pushl %edx
        pushl %edi
# ________assign______________________________________________________
          # Emitting 0
          movl $0, %edi
        movl %edi, -8(%ebp)
# ________NO swap needed______________________________________________
        popl %edi
        popl %edx
        popl %ecx
        addl $4, %esp
        # Emitting while ((j < SIZE)) {...}
        pushl $0
        pushl %ecx
        pushl %edx
        pushl %edi
# ________whileLoop___________________________________________________
.L85:
          # Emitting (j < SIZE)
            # Emitting SIZE
# ____________var_____________________________________________________
            movl -4(%ebp), %edi
            # Emitting j
            pushl $0
            pushl %edi
# ____________var_____________________________________________________
            movl -8(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %edx
          cmpl %edi, %edx
          setl %al
          movzbl %al, %edx
        jge .L86
          # Emitting (...)
            # Emitting a[j].print(...)
              # Emitting a[j]
              pushl $0
              pushl %edx
                # Emitting a
# ________________var_________________________________________________
                movl 8(%ebp), %edx
                movl 4(%edx), %edx
                # Emitting j
                pushl $0
                pushl %edx
# ________________var_________________________________________________
                movl -8(%ebp), %edx
# ________________swap needed_________________________________________
                movl %edx, 4(%esp)
                popl %edx
                popl %edi
              cmpl $0, %edx
              jne .L88
              movl $4, %eax
              jmp .ERROR_EXIT
.L88:
              cmpl $0, %edi
              jge .L89
              movl $3, %eax
              jmp .ERROR_EXIT
.L89:
              cmpl 4(%edx), %edi
              jl .L90
              movl $3, %eax
              jmp .ERROR_EXIT
.L90:
              imul $4, %edi
              addl $8, %edi
              addl %edi, %edx
              movl (%edx), %edx
# ______________swap needed___________________________________________
              movl %edx, 4(%esp)
              popl %edx
              popl %edi
            cmpl $0, %edi
            jne .L91
            movl $4, %eax
            jmp .ERROR_EXIT
.L91:
            movl 0(%edi), %edx
            movl 4(%edx), %edx
            subl $4, %esp
            pushl %edi
            call %edx
            addl $4, %esp
            popl %edx
            # Emitting j = (j + 1)
# ____________assign__________________________________________________
              # Emitting (j + 1)
                # Emitting 1
                movl $1, %edx
                # Emitting j
                pushl $0
                pushl %edx
# ________________var_________________________________________________
                movl -8(%ebp), %edx
# ________________swap needed_________________________________________
                movl %edx, 4(%esp)
                popl %edx
                popl %edi
              add %edx, %edi
            movl %edi, -8(%ebp)
        jmp .L85
.L86:
.L87:
# ________NO swap needed______________________________________________
        popl %edi
        popl %edx
        popl %ecx
        addl $4, %esp
        # Emitting writeln()
        pushl $0
        pushl %ecx
        pushl %edx
        pushl %edi
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
# ________NO swap needed______________________________________________
        popl %edi
        popl %edx
        popl %ecx
        addl $4, %esp
    addl $8, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
# ____NO swap needed__________________________________________________
    popl %edi
    popl %esi
    popl %edx
    popl %ecx
    addl $4, %esp
