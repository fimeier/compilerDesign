.section .data
	vtable_A:
		.int vtable_Object
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
    # Emitting int i
    # Emitting void main(...) {...}
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    # variable a
    pushl $0
    # variable arr
    pushl $0
      # Emitting (...)
        # Emitting a = new A()
# ________assign______________________________________________________
          # Emitting new A()
# __________newObject_________________________________________________
          pushl $4
          pushl $1
          call calloc
          addl $8, %esp
          movl $vtable_A, (%eax)
          movl %eax, %edi
        movl %edi, -4(%ebp)
        # Emitting arr = new A[][((1 + (2 * 3)) - ((4 / 5) % 6))]
# ________assign______________________________________________________
          # Emitting new A[][((1 + (2 * 3)) - ((4 / 5) % 6))]
            # Emitting ((1 + (2 * 3)) - ((4 / 5) % 6))
              # Emitting ((4 / 5) % 6)
                # Emitting (4 / 5)
                  # Emitting 5
                  movl $5, %edi
                  # Emitting 4
                  movl $4, %esi
                cmpl $0, %edi
                jne .L2
                movl $7, %eax
                jmp .ERROR_EXIT
.L2:
                pushl %edi
                pushl %esi
                popl %eax
                popl %ebx
                cltd
                idivl %ebx
                movl %eax, %esi
                # Emitting 6
                movl $6, %edi
              cmpl $0, %edi
              jne .L3
              movl $7, %eax
              jmp .ERROR_EXIT
.L3:
              pushl %edi
              pushl %esi
              popl %eax
              popl %ebx
              cltd
              idivl %ebx
              movl %edx, %esi
              # Emitting (1 + (2 * 3))
                # Emitting (2 * 3)
                  # Emitting 3
                  movl $3, %edi
                  # Emitting 2
                  movl $2, %edx
                imul %edi, %edx
                # Emitting 1
                movl $1, %edi
              add %edx, %edi
            sub %esi, %edi
          cmpl $0, %edi
          jge .L4
          movl $5, %eax
          jmp .ERROR_EXIT
.L4:
          addl $2, %edi
          pushl $4
          pushl %edi
          call calloc
          addl $8, %esp
          movl $vtable_Object, (%eax)
          movl %edi, 4(%eax)
          movl %eax, %esi
        movl %esi, -8(%ebp)
        # Emitting arr[((55 + 37) - (68 / i))] = a
# ________assign______________________________________________________
          # Emitting a
# __________var_______________________________________________________
          movl -4(%ebp), %esi
          # Emitting arr
# __________var_______________________________________________________
          movl -8(%ebp), %edx
          # Emitting ((55 + 37) - (68 / i))
            # Emitting (68 / i)
              # Emitting i
# ______________var___________________________________________________
              movl 8(%ebp), %ecx
              movl 4(%ecx), %ecx
              # Emitting 68
              movl $68, %ebx
            pushl %edx
            cmpl $0, %ecx
            jne .L5
            movl $7, %eax
            jmp .ERROR_EXIT
.L5:
            pushl %ecx
            pushl %ebx
            popl %eax
            popl %ebx
            cltd
            idivl %ebx
            movl %eax, %ebx
            popl %edx
            # Emitting (55 + 37)
              # Emitting 37
              movl $37, %ecx
              # Emitting 55
              movl $55, %eax
            add %ecx, %eax
          sub %ebx, %eax
        cmpl $0, %edx
        jne .L6
        movl $4, %eax
        jmp .ERROR_EXIT
.L6:
        cmpl $0, %eax
        jge .L7
        movl $3, %eax
        jmp .ERROR_EXIT
.L7:
        cmpl 4(%edx), %eax
        jl .L8
        movl $3, %eax
        jmp .ERROR_EXIT
.L8:
        imul $4, %eax
        addl $8, %eax
        addl %eax, %edx
        movl %esi, (%edx)
        # Emitting a = arr[((i + 42) - (30 / 4))]
# ________assign______________________________________________________
          # Emitting arr[((i + 42) - (30 / 4))]
            # Emitting arr
# ____________var_____________________________________________________
            movl -8(%ebp), %esi
            # Emitting ((i + 42) - (30 / 4))
              # Emitting (30 / 4)
                # Emitting 4
                movl $4, %edx
                # Emitting 30
                movl $30, %eax
              cmpl $0, %edx
              jne .L9
              movl $7, %eax
              jmp .ERROR_EXIT
.L9:
              pushl %edx
              pushl %eax
              popl %eax
              popl %ebx
              cltd
              idivl %ebx
              movl %eax, %eax
              # Emitting (i + 42)
                # Emitting 42
                movl $42, %edx
                # Emitting i
# ________________var_________________________________________________
                movl 8(%ebp), %ebx
                movl 4(%ebx), %ebx
              add %edx, %ebx
            sub %eax, %ebx
          cmpl $0, %esi
          jne .L10
          movl $4, %eax
          jmp .ERROR_EXIT
.L10:
          cmpl $0, %ebx
          jge .L11
          movl $3, %eax
          jmp .ERROR_EXIT
.L11:
          cmpl 4(%esi), %ebx
          jl .L12
          movl $3, %eax
          jmp .ERROR_EXIT
.L12:
          imul $4, %ebx
          addl $8, %ebx
          addl %ebx, %esi
          movl (%esi), %esi
        movl %esi, -4(%ebp)
    addl $8, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
  # Emitting class A {...}
