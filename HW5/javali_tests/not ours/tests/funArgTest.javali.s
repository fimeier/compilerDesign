vtablearr_Cell:
.int vtable_Object
vtablearr_Main:
.int vtable_Object
vtable_Object:
.int 0
vtablearr_int:
.int vtable_Object
vtablearr_boolean:
.int vtable_Object
vtable_Main:
.int vtable_Object
.int Main_main
.int Main_cellTest
vtable_Cell:
.int vtable_Object
vtablearr_Object:
.int vtable_Object
vtablearr_void:
.int vtable_Object
.section .data
STR_NL:
.string "\n"
STR_D:
.string "%d"
STR_F:
.string "%.5f"
SCANF_STR_F:
.string "%f"
.section .data
.section .text
# Javali$CheckCast function___________________________________________
Javali$CheckCast:
enter $8, $0
and $-16, %esp
sub $16, %esp
movl 8(%ebp), %ecx
movl 12(%ebp), %eax
cmpl $0, %eax
je label1
movl 0(%eax), %eax
label0:
cmpl %eax, %ecx
je label1
cmpl $0, %eax
je label2
movl 0(%eax), %eax
jmp label0
label2:
movl $1, 0(%esp)
call exit
label1:
leave
ret
# Javali$CheckNull function___________________________________________
Javali$CheckNull:
enter $8, $0
and $-16, %esp
sub $16, %esp
cmpl $0, 8(%ebp)
jne label3
movl $4, 0(%esp)
call exit
label3:
leave
ret
# Javali$CheckNonZero function________________________________________
Javali$CheckNonZero:
enter $8, $0
and $-16, %esp
sub $16, %esp
cmpl $0, 8(%ebp)
jne label4
movl $7, 0(%esp)
call exit
label4:
leave
ret
# Javali$CheckArraySize function______________________________________
Javali$CheckArraySize:
enter $8, $0
and $-16, %esp
sub $16, %esp
cmpl $0, 8(%ebp)
jge label5
movl $5, 0(%esp)
call exit
label5:
leave
ret
# Javali$CheckArrayBounds function____________________________________
Javali$CheckArrayBounds:
enter $8, $0
and $-16, %esp
sub $16, %esp
movl 12(%ebp), %ecx
movl 8(%ebp), %eax
cmpl $0, %ecx
jl label6
cmpl 4(%eax), %ecx
jge label6
leave
ret
label6:
movl $3, 0(%esp)
call exit
# Javali$Alloc function_______________________________________________
Javali$Alloc:
enter $8, $0
and $-16, %esp
sub $16, %esp
movl 8(%ebp), %eax
movl %eax, 0(%esp)
movl $1, 4(%esp)
call calloc
leave
ret
# Javali$PrintNewLine function________________________________________
Javali$PrintNewLine:
enter $8, $0
and $-16, %esp
sub $16, %esp
movl $STR_NL, 0(%esp)
call printf
leave
ret
# Javali$PrintInteger function________________________________________
Javali$PrintInteger:
enter $8, $0
and $-16, %esp
sub $16, %esp
movl 8(%ebp), %eax
movl %eax, 4(%esp)
movl $STR_D, 0(%esp)
call printf
leave
ret
# Javali$ReadInteger function_________________________________________
Javali$ReadInteger:
enter $8, $0
and $-16, %esp
sub $16, %esp
leal 8(%esp), %eax
movl %eax, 4(%esp)
movl $STR_D, 0(%esp)
call scanf
movl 8(%esp), %eax
leave
ret
# main() function_____________________________________________________
.globl main
main:
enter $8, $0
and $-16, %esp
  # Emitting new Main().main(...)
    # Emitting new Main().main(...)
    sub $12, %esp
      # Emitting new Main()
      push $4
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_Main, 0(%edi)
    push %edi
    # Load "this" pointer
    movl 0(%esp), %edi
    sub $12, %esp
    push %edi
    call Javali$CheckNull
    add $16, %esp
    movl 0(%edi), %edi
    movl 4(%edi), %edi
    call *%edi
    add $16, %esp
    movl %eax, %edi
movl $0, %eax
leave
ret
# Class Cell__________________________________________________________
  # 
# Class Main__________________________________________________________
  # 
  .section .text
# __Method Main.main__________________________________________________
  .globl Main_main
Main_main:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label7
# __Basic block 0_____________________________________________________
label7:
  # Exit to block 1
  jmp label8
# __Basic block 1_____________________________________________________
label8:
  # Return
  jmp label9
label9:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Main.cellTest______________________________________________
  .globl Main_cellTest
Main_cellTest:
  # Variable     Offset
  # c            -12
  # i            -16
  # implicit=8 localSlot=20 sum=28
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  jmp label10
# __Basic block 0_____________________________________________________
label10:
  # Exit to block 2
  jmp label12
# __Basic block 1_____________________________________________________
label11:
  # Return
  jmp label18
# __Basic block 2_____________________________________________________
label12:
  # Exit to block 3 if true, block 4 if false
    # Emitting (i < size)
      # Emitting i
      movl -16(%ebp), %edi
      # Emitting size
      movl 8(%ebp), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label14
  jmp label13
# __Basic block 3_____________________________________________________
label13:
    # Emitting c = new Cell()
      # Emitting new Cell()
      push $8
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_Cell, 0(%edi)
    movl %edi, -12(%ebp)
    # Emitting i = (i + 1)
      # Emitting (i + 1)
        # Emitting i
        movl -16(%ebp), %edi
        # Emitting 1
        movl $1, %esi
      addl %esi, %edi
    movl %edi, -16(%ebp)
  # Exit to block 2
  jmp label12
# __Basic block 4_____________________________________________________
label14:
    # Emitting i = -(2)
      # Emitting -(2)
        # Emitting 2
        movl $2, %edi
      negl %edi
    movl %edi, -16(%ebp)
  # Exit to block 5
  jmp label15
# __Basic block 5_____________________________________________________
label15:
  # Exit to block 6 if true, block 7 if false
    # Emitting (i < (size + 2))
      # Emitting i
      movl -16(%ebp), %edi
      # Emitting (size + 2)
        # Emitting size
        movl 8(%ebp), %esi
        # Emitting 2
        movl $2, %edx
      addl %edx, %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label17
  jmp label16
# __Basic block 6_____________________________________________________
label16:
    # Emitting write(c.k)
      # Emitting c.k
        # Emitting c
        movl -12(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 4(%edi), %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting i = (i + 1)
      # Emitting (i + 1)
        # Emitting i
        movl -16(%ebp), %edi
        # Emitting 1
        movl $1, %esi
      addl %esi, %edi
    movl %edi, -16(%ebp)
  # Exit to block 5
  jmp label15
# __Basic block 7_____________________________________________________
label17:
  # Exit to block 1
  jmp label11
label18:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
