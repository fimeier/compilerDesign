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
  pushl $0
    # Emitting int a
    pushl $0
    addl $4, %esp
    # Emitting void print(...) {...}
    pushl $0
Record_print:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
      pushl $0
        # Emitting write(a)
        pushl $0
          # Emitting a
          pushl $0
# __________var_______________________________________________________
          movl 8(%ebp), %edi
          movl 4(%edi), %edi
          popl %esi
        sub $16, %esp
        movl %esi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        addl $4, %esp
        # Emitting writeln()
        pushl $0
        pushl %edi
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
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
  # Emitting class Main {...}
  pushl $0
  pushl %edi
    # Emitting Record[] a
    pushl $0
    addl $4, %esp
    # Emitting int i
    pushl $0
    addl $4, %esp
    # Emitting void swap(...) {...}
    pushl $0
Main_swap:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    # variable temp
    pushl $0
      # Emitting (...)
      pushl $0
        # Emitting temp = r1.a
        pushl $0
# ________assign______________________________________________________
          # Emitting r1.a
          pushl $0
            # Emitting r1
            pushl $0
# ____________var_____________________________________________________
            movl 12(%ebp), %edi
            popl %esi
          cmpl $0, %esi
          jne .L2
          movl $4, %eax
          jmp .ERROR_EXIT
.L2:
          movl 4(%esi), %esi
          popl %edx
        movl %edx, -4(%ebp)
        addl $4, %esp
        # Emitting r1.a = r2.a
        pushl $0
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting r2.a
          pushl $0
            # Emitting r2
            pushl $0
# ____________var_____________________________________________________
            movl 16(%ebp), %edi
            popl %esi
          cmpl $0, %esi
          jne .L3
          movl $4, %eax
          jmp .ERROR_EXIT
.L3:
          movl 4(%esi), %esi
          popl %edx
          # Emitting r1
          pushl $0
          pushl %edx
          pushl %esi
          pushl %edi
# __________var_______________________________________________________
          movl 12(%ebp), %edi
# __________swap needed_______________________________________________
          movl %edi, 12(%esp)
          popl %edx
          popl %esi
          popl %edi
          popl %ecx
        cmpl $0, %ecx
        jne .L4
        movl $4, %eax
        jmp .ERROR_EXIT
.L4:
        movl %edx, 4(%ecx)
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting r2.a = temp
        pushl $0
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting temp
          pushl $0
# __________var_______________________________________________________
          movl -4(%ebp), %edi
          popl %esi
          # Emitting r2
          pushl $0
          pushl %esi
          pushl %edi
# __________var_______________________________________________________
          movl 16(%ebp), %edi
# __________swap needed_______________________________________________
          movl %edi, 8(%esp)
          popl %esi
          popl %edi
          popl %edx
        cmpl $0, %edx
        jne .L5
        movl $4, %eax
        jmp .ERROR_EXIT
.L5:
        movl %esi, 4(%edx)
        popl %esi
        popl %edi
        addl $4, %esp
      addl $4, %esp
    addl $4, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    addl $4, %esp
    # Emitting void sort(...) {...}
    pushl $0
    pushl %esi
    pushl %edi
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
      pushl $0
        # Emitting m = ((a[left].a + a[right].a) / 2)
        pushl $0
# ________assign______________________________________________________
          # Emitting ((a[left].a + a[right].a) / 2)
          pushl $0
            # Emitting (a[left].a + a[right].a)
            pushl $0
              # Emitting a[right].a
              pushl $0
                # Emitting a[right]
                pushl $0
                  # Emitting a
                  pushl $0
# __________________var_______________________________________________
                  movl 8(%ebp), %edi
                  movl 4(%edi), %edi
                  popl %esi
                  # Emitting right
                  pushl $0
                  pushl %esi
                  pushl %edi
# __________________var_______________________________________________
                  movl 16(%ebp), %edi
# __________________swap needed_______________________________________
                  movl %edi, 8(%esp)
                  popl %esi
                  popl %edi
                  popl %edx
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
                popl %edx
              cmpl $0, %edx
              jne .L9
              movl $4, %eax
              jmp .ERROR_EXIT
.L9:
              movl 4(%edx), %edx
              popl %ecx
              # Emitting a[left].a
              pushl $0
              pushl %ecx
              pushl %edx
              pushl %esi
              pushl %edi
                # Emitting a[left]
                pushl $0
                  # Emitting a
                  pushl $0
# __________________var_______________________________________________
                  movl 8(%ebp), %edi
                  movl 4(%edi), %edi
                  popl %esi
                  # Emitting left
                  pushl $0
                  pushl %esi
                  pushl %edi
# __________________var_______________________________________________
                  movl 12(%ebp), %edi
# __________________swap needed_______________________________________
                  movl %edi, 8(%esp)
                  popl %esi
                  popl %edi
                  popl %edx
                cmpl $0, %esi
                jne .L10
                movl $4, %eax
                jmp .ERROR_EXIT
.L10:
                cmpl $0, %edx
                jge .L11
                movl $3, %eax
                jmp .ERROR_EXIT
.L11:
                cmpl 4(%esi), %edx
                jl .L12
                movl $3, %eax
                jmp .ERROR_EXIT
