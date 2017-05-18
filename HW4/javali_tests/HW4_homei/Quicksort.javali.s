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
# __________var_______________________________________________________
          movl 12(%ebp), %esi
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
# __________var_______________________________________________________
          movl 16(%ebp), %esi
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
# __________________var_______________________________________________
                  movl 16(%ebp), %esi
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
                # Emitting a[left]
                  # Emitting a
# __________________var_______________________________________________
                  movl 8(%ebp), %esi
                  movl 4(%esi), %esi
                  # Emitting left
# __________________var_______________________________________________
                  movl 12(%ebp), %edx
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
              cmpl $0, %esi
              jne .L13
              movl $4, %eax
              jmp .ERROR_EXIT
.L13:
              movl 4(%esi), %esi
            add %edi, %esi
            # Emitting 2
            movl $2, %edi
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
          # Emitting (i <= j)
            # Emitting j
# ____________var_____________________________________________________
            movl -8(%ebp), %esi
            # Emitting i
# ____________var_____________________________________________________
            movl -4(%ebp), %edi
          cmpl %esi, %edi
          setle %al
          movzbl %al, %edi
        jg .L15
          # Emitting (...)
            # Emitting while ((a[i].a < m)) {...}
# ____________whileLoop_______________________________________________
              # Emitting (a[i].a < m)
                # Emitting a[i].a
                  # Emitting a[i]
                    # Emitting a
# ____________________var_____________________________________________
                    movl 8(%ebp), %edi
                    movl 4(%edi), %edi
                    # Emitting i
# ____________________var_____________________________________________
                    movl -4(%ebp), %esi
                  cmpl $0, %edi
                  jne .L17
                  movl $4, %eax
                  jmp .ERROR_EXIT
.L17:
                  cmpl $0, %esi
                  jge .L18
                  movl $3, %eax
                  jmp .ERROR_EXIT
.L18:
                  cmpl 4(%edi), %esi
                  jl .L19
                  movl $3, %eax
                  jmp .ERROR_EXIT
.L19:
                  imul $4, %esi
                  addl $8, %esi
                  addl %esi, %edi
                  movl (%edi), %edi
                cmpl $0, %edi
                jne .L20
                movl $4, %eax
                jmp .ERROR_EXIT
.L20:
                movl 4(%edi), %edi
                # Emitting m
# ________________var_________________________________________________
                movl -12(%ebp), %esi
              cmpl %esi, %edi
              setl %al
              movzbl %al, %edi
            jge .L21
              # Emitting (...)
                # Emitting i = (i + 1)
# ________________assign______________________________________________
                  # Emitting (i + 1)
                    # Emitting 1
                    movl $1, %edi
                    # Emitting i
# ____________________var_____________________________________________
                    movl -4(%ebp), %esi
                  add %edi, %esi
                movl %esi, -4(%ebp)
            jmp .L22
.L21:
.L22:
            # Emitting while ((a[j].a > m)) {...}
# ____________whileLoop_______________________________________________
              # Emitting (a[j].a > m)
                # Emitting a[j].a
                  # Emitting a[j]
                    # Emitting a
# ____________________var_____________________________________________
                    movl 8(%ebp), %esi
                    movl 4(%esi), %esi
                    # Emitting j
# ____________________var_____________________________________________
                    movl -8(%ebp), %edi
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
                cmpl $0, %esi
                jne .L26
                movl $4, %eax
                jmp .ERROR_EXIT
.L26:
                movl 4(%esi), %esi
                # Emitting m
# ________________var_________________________________________________
                movl -12(%ebp), %edi
              cmpl %edi, %esi
              setg %al
              movzbl %al, %esi
            jle .L27
              # Emitting (...)
                # Emitting j = (j - 1)
# ________________assign______________________________________________
                  # Emitting (j - 1)
                    # Emitting 1
                    movl $1, %esi
                    # Emitting j
# ____________________var_____________________________________________
                    movl -8(%ebp), %edi
                  sub %esi, %edi
                movl %edi, -8(%ebp)
            jmp .L28
.L27:
.L28:
            # Emitting if ((i <= j)) {...} else {...}
# ____________ifElse__________________________________________________
              # Emitting (i <= j)
                # Emitting j
# ________________var_________________________________________________
                movl -8(%ebp), %edi
                # Emitting i
# ________________var_________________________________________________
                movl -4(%ebp), %esi
              cmpl %edi, %esi
              setle %al
              movzbl %al, %esi
            jg .L29
              # Emitting (...)
                # Emitting this.swap(...)
                  # Emitting this
                  movl 8(%ebp), %edi
                cmpl $0, %edi
                jne .L31
                movl $4, %eax
                jmp .ERROR_EXIT
