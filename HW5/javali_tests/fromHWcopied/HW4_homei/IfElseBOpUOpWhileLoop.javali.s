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
      push $8
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
  # bt           -16
  # bf           -20
  # implicit=8 localSlot=24 sum=32
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  movl $0, -20(%ebp)
  jmp label7
# __Basic block 0_____________________________________________________
label7:
    # Emitting this.b = 300
      # Emitting 300
      movl $300, %edi
      # Emitting this
      movl 8(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 4(%esi)
    # Emitting a = 200
      # Emitting 200
      movl $200, %edi
    movl %edi, -12(%ebp)
    # Emitting bt = true
      # Emitting true
      movl $1, %edi
    movl %edi, -16(%ebp)
    # Emitting bf = false
      # Emitting false
      movl $0, %edi
    movl %edi, -20(%ebp)
  # Exit to block 2 if true, block 3 if false
    # Emitting (a < this.b)
      # Emitting a
      movl -12(%ebp), %edi
      # Emitting this.b
        # Emitting this
        movl 8(%ebp), %esi
      push %esi
      call Javali$CheckNull
      add $4, %esp
      movl 4(%esi), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label10
  jmp label9
# __Basic block 1_____________________________________________________
label8:
  # Return
  jmp label42
# __Basic block 2_____________________________________________________
label9:
    # Emitting write(a)
      # Emitting a
      movl -12(%ebp), %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
  # Exit to block 4
  jmp label11
# __Basic block 3_____________________________________________________
label10:
    # Emitting write(666)
      # Emitting 666
      movl $666, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
  # Exit to block 4
  jmp label11
# __Basic block 4_____________________________________________________
label11:
  # Exit to block 5 if true, block 6 if false
    # Emitting (a <= this.b)
      # Emitting a
      movl -12(%ebp), %edi
      # Emitting this.b
        # Emitting this
        movl 8(%ebp), %esi
      push %esi
      call Javali$CheckNull
      add $4, %esp
      movl 4(%esi), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setle %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label13
  jmp label12
# __Basic block 5_____________________________________________________
label12:
    # Emitting write(a)
      # Emitting a
      movl -12(%ebp), %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
  # Exit to block 7
  jmp label14
# __Basic block 6_____________________________________________________
label13:
    # Emitting write(666)
      # Emitting 666
      movl $666, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
  # Exit to block 7
  jmp label14
# __Basic block 7_____________________________________________________
label14:
  # Exit to block 8 if true, block 9 if false
    # Emitting (a > this.b)
      # Emitting a
      movl -12(%ebp), %edi
      # Emitting this.b
        # Emitting this
        movl 8(%ebp), %esi
      push %esi
      call Javali$CheckNull
      add $4, %esp
      movl 4(%esi), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setg %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label16
  jmp label15
# __Basic block 8_____________________________________________________
label15:
    # Emitting write(a)
      # Emitting a
      movl -12(%ebp), %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
  # Exit to block 10
  jmp label17
# __Basic block 9_____________________________________________________
label16:
    # Emitting write(666)
      # Emitting 666
      movl $666, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
  # Exit to block 10
  jmp label17
# __Basic block 10____________________________________________________
label17:
  # Exit to block 11 if true, block 12 if false
    # Emitting (a > this.b)
      # Emitting a
      movl -12(%ebp), %edi
      # Emitting this.b
        # Emitting this
        movl 8(%ebp), %esi
      push %esi
      call Javali$CheckNull
      add $4, %esp
      movl 4(%esi), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setg %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label19
  jmp label18
# __Basic block 11____________________________________________________
label18:
    # Emitting write(a)
      # Emitting a
      movl -12(%ebp), %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
  # Exit to block 13
  jmp label20
# __Basic block 12____________________________________________________
label19:
    # Emitting write(666)
      # Emitting 666
      movl $666, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
  # Exit to block 13
  jmp label20
# __Basic block 13____________________________________________________
label20:
  # Exit to block 14 if true, block 15 if false
    # Emitting !(true)
      # Emitting true
      movl $1, %edi
    negl %edi
    incl %edi
  cmpl $0, %edi
  je label22
  jmp label21
# __Basic block 14____________________________________________________
label21:
    # Emitting write(a)
      # Emitting a
      movl -12(%ebp), %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
  # Exit to block 16
  jmp label23
# __Basic block 15____________________________________________________
label22:
    # Emitting write(666)
      # Emitting 666
      movl $666, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
  # Exit to block 16
  jmp label23
# __Basic block 16____________________________________________________
label23:
  # Exit to block 17 if true, block 18 if false
    # Emitting !(false)
      # Emitting false
      movl $0, %edi
    negl %edi
    incl %edi
  cmpl $0, %edi
  je label25
  jmp label24
# __Basic block 17____________________________________________________
label24:
    # Emitting write(a)
      # Emitting a
      movl -12(%ebp), %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
  # Exit to block 19
  jmp label26
# __Basic block 18____________________________________________________
label25:
    # Emitting write(666)
      # Emitting 666
      movl $666, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
  # Exit to block 19
  jmp label26
# __Basic block 19____________________________________________________
label26:
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
  # Exit to block 20 if true, block 21 if false
    # Emitting (false && true)
      # Emitting false
      movl $0, %edi
      # Emitting true
      movl $1, %esi
    andl %esi, %edi
  cmpl $0, %edi
  je label28
  jmp label27
# __Basic block 20____________________________________________________
label27:
    # Emitting write(a)
      # Emitting a
      movl -12(%ebp), %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
  # Exit to block 22
  jmp label29
# __Basic block 21____________________________________________________
label28:
    # Emitting write(666)
      # Emitting 666
      movl $666, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
  # Exit to block 22
  jmp label29
# __Basic block 22____________________________________________________
label29:
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
  # Exit to block 23 if true, block 24 if false
    # Emitting (bt || bf)
      # Emitting bt
      movl -16(%ebp), %edi
      # Emitting bf
      movl -20(%ebp), %esi
    orl %esi, %edi
  cmpl $0, %edi
  je label31
  jmp label30
# __Basic block 23____________________________________________________
label30:
    # Emitting write(1)
      # Emitting 1
      movl $1, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
  # Exit to block 25
  jmp label32
# __Basic block 24____________________________________________________
label31:
    # Emitting write(0)
      # Emitting 0
      movl $0, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
  # Exit to block 25
  jmp label32
# __Basic block 25____________________________________________________
label32:
    # Emitting write((3 * 4))
      # Emitting (3 * 4)
        # Emitting 3
        movl $3, %edi
        # Emitting 4
        movl $4, %esi
      imull %esi, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
    # Emitting write((3 + 4))
      # Emitting (3 + 4)
        # Emitting 3
        movl $3, %edi
        # Emitting 4
        movl $4, %esi
      addl %esi, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
    # Emitting write((3 - 4))
      # Emitting (3 - 4)
        # Emitting 3
        movl $3, %edi
        # Emitting 4
        movl $4, %esi
      subl %esi, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
    # Emitting write((13 % 7))
      # Emitting (13 % 7)
        # Emitting 13
        movl $13, %edi
        # Emitting 7
        movl $7, %esi
      push %esi
      call Javali$CheckNonZero
      add $4, %esp
      pushl %esi
      pushl %edi
      popl %eax
      popl %ebx
      cltd
      idivl %ebx
      movl %edx, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
    # Emitting write((17 / 7))
      # Emitting (17 / 7)
        # Emitting 17
        movl $17, %edi
        # Emitting 7
        movl $7, %esi
      push %esi
      call Javali$CheckNonZero
      add $4, %esp
      pushl %esi
      pushl %edi
      popl %eax
      popl %ebx
      cltd
      idivl %ebx
      movl %eax, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting bt = (3 < 4)
      # Emitting (3 < 4)
        # Emitting 3
        movl $3, %edi
        # Emitting 4
        movl $4, %esi
      cmpl %esi, %edi
      push %eax
      movl $0, %eax
      setl %al
      movl %eax, %edi
      pop %eax
    movl %edi, -16(%ebp)
    # Emitting bt = (4 < 3)
      # Emitting (4 < 3)
        # Emitting 4
        movl $4, %edi
        # Emitting 3
        movl $3, %esi
      cmpl %esi, %edi
      push %eax
      movl $0, %eax
      setl %al
      movl %eax, %edi
      pop %eax
    movl %edi, -16(%ebp)
    # Emitting bt = (4 < 4)
      # Emitting (4 < 4)
        # Emitting 4
        movl $4, %edi
        # Emitting 4
        movl $4, %esi
      cmpl %esi, %edi
      push %eax
      movl $0, %eax
      setl %al
      movl %eax, %edi
      pop %eax
    movl %edi, -16(%ebp)
    # Emitting bt = (3 <= 4)
      # Emitting (3 <= 4)
        # Emitting 3
        movl $3, %edi
        # Emitting 4
        movl $4, %esi
      cmpl %esi, %edi
      push %eax
      movl $0, %eax
      setle %al
      movl %eax, %edi
      pop %eax
    movl %edi, -16(%ebp)
    # Emitting bt = (4 <= 3)
      # Emitting (4 <= 3)
        # Emitting 4
        movl $4, %edi
        # Emitting 3
        movl $3, %esi
      cmpl %esi, %edi
      push %eax
      movl $0, %eax
      setle %al
      movl %eax, %edi
      pop %eax
    movl %edi, -16(%ebp)
    # Emitting bt = (4 <= 4)
      # Emitting (4 <= 4)
        # Emitting 4
        movl $4, %edi
        # Emitting 4
        movl $4, %esi
      cmpl %esi, %edi
      push %eax
      movl $0, %eax
      setle %al
      movl %eax, %edi
      pop %eax
    movl %edi, -16(%ebp)
    # Emitting bt = (3 > 4)
      # Emitting (3 > 4)
        # Emitting 3
        movl $3, %edi
        # Emitting 4
        movl $4, %esi
      cmpl %esi, %edi
      push %eax
      movl $0, %eax
      setg %al
      movl %eax, %edi
      pop %eax
    movl %edi, -16(%ebp)
    # Emitting bt = (4 > 3)
      # Emitting (4 > 3)
        # Emitting 4
        movl $4, %edi
        # Emitting 3
        movl $3, %esi
      cmpl %esi, %edi
      push %eax
      movl $0, %eax
      setg %al
      movl %eax, %edi
      pop %eax
    movl %edi, -16(%ebp)
    # Emitting bt = (4 > 4)
      # Emitting (4 > 4)
        # Emitting 4
        movl $4, %edi
        # Emitting 4
        movl $4, %esi
      cmpl %esi, %edi
      push %eax
      movl $0, %eax
      setg %al
      movl %eax, %edi
      pop %eax
    movl %edi, -16(%ebp)
    # Emitting bt = (3 >= 4)
      # Emitting (3 >= 4)
        # Emitting 3
        movl $3, %edi
        # Emitting 4
        movl $4, %esi
      cmpl %esi, %edi
      push %eax
      movl $0, %eax
      setge %al
      movl %eax, %edi
      pop %eax
    movl %edi, -16(%ebp)
    # Emitting bt = (4 >= 3)
      # Emitting (4 >= 3)
        # Emitting 4
        movl $4, %edi
        # Emitting 3
        movl $3, %esi
      cmpl %esi, %edi
      push %eax
      movl $0, %eax
      setge %al
      movl %eax, %edi
      pop %eax
    movl %edi, -16(%ebp)
    # Emitting bt = (4 >= 4)
      # Emitting (4 >= 4)
        # Emitting 4
        movl $4, %edi
        # Emitting 4
        movl $4, %esi
      cmpl %esi, %edi
      push %eax
      movl $0, %eax
      setge %al
      movl %eax, %edi
      pop %eax
    movl %edi, -16(%ebp)
    # Emitting bt = (true && true)
      # Emitting (true && true)
        # Emitting true
        movl $1, %edi
        # Emitting true
        movl $1, %esi
      andl %esi, %edi
    movl %edi, -16(%ebp)
    # Emitting bt = (true && false)
      # Emitting (true && false)
        # Emitting true
        movl $1, %edi
        # Emitting false
        movl $0, %esi
      andl %esi, %edi
    movl %edi, -16(%ebp)
    # Emitting bt = (false && false)
      # Emitting (false && false)
        # Emitting false
        movl $0, %edi
        # Emitting false
        movl $0, %esi
      andl %esi, %edi
    movl %edi, -16(%ebp)
    # Emitting bt = (true || true)
      # Emitting (true || true)
        # Emitting true
        movl $1, %edi
        # Emitting true
        movl $1, %esi
      orl %esi, %edi
    movl %edi, -16(%ebp)
    # Emitting bt = (true || false)
      # Emitting (true || false)
        # Emitting true
        movl $1, %edi
        # Emitting false
        movl $0, %esi
      orl %esi, %edi
    movl %edi, -16(%ebp)
    # Emitting bt = (false || false)
      # Emitting (false || false)
        # Emitting false
        movl $0, %edi
        # Emitting false
        movl $0, %esi
      orl %esi, %edi
    movl %edi, -16(%ebp)
    # Emitting bt = !(bf)
      # Emitting !(bf)
        # Emitting bf
        movl -20(%ebp), %edi
      negl %edi
      incl %edi
    movl %edi, -16(%ebp)
    # Emitting bt = !(true)
      # Emitting !(true)
        # Emitting true
        movl $1, %edi
      negl %edi
      incl %edi
    movl %edi, -16(%ebp)
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
  # Exit to block 26 if true, block 27 if false
    # Emitting bt
    movl -16(%ebp), %edi
  cmpl $0, %edi
  je label34
  jmp label33
# __Basic block 26____________________________________________________
label33:
    # Emitting write(1)
      # Emitting 1
      movl $1, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
  # Exit to block 28
  jmp label35
# __Basic block 27____________________________________________________
label34:
    # Emitting write(0)
      # Emitting 0
      movl $0, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
  # Exit to block 28
  jmp label35
# __Basic block 28____________________________________________________
label35:
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
    # Emitting write(+(1))
      # Emitting +(1)
        # Emitting 1
        movl $1, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
    # Emitting write(-(0))
      # Emitting -(0)
        # Emitting 0
        movl $0, %edi
      negl %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
    # Emitting bt = true
      # Emitting true
      movl $1, %edi
    movl %edi, -16(%ebp)
  # Exit to block 29
  jmp label36
# __Basic block 29____________________________________________________
label36:
  # Exit to block 30 if true, block 31 if false
    # Emitting (!(false) && bt)
      # Emitting !(false)
        # Emitting false
        movl $0, %edi
      negl %edi
      incl %edi
      # Emitting bt
      movl -16(%ebp), %esi
    andl %esi, %edi
  cmpl $0, %edi
  je label38
  jmp label37
# __Basic block 30____________________________________________________
label37:
    # Emitting write(1)
      # Emitting 1
      movl $1, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting bt = !(bt)
      # Emitting !(bt)
        # Emitting bt
        movl -16(%ebp), %edi
      negl %edi
      incl %edi
    movl %edi, -16(%ebp)
  # Exit to block 29
  jmp label36
# __Basic block 31____________________________________________________
label38:
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
    # Emitting bt = (true == true)
      # Emitting (true == true)
        # Emitting true
        movl $1, %edi
        # Emitting true
        movl $1, %esi
      cmpl %esi, %edi
      push %eax
      movl $0, %eax
      sete %al
      movl %eax, %edi
      pop %eax
    movl %edi, -16(%ebp)
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
  # Exit to block 32 if true, block 33 if false
    # Emitting bt
    movl -16(%ebp), %edi
  cmpl $0, %edi
  je label40
  jmp label39
# __Basic block 32____________________________________________________
label39:
    # Emitting write(1)
      # Emitting 1
      movl $1, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
  # Exit to block 34
  jmp label41
# __Basic block 33____________________________________________________
label40:
    # Emitting write(0)
      # Emitting 0
      movl $0, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
  # Exit to block 34
  jmp label41
# __Basic block 34____________________________________________________
label41:
  # Exit to block 1
  jmp label8
label42:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
