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
pushl $1
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
    # Emitting void main(...) {...}
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    # variable b
    pushl $0
      # Emitting (...)
        # Emitting b = (((((1 < 5) && (6 > 1)) && (5 >= 2)) || (5 <= 5)) || (5 == 5))
# ________assign______________________________________________________
          # Emitting (((((1 < 5) && (6 > 1)) && (5 >= 2)) || (5 <= 5)) || (5 == 5))
            # Emitting ((((1 < 5) && (6 > 1)) && (5 >= 2)) || (5 <= 5))
              # Emitting (((1 < 5) && (6 > 1)) && (5 >= 2))
                # Emitting ((1 < 5) && (6 > 1))
                  # Emitting (6 > 1)
                    # Emitting 1
                    movl $1, %edi
                    # Emitting 6
                    movl $6, %esi
                  cmpl %edi, %esi
                  setg %al
                  movzbl %al, %esi
                  # Emitting (1 < 5)
                    # Emitting 5
                    movl $5, %edi
                    # Emitting 1
                    movl $1, %edx
                  cmpl %edi, %edx
                  setl %al
                  movzbl %al, %edx
                andl %esi, %edx
                cmpl $0, %edx
                # Emitting (5 >= 2)
                  # Emitting 2
                  movl $2, %esi
                  # Emitting 5
                  movl $5, %edi
                cmpl %esi, %edi
                setge %al
                movzbl %al, %edi
              andl %edi, %edx
              cmpl $0, %edx
              # Emitting (5 <= 5)
                # Emitting 5
                movl $5, %edi
                # Emitting 5
                movl $5, %esi
              cmpl %edi, %esi
              setle %al
              movzbl %al, %esi
            orl %esi, %edx
            cmpl $0, %edx
            # Emitting (5 == 5)
              # Emitting 5
              movl $5, %esi
              # Emitting 5
              movl $5, %edi
            cmpl %esi, %edi
            je .L2
            movl $0, %edi
            jmp .L3
.L2:
            movl $1, %edi
.L3:
          orl %edi, %edx
          cmpl $0, %edx
        movl %edx, -4(%ebp)
    addl $4, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
