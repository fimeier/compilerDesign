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
          movl 4(%edi), %edi
        movl %edi, -4(%ebp)
        # Emitting r1.a = r2.a
# ________assign______________________________________________________
          # Emitting r2.a
            # Emitting r2
# ____________var_____________________________________________________
            movl 16(%ebp), %edi
          movl 4(%edi), %edi
          # Emitting r1
# __________var_______________________________________________________
          movl 12(%ebp), %esi
        movl %edi, 4(%esi)
        # Emitting r2.a = temp
# ________assign______________________________________________________
          # Emitting temp
# __________var_______________________________________________________
          movl -4(%ebp), %edi
          # Emitting r2
# __________var_______________________________________________________
          movl 16(%ebp), %esi
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
.L2:
                imul $4, %esi
                addl $8, %esi
                addl %esi, %edi
                movl (%edi), %edi
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
.L3:
                imul $4, %edx
                addl $8, %edx
                addl %edx, %esi
                movl (%esi), %esi
              movl 4(%esi), %esi
            add %edi, %esi
            # Emitting 2
            movl $2, %edi
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
        jg .L4
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
.L6:
                  imul $4, %esi
                  addl $8, %esi
                  addl %esi, %edi
                  movl (%edi), %edi
                movl 4(%edi), %edi
                # Emitting m
# ________________var_________________________________________________
                movl -12(%ebp), %esi
              cmpl %esi, %edi
              setl %al
              movzbl %al, %edi
            jge .L7
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
            jmp .L8
.L7:
.L8:
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
.L9:
                  imul $4, %edi
                  addl $8, %edi
                  addl %edi, %esi
                  movl (%esi), %esi
                movl 4(%esi), %esi
                # Emitting m
# ________________var_________________________________________________
                movl -12(%ebp), %edi
              cmpl %edi, %esi
              setg %al
              movzbl %al, %esi
            jle .L10
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
            jmp .L11
.L10:
.L11:
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
            jg .L12
              # Emitting (...)
                # Emitting this.swap(...)
                subl $4, %esp
                  # Emitting a[j]
                    # Emitting a
# ____________________var_____________________________________________
                    movl 8(%ebp), %edi
                    movl 4(%edi), %edi
                    # Emitting j
# ____________________var_____________________________________________
                    movl -8(%ebp), %edx
.L14:
                  imul $4, %edx
                  addl $8, %edx
                  addl %edx, %edi
                  movl (%edi), %edi
                pushl %edi
                  # Emitting a[i]
                    # Emitting a
# ____________________var_____________________________________________
                    movl 8(%ebp), %edx
                    movl 4(%edx), %edx
                    # Emitting i
# ____________________var_____________________________________________
                    movl -4(%ebp), %ecx
.L15:
                  imul $4, %ecx
                  addl $8, %ecx
                  addl %ecx, %edx
                  movl (%edx), %edx
                pushl %edx
                  # Emitting this
                  movl 8(%ebp), %edx
                pushl %edx
                call Main_swap
                addl $12, %esp
                popl %edx
                # Emitting i = (i + 1)
# ________________assign______________________________________________
                  # Emitting (i + 1)
                    # Emitting 1
                    movl $1, %edx
                    # Emitting i
# ____________________var_____________________________________________
                    movl -4(%ebp), %ecx
                  add %edx, %ecx
                movl %ecx, -4(%ebp)
                # Emitting j = (j - 1)
# ________________assign______________________________________________
                  # Emitting (j - 1)
                    # Emitting 1
                    movl $1, %ecx
                    # Emitting j
# ____________________var_____________________________________________
                    movl -8(%ebp), %edx
                  sub %ecx, %edx
                movl %edx, -8(%ebp)
            jmp .L13
.L12:
              # Emitting nop
.L13:
        jmp .L5
.L4:
.L5:
        # Emitting if ((left < j)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting (left < j)
            # Emitting j
# ____________var_____________________________________________________
            movl -8(%ebp), %edx
            # Emitting left
# ____________var_____________________________________________________
            movl 12(%ebp), %ecx
          cmpl %edx, %ecx
          setl %al
          movzbl %al, %ecx
        jge .L16
          # Emitting (...)
            # Emitting this.sort(...)
            subl $4, %esp
              # Emitting j
# ______________var___________________________________________________
              movl -8(%ebp), %edx
            pushl %edx
              # Emitting left
# ______________var___________________________________________________
              movl 12(%ebp), %ebx
            pushl %ebx
              # Emitting this
              movl 8(%ebp), %ebx
            pushl %ebx
            call Main_sort
            addl $12, %esp
            popl %ebx
        jmp .L17