.L12:
                imul $4, %edx
                addl $8, %edx
                addl %edx, %esi
                movl (%esi), %esi
                popl %edx
              cmpl $0, %edx
              jne .L13
              movl $4, %eax
              jmp .ERROR_EXIT
.L13:
              movl 4(%edx), %edx
# ______________swap needed___________________________________________
              movl %edx, 16(%esp)
              popl %ecx
              popl %edx
              popl %esi
              popl %edi
              popl %ebx
            add %ecx, %ebx
            popl %ecx
            # Emitting 2
            pushl $0
            pushl %ebx
            pushl %ecx
            pushl %edx
            pushl %esi
            pushl %edi
            movl $2, %edi
# ____________swap needed_____________________________________________
            movl %edi, 20(%esp)
            popl %ebx
            popl %ecx
            popl %edx
            popl %esi
            popl %edi
            popl %eax
          pushl %ebx
          pushl %edx
          cmpl $0, %eax
          jne .L14
          movl $7, %eax
          jmp .ERROR_EXIT
.L14:
          pushl %eax
          pushl %ecx
          popl %eax
          popl %ebx
          cltd
          idivl %ebx
          movl %eax, %ecx
          popl %edx
          popl %ebx
          popl %eax
        movl %eax, -12(%ebp)
        addl $4, %esp
        # Emitting i = left
        pushl $0
        pushl %ebx
        pushl %ecx
        pushl %edx
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting left
          pushl $0
# __________var_______________________________________________________
          movl 12(%ebp), %edi
          popl %esi
        movl %esi, -4(%ebp)
        popl %ebx
        popl %ecx
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting j = right
        pushl $0
        pushl %ebx
        pushl %ecx
        pushl %edx
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting right
          pushl $0
# __________var_______________________________________________________
          movl 16(%ebp), %edi
          popl %esi
        movl %esi, -8(%ebp)
        popl %ebx
        popl %ecx
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting while ((i <= j)) {...}
        pushl $0
        pushl %ebx
        pushl %ecx
        pushl %edx
        pushl %esi
        pushl %edi
# ________whileLoop___________________________________________________
.L15:
          # Emitting (i <= j)
          pushl $0
            # Emitting j
            pushl $0
# ____________var_____________________________________________________
            movl -8(%ebp), %edi
            popl %esi
            # Emitting i
            pushl $0
            pushl %esi
            pushl %edi