.L31:
                movl 0(%edi), %esi
                movl 4(%esi), %esi
                subl $4, %esp
                  # Emitting a[j]
                    # Emitting a
# ____________________var_____________________________________________
                    movl 8(%ebp), %ecx
                    movl 4(%ecx), %ecx
                    # Emitting j
# ____________________var_____________________________________________
                    movl -8(%ebp), %ebx
                  cmpl $0, %ecx
                  jne .L32
                  movl $4, %eax
                  jmp .ERROR_EXIT
.L32:
                  cmpl $0, %ebx
                  jge .L33
                  movl $3, %eax
                  jmp .ERROR_EXIT
.L33:
                  cmpl 4(%ecx), %ebx
                  jl .L34
                  movl $3, %eax
                  jmp .ERROR_EXIT
.L34:
                  imul $4, %ebx
                  addl $8, %ebx
                  addl %ebx, %ecx
                  movl (%ecx), %ecx
                pushl %ecx
                  # Emitting a[i]
                    # Emitting a
# ____________________var_____________________________________________
                    movl 8(%ebp), %ebx
                    movl 4(%ebx), %ebx
                    # Emitting i
# ____________________var_____________________________________________
                    movl -4(%ebp), %eax
                  cmpl $0, %ebx
                  jne .L35
                  movl $4, %eax
                  jmp .ERROR_EXIT
.L35:
                  cmpl $0, %eax
                  jge .L36
                  movl $3, %eax
                  jmp .ERROR_EXIT
.L36:
                  cmpl 4(%ebx), %eax
                  jl .L37
                  movl $3, %eax
                  jmp .ERROR_EXIT
.L37:
                  imul $4, %eax
                  addl $8, %eax
                  addl %eax, %ebx
                  movl (%ebx), %ebx
                pushl %ebx
                pushl %edi
                call %esi
                addl $12, %esp
                popl %esi
                # Emitting i = (i + 1)
# ________________assign______________________________________________
                  # Emitting (i + 1)
                    # Emitting 1
                    movl $1, %esi
                    # Emitting i
# ____________________var_____________________________________________
                    movl -4(%ebp), %edi
                  add %esi, %edi
                movl %edi, -4(%ebp)
                # Emitting j = (j - 1)
# ________________assign______________________________________________
                  # Emitting (j - 1)
                    # Emitting 1
                    movl $1, %edi
                    # Emitting j
# ____________________var_____________________________________________
                    movl -8(%ebp), %esi
                  sub %edi, %esi
                movl %esi, -8(%ebp)
            jmp .L30
.L29:
              # Emitting nop
.L30:
        jmp .L16
.L15:
.L16:
        # Emitting if ((left < j)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting (left < j)
            # Emitting j
# ____________var_____________________________________________________
            movl -8(%ebp), %esi
            # Emitting left
# ____________var_____________________________________________________
            movl 12(%ebp), %edi
          cmpl %esi, %edi
          setl %al
          movzbl %al, %edi
        jge .L38
          # Emitting (...)
            # Emitting this.sort(...)
            pushl %ecx
            pushl %edx
              # Emitting this
              movl 8(%ebp), %ecx
            cmpl $0, %ecx
            jne .L40
            movl $4, %eax
            jmp .ERROR_EXIT
.L40:
            movl 0(%ecx), %edx
            movl 8(%edx), %edx
            subl $4, %esp
              # Emitting j
# ______________var___________________________________________________
              movl -8(%ebp), %esi
            pushl %esi
              # Emitting left
# ______________var___________________________________________________
              movl 12(%ebp), %ebx
            pushl %ebx
            pushl %ecx
            call %edx
            addl $12, %esp
            popl %edx
        jmp .L39
.L38:
          # Emitting nop
.L39:
        # Emitting if ((i < right)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting (i < right)
            # Emitting right
# ____________var_____________________________________________________
            movl 16(%ebp), %edx
            # Emitting i
# ____________var_____________________________________________________
            movl -4(%ebp), %ecx
          cmpl %edx, %ecx
          setl %al
          movzbl %al, %ecx
        jge .L41
          # Emitting (...)
            # Emitting this.sort(...)
              # Emitting this
              movl 8(%ebp), %edx
            cmpl $0, %edx
            jne .L43
            movl $4, %eax
            jmp .ERROR_EXIT
.L43:
            movl 0(%edx), %ecx
            movl 8(%ecx), %ecx
            subl $4, %esp
              # Emitting right
# ______________var___________________________________________________
              movl 16(%ebp), %eax
            pushl %eax
              # Emitting i
# ______________var___________________________________________________