.L16:
          # Emitting nop
.L17:
        # Emitting if ((i < right)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting (i < right)
            # Emitting right
# ____________var_____________________________________________________
            movl 16(%ebp), %ebx
            # Emitting i
# ____________var_____________________________________________________
            movl -4(%ebp), %eax
          cmpl %ebx, %eax
          setl %al
          movzbl %al, %eax
        jge .L18
          # Emitting (...)
            # Emitting this.sort(...)
            pushl %ecx
            pushl %edx
            subl $4, %esp
              # Emitting right
# ______________var___________________________________________________
              movl 16(%ebp), %ecx
            pushl %ecx
              # Emitting i
# ______________var___________________________________________________
              movl -4(%ebp), %eax
            pushl %eax
              # Emitting this
              movl 8(%ebp), %eax
            pushl %eax
            call Main_sort
            addl $12, %esp
            popl %eax
        jmp .L19
.L18:
          # Emitting nop
.L19:
    addl $12, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
    # Emitting void main(...) {...}
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    pushl %esi
    pushl %edi
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
        movl %edi, -12(%ebp)
        # Emitting a = new Record[][SIZE]
# ________assign______________________________________________________
          # Emitting new Record[][SIZE]
            # Emitting SIZE
# ____________var_____________________________________________________
            movl -12(%ebp), %edi
          cmpl $0, %edi
          jge .L20
          movl $5, %eax
          jmp .ERROR_EXIT
.L20:
          addl $2, %edi
          pushl $4
          pushl %edi
          call calloc
          addl $8, %esp
          movl $vtable_Object, (%eax)
          movl %edi, 4(%eax)
          movl %eax, %esi
        movl 8(%ebp), %eax
        movl %esi, 4(%eax)
        # Emitting j = 0
# ________assign______________________________________________________
          # Emitting 0
          movl $0, %esi
        movl %esi, -16(%ebp)
        # Emitting while ((j < SIZE)) {...}
# ________whileLoop___________________________________________________
          # Emitting (j < SIZE)
            # Emitting SIZE
# ____________var_____________________________________________________
            movl -12(%ebp), %esi
            # Emitting j
# ____________var_____________________________________________________
            movl -16(%ebp), %eax
          cmpl %esi, %eax
          setl %al
          movzbl %al, %eax
        jge .L21
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
              movl %eax, %eax
              # Emitting a
# ______________var___________________________________________________
              movl 8(%ebp), %esi
              movl 4(%esi), %esi
              # Emitting j
# ______________var___________________________________________________
              movl -16(%ebp), %ebx
            imul $4, %ebx
            addl $8, %ebx
            addl %ebx, %esi
            movl %eax, (%esi)
            # Emitting j = (j + 1)
# ____________assign__________________________________________________
              # Emitting (j + 1)
                # Emitting 1
                movl $1, %eax
                # Emitting j
# ________________var_________________________________________________
                movl -16(%ebp), %esi
              add %eax, %esi
            movl %esi, -16(%ebp)
        jmp .L22
.L21:
.L22:
        # Emitting a[0].a = 5
# ________assign______________________________________________________
          # Emitting 5
          movl $5, %esi
          # Emitting a[0]
            # Emitting a
# ____________var_____________________________________________________
            movl 8(%ebp), %eax
            movl 4(%eax), %eax
            # Emitting 0
            movl $0, %ebx
.L23:
          imul $4, %ebx
          addl $8, %ebx
          addl %ebx, %eax
          movl (%eax), %eax
        movl %esi, 4(%eax)
        # Emitting a[1].a = 3
# ________assign______________________________________________________
          # Emitting 3
          movl $3, %esi
          # Emitting a[1]
            # Emitting a
# ____________var_____________________________________________________
            movl 8(%ebp), %eax
            movl 4(%eax), %eax
            # Emitting 1
            movl $1, %ebx
.L24:
          imul $4, %ebx
          addl $8, %ebx
          addl %ebx, %eax
          movl (%eax), %eax
        movl %esi, 4(%eax)
        # Emitting a[2].a = 1
# ________assign______________________________________________________
          # Emitting 1
          movl $1, %esi
          # Emitting a[2]
            # Emitting a
# ____________var_____________________________________________________
            movl 8(%ebp), %eax
            movl 4(%eax), %eax
            # Emitting 2
            movl $2, %ebx
