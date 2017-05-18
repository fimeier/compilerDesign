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
          pushl %edi
# __________var_______________________________________________________
          movl 12(%ebp), %esi
          popl %edi
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
          pushl %edi
# __________var_______________________________________________________
          movl 16(%ebp), %esi
          popl %edi
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
                  pushl %edi
# __________________var_______________________________________________
                  movl 16(%ebp), %esi
                  popl %edi
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
              pushl %edi
                # Emitting a[left]
                pushl %edi
                  # Emitting a
                  pushl %edi
# __________________var_______________________________________________
                  movl 8(%ebp), %esi
                  movl 4(%esi), %esi
                  popl %edi
                  # Emitting left
                  pushl %esi
                  pushl %edi
# __________________var_______________________________________________
                  movl 12(%ebp), %edx
                  popl %edi
                  popl %esi
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
                popl %edi
              cmpl $0, %esi
              jne .L13
              movl $4, %eax
              jmp .ERROR_EXIT
.L13:
              movl 4(%esi), %esi
              popl %edi
            add %edi, %esi
            # Emitting 2
            pushl %esi
            movl $2, %edi
            popl %esi
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
            pushl %esi
# ____________var_____________________________________________________
            movl -4(%ebp), %edi
            popl %esi
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
                    pushl %edi
# ____________________var_____________________________________________
                    movl -4(%ebp), %esi
                    popl %edi
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
                pushl %edi
# ________________var_________________________________________________
                movl -12(%ebp), %esi
                popl %edi
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
                    pushl %edi
# ____________________var_____________________________________________
                    movl -4(%ebp), %esi
                    popl %edi
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
                    pushl %esi
# ____________________var_____________________________________________
                    movl -8(%ebp), %edi
                    popl %esi
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
                pushl %esi
# ________________var_________________________________________________
                movl -12(%ebp), %edi
                popl %esi
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
                    pushl %esi
# ____________________var_____________________________________________
                    movl -8(%ebp), %edi
                    popl %esi
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
                pushl %edi
# ________________var_________________________________________________
                movl -4(%ebp), %esi
                popl %edi
              cmpl %edi, %esi
              setle %al
              movzbl %al, %esi
            jg .L33
              # Emitting (...)
                # Emitting this.swap(...)
                  # Emitting this
                  pushl %esi
                  movl 8(%ebp), %edi
                  popl %esi
                cmpl $0, %edi
                jne .L35
                movl $4, %eax
                jmp .ERROR_EXIT
.L35:
                movl 0(%edi), %esi
                movl 4(%esi), %esi
                subl $4, %esp
                  # Emitting a[j]
                  pushl %edx
                  pushl %esi
                  pushl %edi
                    # Emitting a
                    pushl %edx
                    pushl %esi
                    pushl %edi
# ____________________var_____________________________________________
                    movl 8(%ebp), %ecx
                    movl 4(%ecx), %ecx
                    popl %edi
                    popl %esi
                    popl %edx
                    # Emitting j
                    pushl %ecx
                    pushl %edx
                    pushl %esi
                    pushl %edi
# ____________________var_____________________________________________
                    movl -8(%ebp), %ebx
                    popl %edi
                    popl %esi
                    popl %edx
                    popl %ecx
                  cmpl $0, %ecx
                  jne .L36
                  movl $4, %eax
                  jmp .ERROR_EXIT
.L36:
                  cmpl $0, %ebx
                  jge .L37
                  movl $3, %eax
                  jmp .ERROR_EXIT
.L37:
                  cmpl 4(%ecx), %ebx
                  jl .L38
                  movl $3, %eax
                  jmp .ERROR_EXIT
.L38:
                  imul $4, %ebx
                  addl $8, %ebx
                  addl %ebx, %ecx
                  movl (%ecx), %ecx
                  popl %edi
                  popl %esi
                  popl %edx
                pushl %ecx
                  # Emitting a[i]
                  pushl %ecx
                  pushl %edx
                  pushl %esi
                  pushl %edi
                    # Emitting a
                    pushl %ecx
                    pushl %edx
                    pushl %esi
                    pushl %edi
# ____________________var_____________________________________________
                    movl 8(%ebp), %ebx
                    movl 4(%ebx), %ebx
                    popl %edi
                    popl %esi
                    popl %edx
                    popl %ecx
                    # Emitting i
                    pushl %ebx
                    pushl %ecx
                    pushl %edx
                    pushl %esi
                    pushl %edi
# ____________________var_____________________________________________
                    movl -4(%ebp), %eax
                    popl %edi
                    popl %esi
                    popl %edx
                    popl %ecx
                    popl %ebx
                  cmpl $0, %ebx
                  jne .L39
                  movl $4, %eax
                  jmp .ERROR_EXIT
.L39:
                  cmpl $0, %eax
                  jge .L40
                  movl $3, %eax
                  jmp .ERROR_EXIT
.L40:
                  cmpl 4(%ebx), %eax
                  jl .L41
                  movl $3, %eax
                  jmp .ERROR_EXIT
.L41:
                  imul $4, %eax
                  addl $8, %eax
                  addl %eax, %ebx
                  movl (%ebx), %ebx
                  popl %edi
                  popl %esi
                  popl %edx
                  popl %ecx
                pushl %ebx
                pushl %edi
                call %esi
                addl $12, %esp
                popl %esi
                # Emitting i = (i + 1)
                pushl %ecx
                pushl %edx
