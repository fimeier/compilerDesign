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
pushl $4
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
    # Emitting boolean b1
    # Emitting boolean b2
    # Emitting void main(...) {...}
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting b2 = false
# ________assign______________________________________________________
          # Emitting false
          movl $0, %edi
        movl 8(%ebp), %esi
        movl %edi, 12(%esi)
        # Emitting b1 = (true || b2)
# ________assign______________________________________________________
          # Emitting (true || b2)
            # Emitting b2
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 12(%edi), %edi
            # Emitting true
            movl $1, %esi
          orl %edi, %esi
          cmpl $0, %esi
        movl 8(%ebp), %edi
        movl %esi, 8(%edi)
        # Emitting b1 = !(true)
# ________assign______________________________________________________
          # Emitting !(true)
            # Emitting true
            movl $1, %esi
          negl %esi
          incl %esi
          cmpl $0, %esi
        movl 8(%ebp), %edi
        movl %esi, 8(%edi)
        # Emitting b1 = !((b2 && b1))
# ________assign______________________________________________________
          # Emitting !((b2 && b1))
            # Emitting (b2 && b1)
              # Emitting b1
# ______________var___________________________________________________
              movl 8(%ebp), %esi
              movl 8(%esi), %esi
              # Emitting b2
# ______________var___________________________________________________
              movl 8(%ebp), %edi
              movl 12(%edi), %edi
            andl %esi, %edi
            cmpl $0, %edi
          negl %edi
          incl %edi
          cmpl $0, %edi
        movl 8(%ebp), %esi
        movl %edi, 8(%esi)
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