.L25:
          imul $4, %ebx
          addl $8, %ebx
          addl %ebx, %eax
          movl (%eax), %eax
        movl %esi, 4(%eax)
        # Emitting a[3].a = 4
# ________assign______________________________________________________
          # Emitting 4
          movl $4, %esi
          # Emitting a[3]
            # Emitting a
# ____________var_____________________________________________________
            movl 8(%ebp), %eax
            movl 4(%eax), %eax
            # Emitting 3
            movl $3, %ebx
.L26:
          imul $4, %ebx
          addl $8, %ebx
          addl %ebx, %eax
          movl (%eax), %eax
        movl %esi, 4(%eax)
        # Emitting a[4].a = 2
# ________assign______________________________________________________
          # Emitting 2
          movl $2, %esi
          # Emitting a[4]
            # Emitting a
# ____________var_____________________________________________________
            movl 8(%ebp), %eax
            movl 4(%eax), %eax
            # Emitting 4
            movl $4, %ebx
.L27:
          imul $4, %ebx
          addl $8, %ebx
          addl %ebx, %eax
          movl (%eax), %eax
        movl %esi, 4(%eax)
        # Emitting j = 0
# ________assign______________________________________________________
          # Emitting 0
          movl $0, %esi
        movl %esi, -16(%ebp)
        # Emitting while ((j < SIZE)) {...}
# ________whileLoop___________________________________________________
          # Emitting (j < SIZE)
            # Emitting SIZE
# ____________var_____________________________________________________
            movl -12(%ebp), %esi
            # Emitting j
# ____________var_____________________________________________________
            movl -16(%ebp), %eax
          cmpl %esi, %eax
          setl %al
          movzbl %al, %eax
        jge .L28
          # Emitting (...)
            # Emitting a[j].print(...)
            pushl %ecx
            pushl %edx
            subl $4, %esp
              # Emitting a[j]
                # Emitting a
# ________________var_________________________________________________
                movl 8(%ebp), %edx
                movl 4(%edx), %edx
                # Emitting j
# ________________var_________________________________________________
                movl -16(%ebp), %ecx
.L30:
              imul $4, %ecx
              addl $8, %ecx
              addl %ecx, %edx
              movl (%edx), %edx
            pushl %edx
            call Record_print
            addl $4, %esp
            popl %edx
            # Emitting j = (j + 1)
# ____________assign__________________________________________________
              # Emitting (j + 1)
                # Emitting 1
                movl $1, %edx
                # Emitting j
# ________________var_________________________________________________
                movl -16(%ebp), %ecx
              add %edx, %ecx
            movl %ecx, -16(%ebp)
        jmp .L29
.L28:
.L29:
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        # Emitting this.sort(...)
        subl $4, %esp
          # Emitting 4
          movl $4, %edx
        pushl %edx
          # Emitting 0
          movl $0, %eax
        pushl %eax
          # Emitting this
          movl 8(%ebp), %eax
        pushl %eax
        call Main_sort
        addl $12, %esp
        popl %eax
        # Emitting j = 0
# ________assign______________________________________________________
          # Emitting 0
          movl $0, %eax
        movl %eax, -16(%ebp)
        # Emitting while ((j < SIZE)) {...}
# ________whileLoop___________________________________________________
          # Emitting (j < SIZE)
            # Emitting SIZE
# ____________var_____________________________________________________
            movl -12(%ebp), %eax
            # Emitting j
# ____________var_____________________________________________________
            movl -16(%ebp), %esi
          cmpl %eax, %esi
          setl %al
          movzbl %al, %esi
        jge .L31
          # Emitting (...)
            # Emitting a[j].print(...)
            pushl %ecx
            pushl %edx
            subl $4, %esp
              # Emitting a[j]
                # Emitting a
# ________________var_________________________________________________
                movl 8(%ebp), %edx
                movl 4(%edx), %edx
                # Emitting j
# ________________var_________________________________________________
                movl -16(%ebp), %ecx
.L33:
              imul $4, %ecx
              addl $8, %ecx
              addl %ecx, %edx
              movl (%edx), %edx
            pushl %edx
            call Record_print
            addl $4, %esp
            popl %edx
            # Emitting j = (j + 1)
# ____________assign__________________________________________________
              # Emitting (j + 1)
                # Emitting 1
                movl $1, %edx
                # Emitting j
# ________________var_________________________________________________
                movl -16(%ebp), %ecx
              add %edx, %ecx
            movl %ecx, -16(%ebp)
        jmp .L32
.L31:
.L32:
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
    addl $8, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