# ________________assign______________________________________________
                  # Emitting (i + 1)
                  pushl %ecx
                  pushl %edx
                    # Emitting 1
                    pushl %ecx
                    pushl %edx
                    movl $1, %esi
                    popl %edx
                    popl %ecx
                    # Emitting i
                    pushl %ecx
                    pushl %edx
                    pushl %esi
# ____________________var_____________________________________________
                    movl -4(%ebp), %edi
                    popl %esi
                    popl %edx
                    popl %ecx
                  add %esi, %edi
                  popl %edx
                  popl %ecx
                movl %edi, -4(%ebp)
                popl %edx
                popl %ecx
                # Emitting j = (j - 1)
                pushl %ecx
                pushl %edx
# ________________assign______________________________________________
                  # Emitting (j - 1)
                  pushl %ecx
                  pushl %edx
                    # Emitting 1
                    pushl %ecx
                    pushl %edx
                    movl $1, %edi
                    popl %edx
                    popl %ecx
                    # Emitting j
                    pushl %ecx
                    pushl %edx
                    pushl %edi
# ____________________var_____________________________________________
                    movl -8(%ebp), %esi
                    popl %edi
                    popl %edx
                    popl %ecx
                  sub %edi, %esi
                  popl %edx
                  popl %ecx
                movl %esi, -8(%ebp)
                popl %edx
                popl %ecx
            jmp .L34
.L33:
              # Emitting nop
              pushl %ecx
              pushl %edx
              popl %edx
              popl %ecx
.L34:
        jmp .L15
.L16:
.L17:
        # Emitting if ((left < j)) {...} else {...}
        pushl %ecx
        pushl %edx
# ________ifElse______________________________________________________
          # Emitting (left < j)
          pushl %ecx
          pushl %edx
            # Emitting j
            pushl %ecx
            pushl %edx
# ____________var_____________________________________________________
            movl -8(%ebp), %esi
            popl %edx
            popl %ecx
            # Emitting left
            pushl %ecx
            pushl %edx
            pushl %esi
# ____________var_____________________________________________________
            movl 12(%ebp), %edi
            popl %esi
            popl %edx
            popl %ecx
          cmpl %esi, %edi
          setl %al
          movzbl %al, %edi
          popl %edx
          popl %ecx
        jge .L43
          # Emitting (...)
          pushl %ecx
          pushl %edx
            # Emitting this.sort(...)
            pushl %ecx
            pushl %edx
            pushl %ecx
            pushl %edx
              # Emitting this
              pushl %edx
              movl 8(%ebp), %ecx
              popl %edx
            cmpl $0, %ecx
            jne .L45
            movl $4, %eax
            jmp .ERROR_EXIT
.L45:
            movl 0(%ecx), %edx
            movl 8(%edx), %edx
            subl $4, %esp
              # Emitting j
              pushl %ecx
              pushl %edx
              pushl %edi
# ______________var___________________________________________________
              movl -8(%ebp), %esi
              popl %edi
              popl %edx
              popl %ecx
            pushl %esi
              # Emitting left
              pushl %ecx
              pushl %edx
              pushl %esi
              pushl %edi
# ______________var___________________________________________________
              movl 12(%ebp), %ebx
              popl %edi
              popl %esi
              popl %edx
              popl %ecx
            pushl %ebx
            pushl %ecx
            call %edx
            addl $12, %esp
            popl %edx
        jmp .L44
.L43:
          # Emitting nop
          pushl %esi
          pushl %edi
          popl %edi
          popl %esi
.L44:
        # Emitting if ((i < right)) {...} else {...}
        pushl %esi
        pushl %edi
# ________ifElse______________________________________________________
          # Emitting (i < right)
          pushl %esi
          pushl %edi
            # Emitting right
            pushl %esi
            pushl %edi
# ____________var_____________________________________________________
            movl 16(%ebp), %edx
            popl %edi
            popl %esi
            # Emitting i
            pushl %edx
            pushl %esi
            pushl %edi
# ____________var_____________________________________________________
            movl -4(%ebp), %ecx
            popl %edi
            popl %esi
            popl %edx
          cmpl %edx, %ecx
          setl %al
          movzbl %al, %ecx
          popl %edi
          popl %esi
        jge .L47
          # Emitting (...)
          pushl %esi
          pushl %edi
            # Emitting this.sort(...)
            pushl %esi
            pushl %edi
              # Emitting this
              pushl %ecx
              pushl %esi
              pushl %edi
              movl 8(%ebp), %edx
              popl %edi
              popl %esi
              popl %ecx
            cmpl $0, %edx
            jne .L49
            movl $4, %eax
            jmp .ERROR_EXIT
.L49:
            movl 0(%edx), %ecx
            movl 8(%ecx), %ecx
            subl $4, %esp
              # Emitting right
              pushl %ebx
              pushl %ecx
              pushl %edx
              pushl %esi
              pushl %edi
# ______________var___________________________________________________
              movl 16(%ebp), %eax
              popl %edi
              popl %esi
              popl %edx
              popl %ecx
              popl %ebx
            pushl %eax
              # Emitting i
              pushl %eax
              pushl %ebx
              pushl %ecx
              pushl %edx
              pushl %esi
              pushl %edi
# ______________var___________________________________________________
