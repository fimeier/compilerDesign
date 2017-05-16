.section .data
	vtable_Main_array:
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
.section .text
.global main

main:
pushl %ebp
movl %esp, %ebp
pushl $4
pushl $2
call calloc
addl $8, %esp
movl $vtable_Main, (%eax)
pushl %eax
call Main_main
addl $4, %esp
movl %ebp, %esp
popl %ebp
movl $0, %eax
ret
  # Emitting class Main {...}
    # Emitting int[] x
    # Emitting void main(...) {...}
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    # variable i
    pushl $0
      # Emitting (...)
        # Emitting x = new int[][3]
          # Emitting new int[][3]
            # Emitting 3
            movl $3, %edi
          imul $1, %edi
          addl $2, %edi
          pushl $4
          pushl %edi
          call calloc
          addl $8, %esp
          movl $vtable_Object, (%eax)
          movl %eax, %esi
        movl 8(%ebp), %edx
        movl %esi, 4(%edx)
        # Emitting x[0] = 3
          # Emitting 3
          movl $3, %esi
          # Emitting x
          movl 8(%ebp), %edx
          movl 4(%edx), %edx
          # Emitting 0
          movl $0, %ecx
        imul $1, %ecx
        addl $8, %ecx
        addl %ecx, %edx
        movl %esi, (%edx)
        # Emitting x[1] = 4
          # Emitting 4
          movl $4, %esi
          # Emitting x
          movl 8(%ebp), %edx
          movl 4(%edx), %edx
          # Emitting 1
          movl $1, %ecx
        imul $1, %ecx
        addl $8, %ecx
        addl %ecx, %edx
        movl %esi, (%edx)
        # Emitting x[2] = 5
          # Emitting 5
          movl $5, %esi
          # Emitting x
          movl 8(%ebp), %edx
          movl 4(%edx), %edx
          # Emitting 2
          movl $2, %ecx
        imul $1, %ecx
        addl $8, %ecx
        addl %ecx, %edx
        movl %esi, (%edx)
        # Emitting i = ((x[0] + x[1]) + x[2])
          # Emitting ((x[0] + x[1]) + x[2])
            # Emitting (x[0] + x[1])
              # Emitting x[1]
                # Emitting x
                movl 8(%ebp), %esi
                movl 4(%esi), %esi
                # Emitting 1
                movl $1, %edx
              imul $4, %edx
              addl $8, %edx
              addl %edx, %esi
              movl (%esi), %esi
              # Emitting x[0]
                # Emitting x
                movl 8(%ebp), %edx
                movl 4(%edx), %edx
                # Emitting 0
                movl $0, %ecx
              imul $4, %ecx
              addl $8, %ecx
              addl %ecx, %edx
              movl (%edx), %edx
            add %esi, %edx
            # Emitting x[2]
              # Emitting x
              movl 8(%ebp), %esi
              movl 4(%esi), %esi
              # Emitting 2
              movl $2, %ecx
            imul $4, %ecx
            addl $8, %ecx
            addl %ecx, %esi
            movl (%esi), %esi
          add %esi, %edx
        movl %edx, -4(%ebp)
        # Emitting write(i)
          # Emitting i
          movl -4(%ebp), %edx
        sub $16, %esp
        movl %edx, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
    addl $4, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
