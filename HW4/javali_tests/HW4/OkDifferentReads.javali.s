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
    # Emitting int x
    # Emitting void main(...) {...}
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    # variable y
    pushl $0
    # variable arr
    pushl $0
      # Emitting (...)
        # Emitting write(1)
          # Emitting 1
          movl $1, %edi
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
        # Emitting y = read()
          # Emitting read()
          sub $16, %esp
          leal 8(%esp), %edi
          movl %edi, 4(%esp)
          movl $STR_D, 0(%esp)
          call scanf
          movl 8(%esp), %edi
          add $16, %esp
        movl %edi, -4(%ebp)
        # Emitting write((y + 1))
          # Emitting (y + 1)
            # Emitting 1
            movl $1, %edi
            # Emitting y
            movl -4(%ebp), %esi
          add %edi, %esi
        sub $16, %esp
        movl %esi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        # Emitting x = read()
          # Emitting read()
          sub $16, %esp
          leal 8(%esp), %esi
          movl %esi, 4(%esp)
          movl $STR_D, 0(%esp)
          call scanf
          movl 8(%esp), %esi
          add $16, %esp
        movl 8(%ebp), %edi
        movl %esi, 4(%edi)
        # Emitting write((x + 1))
          # Emitting (x + 1)
            # Emitting 1
            movl $1, %esi
            # Emitting x
            movl 8(%ebp), %edi
            movl 4(%edi), %edi
          add %esi, %edi
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
        # Emitting arr = new int[][64]
          # Emitting new int[][64]
            # Emitting 64
            movl $64, %edi
          addl $2, %edi
          pushl $4
          pushl %edi
          call calloc
          addl $8, %esp
          movl $vtable_Object, (%eax)
          movl %eax, %esi
        movl %esi, -8(%ebp)
        # Emitting arr[x] = read()
          # Emitting read()
          sub $16, %esp
          leal 8(%esp), %esi
          movl %esi, 4(%esp)
          movl $STR_D, 0(%esp)
          call scanf
          movl 8(%esp), %esi
          add $16, %esp
          # Emitting arr
          movl -8(%ebp), %edx
          # Emitting x
          movl 8(%ebp), %ecx
          movl 4(%ecx), %ecx
        imul $4, %ecx
        addl $8, %ecx
        addl %ecx, %edx
        movl %esi, (%edx)
        # Emitting write((arr[x] + 1))
          # Emitting (arr[x] + 1)
            # Emitting arr[x]
              # Emitting arr
              movl -8(%ebp), %esi
              # Emitting x
              movl 8(%ebp), %edx
              movl 4(%edx), %edx
            imul $4, %edx
            addl $8, %edx
            addl %edx, %esi
            movl (%esi), %esi
            # Emitting 1
            movl $1, %edx
          add %edx, %esi
        sub $16, %esp
        movl %esi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
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
