vtable_A:
.int vtable_Object
.int A_override
.int A_base
vtable_B:
.int vtable_A
.int B_override
.int A_base
.int B_sub
vtablearr_A:
.int vtable_Object
vtablearr_B:
.int vtable_Object
vtablearr_int:
.int vtable_Object
vtablearr_Main:
.int vtable_Object
vtable_Object:
.int 0
vtablearr_boolean:
.int vtable_Object
vtable_Main:
.int vtable_Object
.int Main_main
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
# Class A_____________________________________________________________
  # 
  .section .text
# __Method A.override_________________________________________________
  .globl A_override
A_override:
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
    # Emitting write(0)
      # Emitting 0
      movl $0, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
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
# __Method A.base_____________________________________________________
  .globl A_base
A_base:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label10
# __Basic block 0_____________________________________________________
label10:
    # Emitting write(1)
      # Emitting 1
      movl $1, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
  # Exit to block 1
  jmp label11
# __Basic block 1_____________________________________________________
label11:
  # Return
  jmp label12
label12:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
# Class B_____________________________________________________________
  # 
  .section .text
# __Method B.override_________________________________________________
  .globl B_override
B_override:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label13
# __Basic block 0_____________________________________________________
label13:
    # Emitting write(2)
      # Emitting 2
      movl $2, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
  # Exit to block 1
  jmp label14
# __Basic block 1_____________________________________________________
label14:
  # Return
  jmp label15
label15:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method B.sub______________________________________________________
  .globl B_sub
B_sub:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label16
# __Basic block 0_____________________________________________________
label16:
    # Emitting write(3)
      # Emitting 3
      movl $3, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
  # Exit to block 1
  jmp label17
# __Basic block 1_____________________________________________________
label17:
  # Return
  jmp label18
label18:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
# Class Main__________________________________________________________
  # 
  .section .text
# __Method Main.main__________________________________________________
  .globl Main_main
Main_main:
  # Variable     Offset
  # a            -12
  # b            -16
  # implicit=8 localSlot=20 sum=28
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  jmp label19
# __Basic block 0_____________________________________________________
label19:
    # Emitting a = new A()
      # Emitting new A()
      push $4
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_A, 0(%edi)
    movl %edi, -12(%ebp)
    # Emitting b = new B()
      # Emitting new B()
      push $4
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_B, 0(%edi)
    movl %edi, -16(%ebp)
    # Emitting a = b
      # Emitting b
      movl -16(%ebp), %edi
    movl %edi, -12(%ebp)
  # Exit to block 1
  jmp label20
# __Basic block 1_____________________________________________________
label20:
  # Return
  jmp label21
label21:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