# ____________var_____________________________________________________
            movl -4(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 8(%esp)
            popl %esi
            popl %edi
            popl %edx
          cmpl %esi, %edx
          setle %al
          movzbl %al, %edx
          popl %esi
        jg .L16
          # Emitting (...)
          pushl $0
          pushl %edx
          pushl %edi
            # Emitting while ((a[i].a < m)) {...}
            pushl $0
# ____________whileLoop_______________________________________________
.L18:
              # Emitting (a[i].a < m)
              pushl $0
                # Emitting a[i].a
                pushl $0
                  # Emitting a[i]
                  pushl $0
                    # Emitting a
                    pushl $0
# ____________________var_____________________________________________
                    movl 8(%ebp), %edi
                    movl 4(%edi), %edi
                    popl %edx
                    # Emitting i
                    pushl $0
                    pushl %edx
                    pushl %edi
# ____________________var_____________________________________________
                    movl -4(%ebp), %edi
# ____________________swap needed_____________________________________
                    movl %edi, 8(%esp)
                    popl %edx
                    popl %edi
                    popl %esi
                  cmpl $0, %edx
                  jne .L19
                  movl $4, %eax
                  jmp .ERROR_EXIT
.L19:
                  cmpl $0, %esi
                  jge .L20
                  movl $3, %eax
                  jmp .ERROR_EXIT
.L20:
                  cmpl 4(%edx), %esi
                  jl .L21
                  movl $3, %eax
                  jmp .ERROR_EXIT
.L21:
                  imul $4, %esi
                  addl $8, %esi
                  addl %esi, %edx
                  movl (%edx), %edx
                  popl %esi
                cmpl $0, %esi
                jne .L22
                movl $4, %eax
                jmp .ERROR_EXIT
.L22:
                movl 4(%esi), %esi
                popl %ecx
                # Emitting m
                pushl $0
                pushl %ecx
                pushl %edx
                pushl %esi
                pushl %edi
# ________________var_________________________________________________
                movl -12(%ebp), %edi
# ________________swap needed_________________________________________
                movl %edi, 16(%esp)
                popl %ecx
                popl %edx
                popl %esi
                popl %edi
                popl %ebx
              cmpl %ebx, %ecx
              setl %al
              movzbl %al, %ecx
              popl %ebx
            jge .L23
              # Emitting (...)
              pushl $0
              pushl %ecx
              pushl %edx
              pushl %esi
              pushl %edi
                # Emitting i = (i + 1)
                pushl $0
# ________________assign______________________________________________
                  # Emitting (i + 1)
                  pushl $0
                    # Emitting 1
                    pushl $0
                    movl $1, %edi
                    popl %esi
                    # Emitting i
                    pushl $0
                    pushl %esi
                    pushl %edi
# ____________________var_____________________________________________
                    movl -4(%ebp), %edi
# ____________________swap needed_____________________________________
                    movl %edi, 8(%esp)
                    popl %esi
                    popl %edi
                    popl %edx
                  add %esi, %edx
                  popl %esi
                movl %esi, -4(%ebp)
                addl $4, %esp
              popl %ecx
              popl %edx
              popl %esi
              popl %edi
              addl $4, %esp
            jmp .L18
.L23:
.L24:
            addl $4, %esp
            # Emitting while ((a[j].a > m)) {...}
            pushl $0
            pushl %ecx
            pushl %edx
            pushl %esi
            pushl %edi
# ____________whileLoop_______________________________________________
.L25:
              # Emitting (a[j].a > m)
              pushl $0
                # Emitting a[j].a
                pushl $0
                  # Emitting a[j]
                  pushl $0
                    # Emitting a
                    pushl $0
# ____________________var_____________________________________________
                    movl 8(%ebp), %edi
                    movl 4(%edi), %edi
                    popl %esi
                    # Emitting j
                    pushl $0
                    pushl %esi
                    pushl %edi
# ____________________var_____________________________________________
                    movl -8(%ebp), %edi
# ____________________swap needed_____________________________________
                    movl %edi, 8(%esp)
                    popl %esi
                    popl %edi
                    popl %edx
                  cmpl $0, %esi
                  jne .L26
                  movl $4, %eax
                  jmp .ERROR_EXIT
.L26:
                  cmpl $0, %edx
                  jge .L27
                  movl $3, %eax
                  jmp .ERROR_EXIT
.L27:
                  cmpl 4(%esi), %edx
                  jl .L28
                  movl $3, %eax
                  jmp .ERROR_EXIT
.L28:
                  imul $4, %edx
                  addl $8, %edx
                  addl %edx, %esi
                  movl (%esi), %esi
                  popl %edx
                cmpl $0, %edx
                jne .L29
                movl $4, %eax
                jmp .ERROR_EXIT
.L29:
                movl 4(%edx), %edx
                popl %ecx
                # Emitting m
                pushl $0
                pushl %ecx
                pushl %edx
                pushl %esi
                pushl %edi
# ________________var_________________________________________________
                movl -12(%ebp), %edi
# ________________swap needed_________________________________________
                movl %edi, 16(%esp)
                popl %ecx
                popl %edx
                popl %esi
                popl %edi
                popl %ebx
              cmpl %ebx, %ecx
              setg %al
              movzbl %al, %ecx
              popl %ebx
            jle .L30
              # Emitting (...)
              pushl $0
              pushl %ecx
              pushl %edx
              pushl %esi
              pushl %edi
                # Emitting j = (j - 1)
                pushl $0
# ________________assign______________________________________________
                  # Emitting (j - 1)
                  pushl $0
                    # Emitting 1
                    pushl $0
                    movl $1, %edi
                    popl %esi
                    # Emitting j
                    pushl $0
                    pushl %esi
                    pushl %edi
# ____________________var_____________________________________________
                    movl -8(%ebp), %edi
# ____________________swap needed_____________________________________
                    movl %edi, 8(%esp)
                    popl %esi
                    popl %edi
                    popl %edx
                  sub %esi, %edx
                  popl %esi
                movl %esi, -8(%ebp)
                addl $4, %esp
              popl %ecx
              popl %edx
              popl %esi
              popl %edi
              addl $4, %esp
            jmp .L25
.L30:
.L31:
            popl %ecx
            popl %edx
            popl %esi
            popl %edi
            addl $4, %esp
            # Emitting if ((i <= j)) {...} else {...}
            pushl $0
            pushl %ecx
            pushl %edx
            pushl %esi
            pushl %edi
# ____________ifElse__________________________________________________
              # Emitting (i <= j)
              pushl $0
                # Emitting j
                pushl $0
# ________________var_________________________________________________
                movl -8(%ebp), %edi
                popl %esi
                # Emitting i
                pushl $0
                pushl %esi
                pushl %edi
# ________________var_________________________________________________
                movl -4(%ebp), %edi
# ________________swap needed_________________________________________
                movl %edi, 8(%esp)
                popl %esi
                popl %edi
                popl %edx
              cmpl %esi, %edx
              setle %al
              movzbl %al, %edx
              popl %esi
            jg .L33
              # Emitting (...)
              pushl $0
              pushl %edx
              pushl %edi
                # Emitting this.swap(...)
                pushl $0
                  # Emitting this
                  pushl $0
                  pushl %edi
                  movl 8(%ebp), %edi
# __________________swap needed_______________________________________
                  movl %edi, 4(%esp)
                  popl %edi
                  popl %edx
                cmpl $0, %edx
                jne .L35
                movl $4, %eax
                jmp .ERROR_EXIT
.L35:
                movl 0(%edx), %edi
                movl 4(%edi), %edi
                subl $4, %esp
                  # Emitting a[j]
                  pushl $0
                  pushl %edx
                  pushl %esi
                  pushl %edi
                    # Emitting a
                    pushl $0
# ____________________var_____________________________________________
                    movl 8(%ebp), %edi
                    movl 4(%edi), %edi
                    popl %esi
                    # Emitting j
                    pushl $0
                    pushl %esi
                    pushl %edi
# ____________________var_____________________________________________
                    movl -8(%ebp), %edi
# ____________________swap needed_____________________________________
                    movl %edi, 8(%esp)
                    popl %esi
                    popl %edi
                    popl %edx
                  cmpl $0, %esi
                  jne .L36
                  movl $4, %eax
                  jmp .ERROR_EXIT
.L36:
                  cmpl $0, %edx
                  jge .L37
                  movl $3, %eax
                  jmp .ERROR_EXIT
.L37:
                  cmpl 4(%esi), %edx
                  jl .L38
                  movl $3, %eax
                  jmp .ERROR_EXIT
.L38:
                  imul $4, %edx
                  addl $8, %edx
                  addl %edx, %esi
                  movl (%esi), %esi
# __________________swap needed_______________________________________
                  movl %esi, 12(%esp)
                  popl %edx
                  popl %esi
                  popl %edi
                  popl %ecx
                pushl %ecx
                  # Emitting a[i]
                  pushl $0
                  pushl %ecx
                  pushl %edx
                  pushl %esi
                  pushl %edi
                    # Emitting a
                    pushl $0
# ____________________var_____________________________________________
                    movl 8(%ebp), %edi
                    movl 4(%edi), %edi
                    popl %esi
                    # Emitting i
                    pushl $0
                    pushl %esi
                    pushl %edi
# ____________________var_____________________________________________
                    movl -4(%ebp), %edi
# ____________________swap needed_____________________________________
                    movl %edi, 8(%esp)
                    popl %esi
                    popl %edi
                    popl %edx
                  cmpl $0, %esi
                  jne .L39
                  movl $4, %eax
                  jmp .ERROR_EXIT
.L39:
                  cmpl $0, %edx
                  jge .L40
                  movl $3, %eax
                  jmp .ERROR_EXIT
.L40:
                  cmpl 4(%esi), %edx
                  jl .L41
                  movl $3, %eax
                  jmp .ERROR_EXIT
.L41:
                  imul $4, %edx
                  addl $8, %edx
                  addl %edx, %esi
                  movl (%esi), %esi
# __________________swap needed_______________________________________
                  movl %esi, 16(%esp)
                  popl %ecx
                  popl %edx
                  popl %esi
                  popl %edi
                  popl %ebx
                pushl %ebx
                pushl %edx
                call %edi
                addl $12, %esp
                popl %edi
                addl $4, %esp
                # Emitting i = (i + 1)
                pushl $0
                pushl %ecx
                pushl %esi
# ________________assign______________________________________________
                  # Emitting (i + 1)
                  pushl $0
                    # Emitting 1
                    pushl $0
                    movl $1, %esi
                    popl %ecx
                    # Emitting i
                    pushl $0
                    pushl %ecx
                    pushl %esi
# ____________________var_____________________________________________
                    movl -4(%ebp), %esi
# ____________________swap needed_____________________________________
                    movl %esi, 8(%esp)
                    popl %ecx
                    popl %esi
                    popl %edi
                  add %ecx, %edi
                  popl %ecx
                movl %ecx, -4(%ebp)
                popl %ecx
                popl %esi
                addl $4, %esp
                # Emitting j = (j - 1)
                pushl $0
                pushl %ecx
                pushl %esi
                pushl %edi
# ________________assign______________________________________________
                  # Emitting (j - 1)
                  pushl $0
                    # Emitting 1
                    pushl $0
                    movl $1, %edi
                    popl %esi
                    # Emitting j
                    pushl $0
                    pushl %esi
                    pushl %edi
# ____________________var_____________________________________________
                    movl -8(%ebp), %edi
# ____________________swap needed_____________________________________
                    movl %edi, 8(%esp)
                    popl %esi
                    popl %edi
                    popl %ecx
                  sub %esi, %ecx
                  popl %esi
                movl %esi, -8(%ebp)
                popl %ecx
                popl %esi
                popl %edi
                addl $4, %esp
              popl %edx
              popl %edi
              addl $4, %esp
            jmp .L34
.L33:
              # Emitting nop
              pushl $0
              pushl %ecx
              pushl %edx
              pushl %esi
              pushl %edi
              popl %ecx
              popl %edx
              popl %esi
              popl %edi
              addl $4, %esp
.L34:
            popl %ecx
            popl %edx
            popl %esi
            popl %edi
            addl $4, %esp
          popl %edx
          popl %edi
          addl $4, %esp
        jmp .L15
.L16:
.L17:
        popl %ebx
        popl %ecx
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting if ((left < j)) {...} else {...}
        pushl $0
        pushl %ebx
        pushl %ecx
        pushl %edx
        pushl %esi
        pushl %edi
# ________ifElse______________________________________________________
          # Emitting (left < j)
          pushl $0
            # Emitting j
            pushl $0
# ____________var_____________________________________________________
            movl -8(%ebp), %edi
            popl %esi
            # Emitting left
            pushl $0
            pushl %esi
            pushl %edi
# ____________var_____________________________________________________
            movl 12(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 8(%esp)
            popl %esi
            popl %edi
            popl %edx
          cmpl %esi, %edx
          setl %al
          movzbl %al, %edx
          popl %esi
        jge .L43
          # Emitting (...)
          pushl $0
          pushl %edx
          pushl %edi
            # Emitting this.sort(...)
            pushl $0
              # Emitting this
              pushl $0
              pushl %edi
              movl 8(%ebp), %edi
# ______________swap needed___________________________________________
              movl %edi, 4(%esp)
              popl %edi
              popl %edx
            cmpl $0, %edx
            jne .L45
            movl $4, %eax
            jmp .ERROR_EXIT
.L45:
            movl 0(%edx), %edi
            movl 8(%edi), %edi
            subl $4, %esp
              # Emitting j
              pushl $0
              pushl %edx
              pushl %esi
              pushl %edi
# ______________var___________________________________________________
              movl -8(%ebp), %edi
# ______________swap needed___________________________________________
              movl %edi, 12(%esp)
              popl %edx
              popl %esi
              popl %edi
              popl %ecx
            pushl %ecx
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
              popl %ecx
              popl %edx
              popl %esi
              popl %edi
              popl %ebx
            pushl %ebx
            pushl %edx
            call %edi
            addl $12, %esp
            popl %edi
            addl $4, %esp
          popl %edx
          popl %edi
          addl $4, %esp
        jmp .L44
.L43:
          # Emitting nop
          pushl $0
          pushl %ecx
          pushl %edx
          pushl %esi
          pushl %edi
          popl %ecx
          popl %edx
          popl %esi
          popl %edi
          addl $4, %esp
.L44:
        popl %ebx
        popl %ecx
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting if ((i < right)) {...} else {...}
        pushl $0
        pushl %ebx
        pushl %ecx
        pushl %edx
        pushl %esi
        pushl %edi
# ________ifElse______________________________________________________
          # Emitting (i < right)
          pushl $0
            # Emitting right
            pushl $0
# ____________var_____________________________________________________
            movl 16(%ebp), %edi
            popl %esi
            # Emitting i
            pushl $0
            pushl %esi
            pushl %edi
# ____________var_____________________________________________________
            movl -4(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 8(%esp)
            popl %esi
            popl %edi
            popl %edx
          cmpl %esi, %edx
          setl %al
          movzbl %al, %edx
          popl %esi
        jge .L47
          # Emitting (...)
          pushl $0
          pushl %edx
          pushl %edi
            # Emitting this.sort(...)
            pushl $0
              # Emitting this
              pushl $0
              pushl %edi
              movl 8(%ebp), %edi
# ______________swap needed___________________________________________
              movl %edi, 4(%esp)
              popl %edi
              popl %edx
            cmpl $0, %edx
            jne .L49
            movl $4, %eax
            jmp .ERROR_EXIT
.L49:
            movl 0(%edx), %edi
            movl 8(%edi), %edi
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
              popl %edx
              popl %esi
              popl %edi
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
              popl %ecx
              popl %edx
              popl %esi
              popl %edi
              popl %ebx
            pushl %ebx
            pushl %edx
            call %edi
            addl $12, %esp
            popl %edi
            addl $4, %esp
          popl %edx
          popl %edi
          addl $4, %esp
        jmp .L48
.L47:
          # Emitting nop
          pushl $0
          pushl %ecx
          pushl %edx
          pushl %esi
          pushl %edi
          popl %ecx
          popl %edx
          popl %esi
          popl %edi
          addl $4, %esp
.L48:
        popl %ebx
        popl %ecx
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
      addl $4, %esp
    addl $12, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    popl %esi
    popl %edi
    addl $4, %esp
    # Emitting void main(...) {...}
    pushl $0
    pushl %ebx
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
      pushl $0
        # Emitting SIZE = 5
        pushl $0
# ________assign______________________________________________________
          # Emitting 5
          pushl $0
          movl $5, %edi
          popl %esi
        movl %esi, -4(%ebp)
        addl $4, %esp
        # Emitting a = new Record[][SIZE]
        pushl $0
        pushl %edi
# ________assign______________________________________________________
          # Emitting new Record[][SIZE]
          pushl $0
            # Emitting SIZE
            pushl $0
# ____________var_____________________________________________________
            movl -4(%ebp), %edi
            popl %esi
          cmpl $0, %esi
          jge .L50
          movl $5, %eax
          jmp .ERROR_EXIT
.L50:
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
        # Emitting j = 0
        pushl $0
        pushl %edx
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting 0
          pushl $0
          movl $0, %edi
          popl %esi
        movl %esi, -8(%ebp)
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting while ((j < SIZE)) {...}
        pushl $0
        pushl %edx
        pushl %esi
        pushl %edi
# ________whileLoop___________________________________________________
.L51:
          # Emitting (j < SIZE)
          pushl $0
            # Emitting SIZE
            pushl $0
# ____________var_____________________________________________________
            movl -4(%ebp), %edi
            popl %esi
            # Emitting j
            pushl $0
            pushl %esi
            pushl %edi
# ____________var_____________________________________________________
            movl -8(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 8(%esp)
            popl %esi
            popl %edi
            popl %edx
          cmpl %esi, %edx
          setl %al
          movzbl %al, %edx
          popl %esi
        jge .L52
          # Emitting (...)
          pushl $0
          pushl %edx
          pushl %edi
            # Emitting a[j] = new Record()
            pushl $0
# ____________assign__________________________________________________
              # Emitting new Record()
              pushl $0
# ______________newObject_____________________________________________
              pushl $4
              pushl $2
              call calloc
              addl $8, %esp
              movl $vtable_Record, (%eax)
              movl %eax, %edi
              popl %edx
              # Emitting a
              pushl $0
              pushl %edx
              pushl %edi
# ______________var___________________________________________________
              movl 8(%ebp), %edi
              movl 4(%edi), %edi
# ______________swap needed___________________________________________
              movl %edi, 8(%esp)
              popl %edx
              popl %edi
              popl %esi
              # Emitting j
              pushl $0
              pushl %edx
              pushl %esi
              pushl %edi
# ______________var___________________________________________________
              movl -8(%ebp), %edi
# ______________swap needed___________________________________________
              movl %edi, 12(%esp)
              popl %edx
              popl %esi
              popl %edi
              popl %ecx
            cmpl $0, %esi
            jne .L54
            movl $4, %eax
            jmp .ERROR_EXIT
.L54:
            cmpl $0, %ecx
            jge .L55
            movl $3, %eax
            jmp .ERROR_EXIT
.L55:
            cmpl 4(%esi), %ecx
            jl .L56
            movl $3, %eax
            jmp .ERROR_EXIT
.L56:
            imul $4, %ecx
            addl $8, %ecx
            addl %ecx, %esi
            movl %edx, (%esi)
            addl $4, %esp
            # Emitting j = (j + 1)
            pushl $0
            pushl %edi
# ____________assign__________________________________________________
              # Emitting (j + 1)
              pushl $0
                # Emitting 1
                pushl $0
                movl $1, %edi
                popl %edx
                # Emitting j
                pushl $0
                pushl %edx
                pushl %edi
# ________________var_________________________________________________
                movl -8(%ebp), %edi
# ________________swap needed_________________________________________
                movl %edi, 8(%esp)
                popl %edx
                popl %edi
                popl %esi
              add %edx, %esi
              popl %edx
            movl %edx, -8(%ebp)
            popl %edi
            addl $4, %esp
          popl %edx
          popl %edi
          addl $4, %esp
        jmp .L51
.L52:
.L53:
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting a[0].a = 5
        pushl $0
        pushl %edx
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting 5
          pushl $0
          movl $5, %edi
          popl %esi
          # Emitting a[0]
          pushl $0
          pushl %esi
          pushl %edi
            # Emitting a
            pushl $0
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 4(%edi), %edi
            popl %esi
            # Emitting 0
            pushl $0
            pushl %esi
            pushl %edi
            movl $0, %edi
# ____________swap needed_____________________________________________
            movl %edi, 8(%esp)
            popl %esi
            popl %edi
            popl %edx
          cmpl $0, %esi
          jne .L57
          movl $4, %eax
          jmp .ERROR_EXIT
.L57:
          cmpl $0, %edx
          jge .L58
          movl $3, %eax
          jmp .ERROR_EXIT
.L58:
          cmpl 4(%esi), %edx
          jl .L59
          movl $3, %eax
          jmp .ERROR_EXIT
.L59:
          imul $4, %edx
          addl $8, %edx
          addl %edx, %esi
          movl (%esi), %esi
# __________swap needed_______________________________________________
          movl %esi, 8(%esp)
          popl %esi
          popl %edi
          popl %edx
        cmpl $0, %edx
        jne .L60
        movl $4, %eax
        jmp .ERROR_EXIT
.L60:
        movl %esi, 4(%edx)
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting a[1].a = 3
        pushl $0
        pushl %edx
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting 3
          pushl $0
          movl $3, %edi
          popl %esi
          # Emitting a[1]
          pushl $0
          pushl %esi
          pushl %edi
            # Emitting a
            pushl $0
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 4(%edi), %edi
            popl %esi
            # Emitting 1
            pushl $0
            pushl %esi
            pushl %edi
            movl $1, %edi
# ____________swap needed_____________________________________________
            movl %edi, 8(%esp)
            popl %esi
            popl %edi
            popl %edx
          cmpl $0, %esi
          jne .L61
          movl $4, %eax
          jmp .ERROR_EXIT
.L61:
          cmpl $0, %edx
          jge .L62
          movl $3, %eax
          jmp .ERROR_EXIT
.L62:
          cmpl 4(%esi), %edx
          jl .L63
          movl $3, %eax
          jmp .ERROR_EXIT
.L63:
          imul $4, %edx
          addl $8, %edx
          addl %edx, %esi
          movl (%esi), %esi
# __________swap needed_______________________________________________
          movl %esi, 8(%esp)
          popl %esi
          popl %edi
          popl %edx
        cmpl $0, %edx
        jne .L64
        movl $4, %eax
        jmp .ERROR_EXIT
.L64:
        movl %esi, 4(%edx)
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting a[2].a = 1
        pushl $0
        pushl %edx
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting 1
          pushl $0
          movl $1, %edi
          popl %esi
          # Emitting a[2]
          pushl $0
          pushl %esi
          pushl %edi
            # Emitting a
            pushl $0
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 4(%edi), %edi
            popl %esi
            # Emitting 2
            pushl $0
            pushl %esi
            pushl %edi
            movl $2, %edi
# ____________swap needed_____________________________________________
            movl %edi, 8(%esp)
            popl %esi
            popl %edi
            popl %edx
          cmpl $0, %esi
          jne .L65
          movl $4, %eax
          jmp .ERROR_EXIT
.L65:
          cmpl $0, %edx
          jge .L66
          movl $3, %eax
          jmp .ERROR_EXIT
.L66:
          cmpl 4(%esi), %edx
          jl .L67
          movl $3, %eax
          jmp .ERROR_EXIT
.L67:
          imul $4, %edx
          addl $8, %edx
          addl %edx, %esi
          movl (%esi), %esi
# __________swap needed_______________________________________________
          movl %esi, 8(%esp)
          popl %esi
          popl %edi
          popl %edx
        cmpl $0, %edx
        jne .L68
        movl $4, %eax
        jmp .ERROR_EXIT
.L68:
        movl %esi, 4(%edx)
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting a[3].a = 4
        pushl $0
        pushl %edx
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting 4
          pushl $0
          movl $4, %edi
          popl %esi
          # Emitting a[3]
          pushl $0
          pushl %esi
          pushl %edi
            # Emitting a
            pushl $0
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 4(%edi), %edi
            popl %esi
            # Emitting 3
            pushl $0
            pushl %esi
            pushl %edi
            movl $3, %edi
# ____________swap needed_____________________________________________
            movl %edi, 8(%esp)
            popl %esi
            popl %edi
            popl %edx
          cmpl $0, %esi
          jne .L69
          movl $4, %eax
          jmp .ERROR_EXIT
.L69:
          cmpl $0, %edx
          jge .L70
          movl $3, %eax
          jmp .ERROR_EXIT
.L70:
          cmpl 4(%esi), %edx
          jl .L71
          movl $3, %eax
          jmp .ERROR_EXIT
.L71:
          imul $4, %edx
          addl $8, %edx
          addl %edx, %esi
          movl (%esi), %esi
# __________swap needed_______________________________________________
          movl %esi, 8(%esp)
          popl %esi
          popl %edi
          popl %edx
        cmpl $0, %edx
        jne .L72
        movl $4, %eax
        jmp .ERROR_EXIT
.L72:
        movl %esi, 4(%edx)
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting a[4].a = 2
        pushl $0
        pushl %edx
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting 2
          pushl $0
          movl $2, %edi
          popl %esi
          # Emitting a[4]
          pushl $0
          pushl %esi
          pushl %edi
            # Emitting a
            pushl $0
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 4(%edi), %edi
            popl %esi
            # Emitting 4
            pushl $0
            pushl %esi
            pushl %edi
            movl $4, %edi
# ____________swap needed_____________________________________________
            movl %edi, 8(%esp)
            popl %esi
            popl %edi
            popl %edx
          cmpl $0, %esi
          jne .L73
          movl $4, %eax
          jmp .ERROR_EXIT
.L73:
          cmpl $0, %edx
          jge .L74
          movl $3, %eax
          jmp .ERROR_EXIT
.L74:
          cmpl 4(%esi), %edx
          jl .L75
          movl $3, %eax
          jmp .ERROR_EXIT
.L75:
          imul $4, %edx
          addl $8, %edx
          addl %edx, %esi
          movl (%esi), %esi
# __________swap needed_______________________________________________
          movl %esi, 8(%esp)
          popl %esi
          popl %edi
          popl %edx
        cmpl $0, %edx
        jne .L76
        movl $4, %eax
        jmp .ERROR_EXIT
.L76:
        movl %esi, 4(%edx)
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting j = 0
        pushl $0
        pushl %edx
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting 0
          pushl $0
          movl $0, %edi
          popl %esi
        movl %esi, -8(%ebp)
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting while ((j < SIZE)) {...}
        pushl $0
        pushl %edx
        pushl %esi
        pushl %edi
# ________whileLoop___________________________________________________
.L77:
          # Emitting (j < SIZE)
          pushl $0
            # Emitting SIZE
            pushl $0
# ____________var_____________________________________________________
            movl -4(%ebp), %edi
            popl %esi
            # Emitting j
            pushl $0
            pushl %esi
            pushl %edi
# ____________var_____________________________________________________
            movl -8(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 8(%esp)
            popl %esi
            popl %edi
            popl %edx
          cmpl %esi, %edx
          setl %al
          movzbl %al, %edx
          popl %esi
        jge .L78
          # Emitting (...)
          pushl $0
          pushl %edx
          pushl %edi
            # Emitting a[j].print(...)
            pushl $0
              # Emitting a[j]
              pushl $0
              pushl %edi
                # Emitting a
                pushl $0
# ________________var_________________________________________________
                movl 8(%ebp), %edi
                movl 4(%edi), %edi
                popl %edx
                # Emitting j
                pushl $0
                pushl %edx
                pushl %edi
# ________________var_________________________________________________
                movl -8(%ebp), %edi
# ________________swap needed_________________________________________
                movl %edi, 8(%esp)
                popl %edx
                popl %edi
                popl %esi
              cmpl $0, %edx
              jne .L80
              movl $4, %eax
              jmp .ERROR_EXIT
.L80:
              cmpl $0, %esi
              jge .L81
              movl $3, %eax
              jmp .ERROR_EXIT
.L81:
              cmpl 4(%edx), %esi
              jl .L82
              movl $3, %eax
              jmp .ERROR_EXIT
.L82:
              imul $4, %esi
              addl $8, %esi
              addl %esi, %edx
              movl (%edx), %edx
              popl %edi
              popl %esi
            cmpl $0, %esi
            jne .L83
            movl $4, %eax
            jmp .ERROR_EXIT
.L83:
            movl 0(%esi), %edi
            movl 4(%edi), %edi
            subl $4, %esp
            pushl %esi
            call %edi
            addl $4, %esp
            popl %edi
            addl $4, %esp
            # Emitting j = (j + 1)
            pushl $0
            pushl %edx
# ____________assign__________________________________________________
              # Emitting (j + 1)
              pushl $0
                # Emitting 1
                pushl $0
                movl $1, %edx
                popl %edi
                # Emitting j
                pushl $0
                pushl %edx
                pushl %edi
# ________________var_________________________________________________
                movl -8(%ebp), %edi
# ________________swap needed_________________________________________
                movl %edi, 8(%esp)
                popl %edx
                popl %edi
                popl %esi
              add %edi, %esi
              popl %edi
            movl %edi, -8(%ebp)
            popl %edx
            addl $4, %esp
          popl %edx
          popl %edi
          addl $4, %esp
        jmp .L77
.L78:
.L79:
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting writeln()
        pushl $0
        pushl %edx
        pushl %esi
        pushl %edi
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting this.sort(...)
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
          popl %edx
          popl %esi
          popl %edi
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
          popl %ecx
          popl %edx
          popl %esi
          popl %edi
          popl %ebx
        pushl %ebx
        pushl %esi
        call %edi
        addl $12, %esp
        popl %edi
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting j = 0
        pushl $0
        pushl %ecx
        pushl %edx
        pushl %esi
        pushl %edi
# ________assign______________________________________________________
          # Emitting 0
          pushl $0
          movl $0, %edi
          popl %esi
        movl %esi, -8(%ebp)
        popl %ecx
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting while ((j < SIZE)) {...}
        pushl $0
        pushl %ecx
        pushl %edx
        pushl %esi
        pushl %edi
# ________whileLoop___________________________________________________
.L85:
          # Emitting (j < SIZE)
          pushl $0
            # Emitting SIZE
            pushl $0
# ____________var_____________________________________________________
            movl -4(%ebp), %edi
            popl %esi
            # Emitting j
            pushl $0
            pushl %esi
            pushl %edi
# ____________var_____________________________________________________
            movl -8(%ebp), %edi
# ____________swap needed_____________________________________________
            movl %edi, 8(%esp)
            popl %esi
            popl %edi
            popl %edx
          cmpl %esi, %edx
          setl %al
          movzbl %al, %edx
          popl %esi
        jge .L86
          # Emitting (...)
          pushl $0
          pushl %edx
          pushl %edi
            # Emitting a[j].print(...)
            pushl $0
              # Emitting a[j]
              pushl $0
              pushl %edi
                # Emitting a
                pushl $0
# ________________var_________________________________________________
                movl 8(%ebp), %edi
                movl 4(%edi), %edi
                popl %edx
                # Emitting j
                pushl $0
                pushl %edx
                pushl %edi
# ________________var_________________________________________________
                movl -8(%ebp), %edi
# ________________swap needed_________________________________________
                movl %edi, 8(%esp)
                popl %edx
                popl %edi
                popl %esi
              cmpl $0, %edx
              jne .L88
              movl $4, %eax
              jmp .ERROR_EXIT
.L88:
              cmpl $0, %esi
              jge .L89
              movl $3, %eax
              jmp .ERROR_EXIT
.L89:
              cmpl 4(%edx), %esi
              jl .L90
              movl $3, %eax
              jmp .ERROR_EXIT
.L90:
              imul $4, %esi
              addl $8, %esi
              addl %esi, %edx
              movl (%edx), %edx
              popl %edi
              popl %esi
            cmpl $0, %esi
            jne .L91
            movl $4, %eax
            jmp .ERROR_EXIT
.L91:
            movl 0(%esi), %edi
            movl 4(%edi), %edi
            subl $4, %esp
            pushl %esi
            call %edi
            addl $4, %esp
            popl %edi
            addl $4, %esp
            # Emitting j = (j + 1)
            pushl $0
            pushl %edx
# ____________assign__________________________________________________
              # Emitting (j + 1)
              pushl $0
                # Emitting 1
                pushl $0
                movl $1, %edx
                popl %edi
                # Emitting j
                pushl $0
                pushl %edx
                pushl %edi
# ________________var_________________________________________________
                movl -8(%ebp), %edi
# ________________swap needed_________________________________________
                movl %edi, 8(%esp)
                popl %edx
                popl %edi
                popl %esi
              add %edi, %esi
              popl %edi
            movl %edi, -8(%ebp)
            popl %edx
            addl $4, %esp
          popl %edx
          popl %edi
          addl $4, %esp
        jmp .L85
.L86:
.L87:
        popl %ecx
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
        # Emitting writeln()
        pushl $0
        pushl %ecx
        pushl %edx
        pushl %esi
        pushl %edi
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        popl %ecx
        popl %edx
        popl %esi
        popl %edi
        addl $4, %esp
      addl $4, %esp
    addl $8, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    popl %ebx
    popl %ecx
    popl %edx
    popl %esi
    popl %edi
    addl $4, %esp
  popl %edi
  addl $4, %esp
