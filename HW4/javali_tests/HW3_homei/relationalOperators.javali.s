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
pushl $5
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
    # Emitting int i1
    # Emitting int i2
    # Emitting boolean b1
    # Emitting boolean b2
    # Emitting void main(...) {...}
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
      # Emitting (...)
        # Emitting i1 = 1
# ________assign______________________________________________________
          # Emitting 1
          movl $1, %edi
        movl 8(%ebp), %esi
        movl %edi, 4(%esi)
        # Emitting i2 = 0
# ________assign______________________________________________________
          # Emitting 0
          movl $0, %edi
        movl 8(%ebp), %esi
        movl %edi, 8(%esi)
        # Emitting b1 = (i1 < i2)
# ________assign______________________________________________________
          # Emitting (i1 < i2)
            # Emitting i2
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 8(%edi), %edi
            # Emitting i1
            pushl $0
            pushl %edi
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 4(%edi), %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          cmpl %edi, %esi
          setl %al
          movzbl %al, %esi
        movl 8(%ebp), %edi
        movl %esi, 12(%edi)
        # Emitting b2 = (10 <= 5)
# ________assign______________________________________________________
          # Emitting (10 <= 5)
            # Emitting 5
            movl $5, %esi
            # Emitting 10
            pushl $0
            pushl %esi
            movl $10, %esi
# ____________swap needed_____________________________________________
            movl %esi, 4(%esp)
            popl %esi
            popl %edi
          cmpl %esi, %edi
          setle %al
          movzbl %al, %edi
        movl 8(%ebp), %esi
        movl %edi, 16(%esi)
        # Emitting b1 = (i1 > 0)
# ________assign______________________________________________________
          # Emitting (i1 > 0)
            # Emitting 0
            movl $0, %edi
            # Emitting i1
            pushl $0
            pushl %edi
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 4(%edi), %edi
# ____________swap needed_____________________________________________
            movl %edi, 4(%esp)
            popl %edi
            popl %esi
          cmpl %edi, %esi
          setg %al
          movzbl %al, %esi
        movl 8(%ebp), %edi
        movl %esi, 12(%edi)
        # Emitting b2 = (-(5) >= i2)
# ________assign______________________________________________________
          # Emitting (-(5) >= i2)
            # Emitting i2
# ____________var_____________________________________________________
            movl 8(%ebp), %esi
            movl 8(%esi), %esi
            # Emitting -(5)
            pushl $0
            pushl %esi
              # Emitting 5
              movl $5, %esi
            negl %esi
# ____________swap needed_____________________________________________
            movl %esi, 4(%esp)
            popl %esi
            popl %edi
          cmpl %esi, %edi
          setge %al
          movzbl %al, %edi
        movl 8(%ebp), %esi
        movl %edi, 16(%esi)
    addl $0, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
