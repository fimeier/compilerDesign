.section .data
	vtable_Sub:
		.int vtable_Super
	vtable_Super:
		.int vtable_Object
	vtable_Main_array:
		.int vtable_Object
	vtable_int_array:
		.int vtable_Object
	vtable_Super_array:
		.int vtable_Object
	vtable_Object:
		.int 0
	vtable_Main:
		.int vtable_Object
		.int Main_main
	vtable_boolean_array:
		.int vtable_Object
	vtable_Sub_array:
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
    # variable super
    pushl $0
    # variable sub
    pushl $0
      # Emitting (...)
        # Emitting super = sub[0]
# ________assign______________________________________________________
          # Emitting sub[0]
            # Emitting sub
# ____________var_____________________________________________________
            movl -8(%ebp), %edi
            # Emitting 0
            pushl %edi
            movl $0, %esi
            popl %edi
          cmpl $0, %edi
          jne .L2
          movl $4, %eax
          jmp .ERROR_EXIT
.L2:
          cmpl $0, %esi
          jge .L3
          movl $3, %eax
          jmp .ERROR_EXIT
.L3:
          cmpl 4(%edi), %esi
          jl .L4
          movl $3, %eax
          jmp .ERROR_EXIT
.L4:
          imul $4, %esi
          addl $8, %esi
          addl %esi, %edi
          movl (%edi), %edi
        movl %edi, -4(%ebp)
    addl $8, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
  # Emitting class Sub {...}
  # Emitting class Super {...}
