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
# Class Main__________________________________________________________
  # 
  .section .text
# __Method Main.main__________________________________________________
  .globl Main_main
Main_main:
  # Variable     Offset
  # a            -12
  # b            -16
  # c            -20
  # d            -24
  # e            -28
  # f            -32
  # g            -36
  # implicit=8 localSlot=40 sum=48
  enter $40, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  movl $0, -20(%ebp)
  movl $0, -24(%ebp)
  movl $0, -28(%ebp)
  movl $0, -32(%ebp)
  movl $0, -36(%ebp)
  jmp label7
# __Basic block 0_____________________________________________________
label7:
    # Emitting a = (false || false)
      # Emitting (false || false)
        # Emitting false
        movl $0, %edi
        # Emitting false
        movl $0, %esi
      orl %esi, %edi
    movl %edi, -12(%ebp)
    # Emitting b = (false || true)
      # Emitting (false || true)
        # Emitting false
        movl $0, %edi
        # Emitting true
        movl $1, %esi
      orl %esi, %edi
    movl %edi, -16(%ebp)
    # Emitting c = (true || false)
      # Emitting (true || false)
        # Emitting true
        movl $1, %edi
        # Emitting false
        movl $0, %esi
      orl %esi, %edi
    movl %edi, -20(%ebp)
    # Emitting d = (true && false)
      # Emitting (true && false)
        # Emitting true
        movl $1, %edi
        # Emitting false
        movl $0, %esi
      andl %esi, %edi
    movl %edi, -24(%ebp)
    # Emitting e = (false && false)
      # Emitting (false && false)
        # Emitting false
        movl $0, %edi
        # Emitting false
        movl $0, %esi
      andl %esi, %edi
    movl %edi, -28(%ebp)
  # Exit to block 2 if true, block 3 if false
    # Emitting a
    movl -12(%ebp), %edi
  cmpl $0, %edi
  je label10
  jmp label9
# __Basic block 1_____________________________________________________
label8:
  # Return
  jmp label27
# __Basic block 2_____________________________________________________
label9:
  # Exit to block 4 if true, block 5 if false
    # Emitting ((b || a) || c)
      # Emitting (b || a)
        # Emitting b
        movl -16(%ebp), %edi
        # Emitting a
        movl -12(%ebp), %esi
      orl %esi, %edi
      # Emitting c
      movl -20(%ebp), %esi
    orl %esi, %edi
  cmpl $0, %edi
  je label12
  jmp label11
# __Basic block 3_____________________________________________________
label10:
  # Exit to block 7 if true, block 8 if false
    # Emitting ((d && d) || d)
      # Emitting (d && d)
        # Emitting d
        movl -24(%ebp), %edi
        # Emitting d
        movl -24(%ebp), %esi
      andl %esi, %edi
      # Emitting d
      movl -24(%ebp), %esi
    orl %esi, %edi
  cmpl $0, %edi
  je label15
  jmp label14
# __Basic block 4_____________________________________________________
label11:
    # Emitting write(0)
      # Emitting 0
      movl $0, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
  # Exit to block 6
  jmp label13
# __Basic block 5_____________________________________________________
label12:
    # Emitting write(1)
      # Emitting 1
      movl $1, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
  # Exit to block 6
  jmp label13
# __Basic block 6_____________________________________________________
label13:
  # Exit to block 19
  jmp label26
# __Basic block 7_____________________________________________________
label14:
    # Emitting write(2)
      # Emitting 2
      movl $2, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
  # Exit to block 9
  jmp label16
# __Basic block 8_____________________________________________________
label15:
    # Emitting nop
  # Exit to block 9
  jmp label16
# __Basic block 9_____________________________________________________
label16:
  # Exit to block 10 if true, block 11 if false
    # Emitting (e && false)
      # Emitting e
      movl -28(%ebp), %edi
      # Emitting false
      movl $0, %esi
    andl %esi, %edi
  cmpl $0, %edi
  je label18
  jmp label17
# __Basic block 10____________________________________________________
label17:
    # Emitting write(3)
      # Emitting 3
      movl $3, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
  # Exit to block 15
  jmp label22
# __Basic block 11____________________________________________________
label18:
  # Exit to block 12 if true, block 13 if false
    # Emitting (true || e)
      # Emitting true
      movl $1, %edi
      # Emitting e
      movl -28(%ebp), %esi
    orl %esi, %edi
  cmpl $0, %edi
  je label20
  jmp label19
# __Basic block 12____________________________________________________
label19:
    # Emitting e = false
      # Emitting false
      movl $0, %edi
    movl %edi, -28(%ebp)
    # Emitting write(4)
      # Emitting 4
      movl $4, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
  # Exit to block 14
  jmp label21
# __Basic block 13____________________________________________________
label20:
    # Emitting nop
  # Exit to block 14
  jmp label21
# __Basic block 14____________________________________________________
label21:
  # Exit to block 15
  jmp label22
# __Basic block 15____________________________________________________
label22:
  # Exit to block 16 if true, block 17 if false
    # Emitting !(e)
      # Emitting e
      movl -28(%ebp), %edi
    negl %edi
    incl %edi
  cmpl $0, %edi
  je label24
  jmp label23
# __Basic block 16____________________________________________________
label23:
    # Emitting e = ((a || b) || c)
      # Emitting ((a || b) || c)
        # Emitting (a || b)
          # Emitting a
          movl -12(%ebp), %edi
          # Emitting b
          movl -16(%ebp), %esi
        orl %esi, %edi
        # Emitting c
        movl -20(%ebp), %esi
      orl %esi, %edi
    movl %edi, -28(%ebp)
    # Emitting write(7)
      # Emitting 7
      movl $7, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
  # Exit to block 18
  jmp label25
# __Basic block 17____________________________________________________
label24:
    # Emitting nop
  # Exit to block 18
  jmp label25
# __Basic block 18____________________________________________________
label25:
  # Exit to block 19
  jmp label26
# __Basic block 19____________________________________________________
label26:
  # Exit to block 1
  jmp label8
label27:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
