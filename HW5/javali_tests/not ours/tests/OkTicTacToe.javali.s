vtablearr_Matrix:
.int vtable_Object
vtablearr_Vector:
.int vtable_Object
vtable_SquareMatrix:
.int vtable_Matrix
.int Matrix_contains
.int Matrix_print
.int Matrix_Matrix
.int Matrix_set
.int Matrix_mult
.int Matrix_columns
.int Matrix_get
.int Matrix_compactOK
.int Matrix_fill
.int Matrix_rows
.int SquareMatrix_fillIdentity
.int SquareMatrix_SquareMatrix
vtablearr_int:
.int vtable_Object
vtablearr_SquareMatrix:
.int vtable_Object
vtable_Matrix:
.int vtable_Object
.int Matrix_contains
.int Matrix_print
.int Matrix_Matrix
.int Matrix_set
.int Matrix_mult
.int Matrix_columns
.int Matrix_get
.int Matrix_compactOK
.int Matrix_fill
.int Matrix_rows
vtable_Board:
.int vtable_SquareMatrix
.int Matrix_contains
.int Matrix_print
.int Matrix_Matrix
.int Board_set
.int Matrix_mult
.int Matrix_columns
.int Matrix_get
.int Matrix_compactOK
.int Matrix_fill
.int Matrix_rows
.int SquareMatrix_fillIdentity
.int SquareMatrix_SquareMatrix
.int Board_Board
.int Board_diagonal2Complete
.int Board_columnComplete
.int Board_hasWon
.int Board_diagonal1Complete
.int Board_rowComplete
.int Board_full
vtablearr_Main:
.int vtable_Object
vtablearr_Board:
.int vtable_Object
vtable_Object:
.int 0
vtablearr_boolean:
.int vtable_Object
vtable_Vector:
.int vtable_Object
.int Vector_contains
.int Vector_print
.int Vector_print2
.int Vector_set
.int Vector_get
.int Vector_compactOK
.int Vector_fill
.int Vector_Vector
vtable_Main:
.int vtable_Object
.int Main_runGame
.int Main_main
.int Main_runPlayer
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
    movl 8(%edi), %edi
    call *%edi
    add $16, %esp
    movl %eax, %edi
movl $0, %eax
leave
ret
# Class Board_________________________________________________________
  # 
  .section .text
# __Method Board.Board________________________________________________
  .globl Board_Board
Board_Board:
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
    # Emitting this.SquareMatrix(...)
      # Emitting this.SquareMatrix(...)
      sub $8, %esp
        # Emitting this
        movl 8(%ebp), %edi
      push %edi
        # Emitting 3
        movl $3, %edi
      push %edi
        # Emitting 0
        movl $0, %edi
      push %edi
      # Load "this" pointer
      movl 8(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 48(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
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
# __Method Board.hasWon_______________________________________________
  .globl Board_hasWon
Board_hasWon:
  # Variable     Offset
  # i            -12
  # implicit=8 localSlot=16 sum=24
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  jmp label10
# __Basic block 0_____________________________________________________
label10:
    # Emitting i = 0
      # Emitting 0
      movl $0, %edi
    movl %edi, -12(%ebp)
  # Exit to block 2
  jmp label12
# __Basic block 1_____________________________________________________
label11:
  # Return
  jmp label24
# __Basic block 2_____________________________________________________
label12:
  # Exit to block 3 if true, block 4 if false
    # Emitting (i < 3)
      # Emitting i
      movl -12(%ebp), %edi
      # Emitting 3
      movl $3, %esi
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
  # Exit to block 5 if true, block 6 if false
    # Emitting this.rowComplete(...)
    sub $8, %esp
      # Emitting this
      movl 12(%ebp), %edi
    push %edi
      # Emitting i
      movl -12(%ebp), %edi
    push %edi
      # Emitting player
      movl 8(%ebp), %edi
    push %edi
    # Load "this" pointer
    movl 8(%esp), %edi
    sub $12, %esp
    push %edi
    call Javali$CheckNull
    add $16, %esp
    movl 0(%edi), %edi
    movl 72(%edi), %edi
    call *%edi
    add $20, %esp
    movl %eax, %edi
  cmpl $0, %edi
  je label16
  jmp label15
# __Basic block 4_____________________________________________________
label14:
    # Emitting i = 0
      # Emitting 0
      movl $0, %edi
    movl %edi, -12(%ebp)
  # Exit to block 8
  jmp label18
# __Basic block 5_____________________________________________________
label15:
    # Emitting return true
      # Emitting true
      movl $1, %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label11
# __Basic block 6_____________________________________________________
label16:
    # Emitting nop
  # Exit to block 7
  jmp label17
# __Basic block 7_____________________________________________________
label17:
    # Emitting i = (i + 1)
      # Emitting (i + 1)
        # Emitting i
        movl -12(%ebp), %edi
        # Emitting 1
        movl $1, %esi
      addl %esi, %edi
    movl %edi, -12(%ebp)
  # Exit to block 2
  jmp label12
# __Basic block 8_____________________________________________________
label18:
  # Exit to block 9 if true, block 10 if false
    # Emitting (i < 3)
      # Emitting i
      movl -12(%ebp), %edi
      # Emitting 3
      movl $3, %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label20
  jmp label19
# __Basic block 9_____________________________________________________
label19:
  # Exit to block 11 if true, block 12 if false
    # Emitting this.columnComplete(...)
    sub $8, %esp
      # Emitting this
      movl 12(%ebp), %edi
    push %edi
      # Emitting i
      movl -12(%ebp), %edi
    push %edi
      # Emitting player
      movl 8(%ebp), %edi
    push %edi
    # Load "this" pointer
    movl 8(%esp), %edi
    sub $12, %esp
    push %edi
    call Javali$CheckNull
    add $16, %esp
    movl 0(%edi), %edi
    movl 60(%edi), %edi
    call *%edi
    add $20, %esp
    movl %eax, %edi
  cmpl $0, %edi
  je label22
  jmp label21
# __Basic block 10____________________________________________________
label20:
    # Emitting return (this.diagonal1Complete(...) || this.diagonal2Complete(...))
      # Emitting (this.diagonal1Complete(...) || this.diagonal2Complete(...))
        # Emitting this.diagonal1Complete(...)
        sub $12, %esp
          # Emitting this
          movl 12(%ebp), %edi
        push %edi
          # Emitting player
          movl 8(%ebp), %edi
        push %edi
        # Load "this" pointer
        movl 4(%esp), %edi
        sub $12, %esp
        push %edi
        call Javali$CheckNull
        add $16, %esp
        movl 0(%edi), %edi
        movl 68(%edi), %edi
        call *%edi
        add $20, %esp
        movl %eax, %edi
        # Emitting this.diagonal2Complete(...)
        sub $12, %esp
          # Emitting this
          movl 12(%ebp), %esi
        push %esi
          # Emitting player
          movl 8(%ebp), %esi
        push %esi
        # Load "this" pointer
        movl 4(%esp), %esi
        sub $12, %esp
        push %esi
        call Javali$CheckNull
        add $16, %esp
        movl 0(%esi), %esi
        movl 56(%esi), %esi
        call *%esi
        add $20, %esp
        movl %eax, %esi
      orl %esi, %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label11
# __Basic block 11____________________________________________________
label21:
    # Emitting return true
      # Emitting true
      movl $1, %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label11
# __Basic block 12____________________________________________________
label22:
    # Emitting nop
  # Exit to block 13
  jmp label23
# __Basic block 13____________________________________________________
label23:
    # Emitting i = (i + 1)
      # Emitting (i + 1)
        # Emitting i
        movl -12(%ebp), %edi
        # Emitting 1
        movl $1, %esi
      addl %esi, %edi
    movl %edi, -12(%ebp)
  # Exit to block 8
  jmp label18
label24:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Board.rowComplete__________________________________________
  .globl Board_rowComplete
Board_rowComplete:
  # Variable     Offset
  # j            -12
  # implicit=8 localSlot=16 sum=24
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  jmp label25
# __Basic block 0_____________________________________________________
label25:
    # Emitting j = 0
      # Emitting 0
      movl $0, %edi
    movl %edi, -12(%ebp)
  # Exit to block 2
  jmp label27
# __Basic block 1_____________________________________________________
label26:
  # Return
  jmp label33
# __Basic block 2_____________________________________________________
label27:
  # Exit to block 3 if true, block 4 if false
    # Emitting (j < 3)
      # Emitting j
      movl -12(%ebp), %edi
      # Emitting 3
      movl $3, %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label29
  jmp label28
# __Basic block 3_____________________________________________________
label28:
  # Exit to block 5 if true, block 6 if false
    # Emitting (this.get(...) != player)
      # Emitting this.get(...)
      sub $8, %esp
        # Emitting this
        movl 16(%ebp), %edi
      push %edi
        # Emitting i
        movl 12(%ebp), %edi
      push %edi
        # Emitting j
        movl -12(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 8(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 28(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
      # Emitting player
      movl 8(%ebp), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setne %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label31
  jmp label30
# __Basic block 4_____________________________________________________
label29:
    # Emitting return true
      # Emitting true
      movl $1, %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label26
# __Basic block 5_____________________________________________________
label30:
    # Emitting return false
      # Emitting false
      movl $0, %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label26
# __Basic block 6_____________________________________________________
label31:
    # Emitting nop
  # Exit to block 7
  jmp label32
# __Basic block 7_____________________________________________________
label32:
    # Emitting j = (j + 1)
      # Emitting (j + 1)
        # Emitting j
        movl -12(%ebp), %edi
        # Emitting 1
        movl $1, %esi
      addl %esi, %edi
    movl %edi, -12(%ebp)
  # Exit to block 2
  jmp label27
label33:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Board.columnComplete_______________________________________
  .globl Board_columnComplete
Board_columnComplete:
  # Variable     Offset
  # i            -12
  # implicit=8 localSlot=16 sum=24
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  jmp label34
# __Basic block 0_____________________________________________________
label34:
    # Emitting i = 0
      # Emitting 0
      movl $0, %edi
    movl %edi, -12(%ebp)
  # Exit to block 2
  jmp label36
# __Basic block 1_____________________________________________________
label35:
  # Return
  jmp label42
# __Basic block 2_____________________________________________________
label36:
  # Exit to block 3 if true, block 4 if false
    # Emitting (i < 3)
      # Emitting i
      movl -12(%ebp), %edi
      # Emitting 3
      movl $3, %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label38
  jmp label37
# __Basic block 3_____________________________________________________
label37:
  # Exit to block 5 if true, block 6 if false
    # Emitting (this.get(...) != player)
      # Emitting this.get(...)
      sub $8, %esp
        # Emitting this
        movl 16(%ebp), %edi
      push %edi
        # Emitting i
        movl -12(%ebp), %edi
      push %edi
        # Emitting j
        movl 12(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 8(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 28(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
      # Emitting player
      movl 8(%ebp), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setne %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label40
  jmp label39
# __Basic block 4_____________________________________________________
label38:
    # Emitting return true
      # Emitting true
      movl $1, %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label35
# __Basic block 5_____________________________________________________
label39:
    # Emitting return false
      # Emitting false
      movl $0, %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label35
# __Basic block 6_____________________________________________________
label40:
    # Emitting nop
  # Exit to block 7
  jmp label41
# __Basic block 7_____________________________________________________
label41:
    # Emitting i = (i + 1)
      # Emitting (i + 1)
        # Emitting i
        movl -12(%ebp), %edi
        # Emitting 1
        movl $1, %esi
      addl %esi, %edi
    movl %edi, -12(%ebp)
  # Exit to block 2
  jmp label36
label42:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Board.diagonal1Complete____________________________________
  .globl Board_diagonal1Complete
Board_diagonal1Complete:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label43
# __Basic block 0_____________________________________________________
label43:
    # Emitting return (((this.get(...) == player) && (this.get(...) == player)) && (this.get(...) == player))
      # Emitting (((this.get(...) == player) && (this.get(...) == player)) && (this.get(...) == player))
        # Emitting ((this.get(...) == player) && (this.get(...) == player))
          # Emitting (this.get(...) == player)
            # Emitting this.get(...)
            sub $8, %esp
              # Emitting this
              movl 12(%ebp), %edi
            push %edi
              # Emitting 0
              movl $0, %edi
            push %edi
              # Emitting 0
              movl $0, %edi
            push %edi
            # Load "this" pointer
            movl 8(%esp), %edi
            sub $12, %esp
            push %edi
            call Javali$CheckNull
            add $16, %esp
            movl 0(%edi), %edi
            movl 28(%edi), %edi
            call *%edi
            add $20, %esp
            movl %eax, %edi
            # Emitting player
            movl 8(%ebp), %esi
          cmpl %esi, %edi
          push %eax
          movl $0, %eax
          sete %al
          movl %eax, %edi
          pop %eax
          # Emitting (this.get(...) == player)
            # Emitting this.get(...)
            sub $8, %esp
              # Emitting this
              movl 12(%ebp), %esi
            push %esi
              # Emitting 1
              movl $1, %esi
            push %esi
              # Emitting 1
              movl $1, %esi
            push %esi
            # Load "this" pointer
            movl 8(%esp), %esi
            sub $12, %esp
            push %esi
            call Javali$CheckNull
            add $16, %esp
            movl 0(%esi), %esi
            movl 28(%esi), %esi
            call *%esi
            add $20, %esp
            movl %eax, %esi
            # Emitting player
            movl 8(%ebp), %edx
          cmpl %edx, %esi
          push %eax
          movl $0, %eax
          sete %al
          movl %eax, %esi
          pop %eax
        andl %esi, %edi
        # Emitting (this.get(...) == player)
          # Emitting this.get(...)
          sub $8, %esp
            # Emitting this
            movl 12(%ebp), %esi
          push %esi
            # Emitting 2
            movl $2, %esi
          push %esi
            # Emitting 2
            movl $2, %esi
          push %esi
          # Load "this" pointer
          movl 8(%esp), %esi
          sub $12, %esp
          push %esi
          call Javali$CheckNull
          add $16, %esp
          movl 0(%esi), %esi
          movl 28(%esi), %esi
          call *%esi
          add $20, %esp
          movl %eax, %esi
          # Emitting player
          movl 8(%ebp), %edx
        cmpl %edx, %esi
        push %eax
        movl $0, %eax
        sete %al
        movl %eax, %esi
        pop %eax
      andl %esi, %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label44
# __Basic block 1_____________________________________________________
label44:
  # Return
  jmp label45
label45:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Board.diagonal2Complete____________________________________
  .globl Board_diagonal2Complete
Board_diagonal2Complete:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label46
# __Basic block 0_____________________________________________________
label46:
    # Emitting return (((this.get(...) == player) && (this.get(...) == player)) && (this.get(...) == player))
      # Emitting (((this.get(...) == player) && (this.get(...) == player)) && (this.get(...) == player))
        # Emitting ((this.get(...) == player) && (this.get(...) == player))
          # Emitting (this.get(...) == player)
            # Emitting this.get(...)
            sub $8, %esp
              # Emitting this
              movl 12(%ebp), %edi
            push %edi
              # Emitting 0
              movl $0, %edi
            push %edi
              # Emitting 2
              movl $2, %edi
            push %edi
            # Load "this" pointer
            movl 8(%esp), %edi
            sub $12, %esp
            push %edi
            call Javali$CheckNull
            add $16, %esp
            movl 0(%edi), %edi
            movl 28(%edi), %edi
            call *%edi
            add $20, %esp
            movl %eax, %edi
            # Emitting player
            movl 8(%ebp), %esi
          cmpl %esi, %edi
          push %eax
          movl $0, %eax
          sete %al
          movl %eax, %edi
          pop %eax
          # Emitting (this.get(...) == player)
            # Emitting this.get(...)
            sub $8, %esp
              # Emitting this
              movl 12(%ebp), %esi
            push %esi
              # Emitting 1
              movl $1, %esi
            push %esi
              # Emitting 1
              movl $1, %esi
            push %esi
            # Load "this" pointer
            movl 8(%esp), %esi
            sub $12, %esp
            push %esi
            call Javali$CheckNull
            add $16, %esp
            movl 0(%esi), %esi
            movl 28(%esi), %esi
            call *%esi
            add $20, %esp
            movl %eax, %esi
            # Emitting player
            movl 8(%ebp), %edx
          cmpl %edx, %esi
          push %eax
          movl $0, %eax
          sete %al
          movl %eax, %esi
          pop %eax
        andl %esi, %edi
        # Emitting (this.get(...) == player)
          # Emitting this.get(...)
          sub $8, %esp
            # Emitting this
            movl 12(%ebp), %esi
          push %esi
            # Emitting 2
            movl $2, %esi
          push %esi
            # Emitting 0
            movl $0, %esi
          push %esi
          # Load "this" pointer
          movl 8(%esp), %esi
          sub $12, %esp
          push %esi
          call Javali$CheckNull
          add $16, %esp
          movl 0(%esi), %esi
          movl 28(%esi), %esi
          call *%esi
          add $20, %esp
          movl %eax, %esi
          # Emitting player
          movl 8(%ebp), %edx
        cmpl %edx, %esi
        push %eax
        movl $0, %eax
        sete %al
        movl %eax, %esi
        pop %eax
      andl %esi, %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label47
# __Basic block 1_____________________________________________________
label47:
  # Return
  jmp label48
label48:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Board.full_________________________________________________
  .globl Board_full
Board_full:
  # Variable     Offset
  # i            -12
  # j            -16
  # implicit=8 localSlot=20 sum=28
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  jmp label49
# __Basic block 0_____________________________________________________
label49:
    # Emitting i = 0
      # Emitting 0
      movl $0, %edi
    movl %edi, -12(%ebp)
  # Exit to block 2
  jmp label51
# __Basic block 1_____________________________________________________
label50:
  # Return
  jmp label60
# __Basic block 2_____________________________________________________
label51:
  # Exit to block 3 if true, block 4 if false
    # Emitting (i < 3)
      # Emitting i
      movl -12(%ebp), %edi
      # Emitting 3
      movl $3, %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label53
  jmp label52
# __Basic block 3_____________________________________________________
label52:
    # Emitting j = 0
      # Emitting 0
      movl $0, %edi
    movl %edi, -16(%ebp)
  # Exit to block 5
  jmp label54
# __Basic block 4_____________________________________________________
label53:
    # Emitting return true
      # Emitting true
      movl $1, %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label50
# __Basic block 5_____________________________________________________
label54:
  # Exit to block 6 if true, block 7 if false
    # Emitting (j < 3)
      # Emitting j
      movl -16(%ebp), %edi
      # Emitting 3
      movl $3, %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label56
  jmp label55
# __Basic block 6_____________________________________________________
label55:
  # Exit to block 8 if true, block 9 if false
    # Emitting (0 == this.get(...))
      # Emitting 0
      movl $0, %edi
      # Emitting this.get(...)
      sub $8, %esp
        # Emitting this
        movl 8(%ebp), %esi
      push %esi
        # Emitting i
        movl -12(%ebp), %esi
      push %esi
        # Emitting j
        movl -16(%ebp), %esi
      push %esi
      # Load "this" pointer
      movl 8(%esp), %esi
      sub $12, %esp
      push %esi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%esi), %esi
      movl 28(%esi), %esi
      call *%esi
      add $20, %esp
      movl %eax, %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    sete %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label58
  jmp label57
# __Basic block 7_____________________________________________________
label56:
    # Emitting i = (i + 1)
      # Emitting (i + 1)
        # Emitting i
        movl -12(%ebp), %edi
        # Emitting 1
        movl $1, %esi
      addl %esi, %edi
    movl %edi, -12(%ebp)
  # Exit to block 2
  jmp label51
# __Basic block 8_____________________________________________________
label57:
    # Emitting return false
      # Emitting false
      movl $0, %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label50
# __Basic block 9_____________________________________________________
label58:
    # Emitting nop
  # Exit to block 10
  jmp label59
# __Basic block 10____________________________________________________
label59:
    # Emitting j = (j + 1)
      # Emitting (j + 1)
        # Emitting j
        movl -16(%ebp), %edi
        # Emitting 1
        movl $1, %esi
      addl %esi, %edi
    movl %edi, -16(%ebp)
  # Exit to block 5
  jmp label54
label60:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Board.set__________________________________________________
  .globl Board_set
Board_set:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label61
# __Basic block 0_____________________________________________________
label61:
  # Exit to block 2 if true, block 3 if false
    # Emitting (0 == this.get(...))
      # Emitting 0
      movl $0, %edi
      # Emitting this.get(...)
      sub $8, %esp
        # Emitting this
        movl 20(%ebp), %esi
      push %esi
        # Emitting i
        movl 16(%ebp), %esi
      push %esi
        # Emitting j
        movl 12(%ebp), %esi
      push %esi
      # Load "this" pointer
      movl 8(%esp), %esi
      sub $12, %esp
      push %esi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%esi), %esi
      movl 28(%esi), %esi
      call *%esi
      add $20, %esp
      movl %eax, %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    sete %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label64
  jmp label63
# __Basic block 1_____________________________________________________
label62:
  # Return
  jmp label66
# __Basic block 2_____________________________________________________
label63:
    # Emitting this.vectors[i].set(...)
      # Emitting this.vectors[i].set(...)
      sub $8, %esp
        # Emitting this.vectors[i]
          # Emitting this.vectors
            # Emitting this
            movl 20(%ebp), %edi
          sub $8, %esp
          push %edi
          call Javali$CheckNull
          add $12, %esp
          movl 4(%edi), %edi
        sub $8, %esp
        push %edi
        call Javali$CheckNull
        add $12, %esp
          # Emitting i
          movl 16(%ebp), %esi
        sub $4, %esp
        push %esi
        push %edi
        call Javali$CheckArrayBounds
        add $12, %esp
        movl 8(%edi,%esi,4), %esi
      push %esi
        # Emitting j
        movl 12(%ebp), %esi
      push %esi
        # Emitting value
        movl 8(%ebp), %esi
      push %esi
      # Load "this" pointer
      movl 8(%esp), %esi
      sub $12, %esp
      push %esi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%esi), %esi
      movl 16(%esi), %esi
      call *%esi
      add $20, %esp
      movl %eax, %esi
  # Exit to block 4
  jmp label65
# __Basic block 3_____________________________________________________
label64:
    # Emitting this.vectors[i].set(...)
      # Emitting this.vectors[i].set(...)
      sub $8, %esp
        # Emitting this.vectors[i]
          # Emitting this.vectors
            # Emitting this
            movl 20(%ebp), %esi
          sub $8, %esp
          push %esi
          call Javali$CheckNull
          add $12, %esp
          movl 4(%esi), %esi
        sub $8, %esp
        push %esi
        call Javali$CheckNull
        add $12, %esp
          # Emitting i
          movl 16(%ebp), %edi
        sub $4, %esp
        push %edi
        push %esi
        call Javali$CheckArrayBounds
        add $12, %esp
        movl 8(%esi,%edi,4), %edi
      push %edi
        # Emitting j
        movl 12(%ebp), %edi
      push %edi
        # Emitting 9
        movl $9, %edi
      push %edi
      # Load "this" pointer
      movl 8(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 16(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
  # Exit to block 4
  jmp label65
# __Basic block 4_____________________________________________________
label65:
  # Exit to block 1
  jmp label62
label66:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
# Class Main__________________________________________________________
  # 
  .section .text
# __Method Main.runPlayer_____________________________________________
  .globl Main_runPlayer
Main_runPlayer:
  # Variable     Offset
  # pos          -12
  # column       -16
  # row          -20
  # m            -24
  # n            -28
  # implicit=8 localSlot=32 sum=40
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
  jmp label67
# __Basic block 0_____________________________________________________
label67:
    # Emitting m = this.b
      # Emitting this.b
        # Emitting this
        movl 12(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 4(%edi), %edi
    movl %edi, -24(%ebp)
    # Emitting n = 3
      # Emitting 3
      movl $3, %edi
    movl %edi, -28(%ebp)
    # Emitting pos = read()
      # Emitting read()
      sub $4, %esp
      call Javali$ReadInteger
      add $4, %esp
      movl %eax, %edi
    movl %edi, -12(%ebp)
    # Emitting pos = (pos - 1)
      # Emitting (pos - 1)
        # Emitting pos
        movl -12(%ebp), %edi
        # Emitting 1
        movl $1, %esi
      subl %esi, %edi
    movl %edi, -12(%ebp)
    # Emitting row = (pos / n)
      # Emitting (pos / n)
        # Emitting pos
        movl -12(%ebp), %edi
        # Emitting n
        movl -28(%ebp), %esi
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
    movl %edi, -20(%ebp)
    # Emitting column = (pos % n)
      # Emitting (pos % n)
        # Emitting pos
        movl -12(%ebp), %edi
        # Emitting n
        movl -28(%ebp), %esi
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
    movl %edi, -16(%ebp)
  # Exit to block 2 if true, block 3 if false
    # Emitting (1 == player)
      # Emitting 1
      movl $1, %edi
      # Emitting player
      movl 8(%ebp), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    sete %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label70
  jmp label69
# __Basic block 1_____________________________________________________
label68:
  # Return
  jmp label72
# __Basic block 2_____________________________________________________
label69:
    # Emitting this.b.set(...)
      # Emitting this.b.set(...)
      sub $4, %esp
        # Emitting this.b
          # Emitting this
          movl 12(%ebp), %edi
        sub $12, %esp
        push %edi
        call Javali$CheckNull
        add $16, %esp
        movl 4(%edi), %edi
      push %edi
        # Emitting row
        movl -20(%ebp), %edi
      push %edi
        # Emitting column
        movl -16(%ebp), %edi
      push %edi
        # Emitting player
        movl 8(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 12(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 16(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
  # Exit to block 4
  jmp label71
# __Basic block 3_____________________________________________________
label70:
    # Emitting m.set(...)
      # Emitting m.set(...)
      sub $4, %esp
        # Emitting m
        movl -24(%ebp), %edi
      push %edi
        # Emitting row
        movl -20(%ebp), %edi
      push %edi
        # Emitting column
        movl -16(%ebp), %edi
      push %edi
        # Emitting player
        movl 8(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 12(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 16(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
  # Exit to block 4
  jmp label71
# __Basic block 4_____________________________________________________
label71:
    # Emitting this.b = (Board)(m)
      # Emitting (Board)(m)
        # Emitting m
        movl -24(%ebp), %edi
      sub $12, %esp
      push %edi
      push $vtable_Board
      call Javali$CheckCast
      add $20, %esp
      # Emitting this
      movl 12(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 4(%esi)
    # Emitting this.b.print(...)
      # Emitting this.b.print(...)
        # Emitting this.b
          # Emitting this
          movl 12(%ebp), %edi
        push %edi
        call Javali$CheckNull
        add $4, %esp
        movl 4(%edi), %edi
      push %edi
      # Load "this" pointer
      movl 0(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 8(%edi), %edi
      call *%edi
      add $4, %esp
      movl %eax, %edi
    # Emitting return this.b.hasWon(...)
      # Emitting this.b.hasWon(...)
      sub $12, %esp
        # Emitting this.b
          # Emitting this
          movl 12(%ebp), %edi
        sub $4, %esp
        push %edi
        call Javali$CheckNull
        add $8, %esp
        movl 4(%edi), %edi
      push %edi
        # Emitting player
        movl 8(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 4(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 64(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label68
label72:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Main.runGame_______________________________________________
  .globl Main_runGame
Main_runGame:
  # Variable     Offset
  # winner       -12
  # currentPlayer   -16
  # implicit=8 localSlot=20 sum=28
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  jmp label73
# __Basic block 0_____________________________________________________
label73:
    # Emitting this.b.fill(...)
      # Emitting this.b.fill(...)
      sub $12, %esp
        # Emitting this.b
          # Emitting this
          movl 8(%ebp), %edi
        sub $4, %esp
        push %edi
        call Javali$CheckNull
        add $8, %esp
        movl 4(%edi), %edi
      push %edi
        # Emitting 0
        movl $0, %edi
      push %edi
      # Load "this" pointer
      movl 4(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 36(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
    # Emitting this.b.print(...)
      # Emitting this.b.print(...)
        # Emitting this.b
          # Emitting this
          movl 8(%ebp), %edi
        push %edi
        call Javali$CheckNull
        add $4, %esp
        movl 4(%edi), %edi
      push %edi
      # Load "this" pointer
      movl 0(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 8(%edi), %edi
      call *%edi
      add $4, %esp
      movl %eax, %edi
    # Emitting winner = 0
      # Emitting 0
      movl $0, %edi
    movl %edi, -12(%ebp)
    # Emitting currentPlayer = 1
      # Emitting 1
      movl $1, %edi
    movl %edi, -16(%ebp)
  # Exit to block 2
  jmp label75
# __Basic block 1_____________________________________________________
label74:
  # Return
  jmp label90
# __Basic block 2_____________________________________________________
label75:
  # Exit to block 3 if true, block 4 if false
    # Emitting (((0 == winner) && !(this.b.full(...))) && !(this.b.contains(...)))
      # Emitting ((0 == winner) && !(this.b.full(...)))
        # Emitting (0 == winner)
          # Emitting 0
          movl $0, %edi
          # Emitting winner
          movl -12(%ebp), %esi
        cmpl %esi, %edi
        push %eax
        movl $0, %eax
        sete %al
        movl %eax, %edi
        pop %eax
        # Emitting !(this.b.full(...))
          # Emitting this.b.full(...)
            # Emitting this.b
              # Emitting this
              movl 8(%ebp), %esi
            push %esi
            call Javali$CheckNull
            add $4, %esp
            movl 4(%esi), %esi
          push %esi
          # Load "this" pointer
          movl 0(%esp), %esi
          sub $12, %esp
          push %esi
          call Javali$CheckNull
          add $16, %esp
          movl 0(%esi), %esi
          movl 76(%esi), %esi
          call *%esi
          add $4, %esp
          movl %eax, %esi
        negl %esi
        incl %esi
      andl %esi, %edi
      # Emitting !(this.b.contains(...))
        # Emitting this.b.contains(...)
        sub $12, %esp
          # Emitting this.b
            # Emitting this
            movl 8(%ebp), %esi
          sub $4, %esp
          push %esi
          call Javali$CheckNull
          add $8, %esp
          movl 4(%esi), %esi
        push %esi
          # Emitting 9
          movl $9, %esi
        push %esi
        # Load "this" pointer
        movl 4(%esp), %esi
        sub $12, %esp
        push %esi
        call Javali$CheckNull
        add $16, %esp
        movl 0(%esi), %esi
        movl 4(%esi), %esi
        call *%esi
        add $20, %esp
        movl %eax, %esi
      negl %esi
      incl %esi
    andl %esi, %edi
  cmpl $0, %edi
  je label77
  jmp label76
# __Basic block 3_____________________________________________________
label76:
  # Exit to block 5 if true, block 6 if false
    # Emitting this.runPlayer(...)
    sub $12, %esp
      # Emitting this
      movl 8(%ebp), %edi
    push %edi
      # Emitting currentPlayer
      movl -16(%ebp), %edi
    push %edi
    # Load "this" pointer
    movl 4(%esp), %edi
    sub $12, %esp
    push %edi
    call Javali$CheckNull
    add $16, %esp
    movl 0(%edi), %edi
    movl 12(%edi), %edi
    call *%edi
    add $20, %esp
    movl %eax, %edi
  cmpl $0, %edi
  je label79
  jmp label78
# __Basic block 4_____________________________________________________
label77:
  # Exit to block 8 if true, block 9 if false
    # Emitting (1 == winner)
      # Emitting 1
      movl $1, %edi
      # Emitting winner
      movl -12(%ebp), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    sete %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label82
  jmp label81
# __Basic block 5_____________________________________________________
label78:
    # Emitting winner = currentPlayer
      # Emitting currentPlayer
      movl -16(%ebp), %edi
    movl %edi, -12(%ebp)
  # Exit to block 7
  jmp label80
# __Basic block 6_____________________________________________________
label79:
    # Emitting nop
  # Exit to block 7
  jmp label80
# __Basic block 7_____________________________________________________
label80:
    # Emitting currentPlayer = (3 - currentPlayer)
      # Emitting (3 - currentPlayer)
        # Emitting 3
        movl $3, %edi
        # Emitting currentPlayer
        movl -16(%ebp), %esi
      subl %esi, %edi
    movl %edi, -16(%ebp)
  # Exit to block 2
  jmp label75
# __Basic block 8_____________________________________________________
label81:
    # Emitting this.b.fill(...)
      # Emitting this.b.fill(...)
      sub $12, %esp
        # Emitting this.b
          # Emitting this
          movl 8(%ebp), %edi
        sub $4, %esp
        push %edi
        call Javali$CheckNull
        add $8, %esp
        movl 4(%edi), %edi
      push %edi
        # Emitting 1
        movl $1, %edi
      push %edi
      # Load "this" pointer
      movl 4(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 36(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
  # Exit to block 16
  jmp label89
# __Basic block 9_____________________________________________________
label82:
  # Exit to block 10 if true, block 11 if false
    # Emitting (2 == winner)
      # Emitting 2
      movl $2, %edi
      # Emitting winner
      movl -12(%ebp), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    sete %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label84
  jmp label83
# __Basic block 10____________________________________________________
label83:
    # Emitting this.b.fill(...)
      # Emitting this.b.fill(...)
      sub $12, %esp
        # Emitting this.b
          # Emitting this
          movl 8(%ebp), %edi
        sub $4, %esp
        push %edi
        call Javali$CheckNull
        add $8, %esp
        movl 4(%edi), %edi
      push %edi
        # Emitting 2
        movl $2, %edi
      push %edi
      # Load "this" pointer
      movl 4(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 36(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
  # Exit to block 15
  jmp label88
# __Basic block 11____________________________________________________
label84:
  # Exit to block 12 if true, block 13 if false
    # Emitting this.b.contains(...)
    sub $12, %esp
      # Emitting this.b
        # Emitting this
        movl 8(%ebp), %edi
      sub $4, %esp
      push %edi
      call Javali$CheckNull
      add $8, %esp
      movl 4(%edi), %edi
    push %edi
      # Emitting 9
      movl $9, %edi
    push %edi
    # Load "this" pointer
    movl 4(%esp), %edi
    sub $12, %esp
    push %edi
    call Javali$CheckNull
    add $16, %esp
    movl 0(%edi), %edi
    movl 4(%edi), %edi
    call *%edi
    add $20, %esp
    movl %eax, %edi
  cmpl $0, %edi
  je label86
  jmp label85
# __Basic block 12____________________________________________________
label85:
    # Emitting this.b.fill(...)
      # Emitting this.b.fill(...)
      sub $12, %esp
        # Emitting this.b
          # Emitting this
          movl 8(%ebp), %edi
        sub $4, %esp
        push %edi
        call Javali$CheckNull
        add $8, %esp
        movl 4(%edi), %edi
      push %edi
        # Emitting 9
        movl $9, %edi
      push %edi
      # Load "this" pointer
      movl 4(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 36(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
  # Exit to block 14
  jmp label87
# __Basic block 13____________________________________________________
label86:
    # Emitting this.b.fill(...)
      # Emitting this.b.fill(...)
      sub $12, %esp
        # Emitting this.b
          # Emitting this
          movl 8(%ebp), %edi
        sub $4, %esp
        push %edi
        call Javali$CheckNull
        add $8, %esp
        movl 4(%edi), %edi
      push %edi
        # Emitting 0
        movl $0, %edi
      push %edi
      # Load "this" pointer
      movl 4(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 36(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
  # Exit to block 14
  jmp label87
# __Basic block 14____________________________________________________
label87:
  # Exit to block 15
  jmp label88
# __Basic block 15____________________________________________________
label88:
  # Exit to block 16
  jmp label89
# __Basic block 16____________________________________________________
label89:
  # Exit to block 1
  jmp label74
label90:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Main.main__________________________________________________
  .globl Main_main
Main_main:
  # Variable     Offset
  # i            -12
  # n            -16
  # implicit=8 localSlot=20 sum=28
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  jmp label91
# __Basic block 0_____________________________________________________
label91:
    # Emitting this.b = new Board()
      # Emitting new Board()
      push $12
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_Board, 0(%edi)
      # Emitting this
      movl 8(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 4(%esi)
    # Emitting this.b.Board(...)
      # Emitting this.b.Board(...)
        # Emitting this.b
          # Emitting this
          movl 8(%ebp), %edi
        push %edi
        call Javali$CheckNull
        add $4, %esp
        movl 4(%edi), %edi
      push %edi
      # Load "this" pointer
      movl 0(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 52(%edi), %edi
      call *%edi
      add $4, %esp
      movl %eax, %edi
    # Emitting n = read()
      # Emitting read()
      sub $4, %esp
      call Javali$ReadInteger
      add $4, %esp
      movl %eax, %edi
    movl %edi, -16(%ebp)
    # Emitting i = 0
      # Emitting 0
      movl $0, %edi
    movl %edi, -12(%ebp)
  # Exit to block 2
  jmp label93
# __Basic block 1_____________________________________________________
label92:
  # Return
  jmp label96
# __Basic block 2_____________________________________________________
label93:
  # Exit to block 3 if true, block 4 if false
    # Emitting (i < n)
      # Emitting i
      movl -12(%ebp), %edi
      # Emitting n
      movl -16(%ebp), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label95
  jmp label94
# __Basic block 3_____________________________________________________
label94:
    # Emitting this.runGame(...)
      # Emitting this.runGame(...)
        # Emitting this
        movl 8(%ebp), %edi
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
      add $4, %esp
      movl %eax, %edi
    # Emitting this.b.print(...)
      # Emitting this.b.print(...)
        # Emitting this.b
          # Emitting this
          movl 8(%ebp), %edi
        push %edi
        call Javali$CheckNull
        add $4, %esp
        movl 4(%edi), %edi
      push %edi
      # Load "this" pointer
      movl 0(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 8(%edi), %edi
      call *%edi
      add $4, %esp
      movl %eax, %edi
    # Emitting i = (i + 1)
      # Emitting (i + 1)
        # Emitting i
        movl -12(%ebp), %edi
        # Emitting 1
        movl $1, %esi
      addl %esi, %edi
    movl %edi, -12(%ebp)
  # Exit to block 2
  jmp label93
# __Basic block 4_____________________________________________________
label95:
  # Exit to block 1
  jmp label92
label96:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
# Class Matrix________________________________________________________
  # 
  .section .text
# __Method Matrix.Matrix______________________________________________
  .globl Matrix_Matrix
Matrix_Matrix:
  # Variable     Offset
  # temp         -12
  # i            -16
  # implicit=8 localSlot=20 sum=28
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  jmp label97
# __Basic block 0_____________________________________________________
label97:
    # Emitting this.m = m
      # Emitting m
      movl 16(%ebp), %edi
      # Emitting this
      movl 20(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 8(%esi)
    # Emitting this.vectors = new Vector[][n]
      # Emitting new Vector[][n]
        # Emitting n
        movl 12(%ebp), %edi
      push %edi
      call Javali$CheckArraySize
      add $4, %esp
      movl %edi, %esi
      imul $4, %edi
      addl $8, %edi
      push %edi
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtablearr_Vector, 0(%edi)
      movl %esi, 4(%edi)
      # Emitting this
      movl 20(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 4(%esi)
    # Emitting i = 0
      # Emitting 0
      movl $0, %edi
    movl %edi, -16(%ebp)
  # Exit to block 2
  jmp label99
# __Basic block 1_____________________________________________________
label98:
  # Return
  jmp label102
# __Basic block 2_____________________________________________________
label99:
  # Exit to block 3 if true, block 4 if false
    # Emitting (i < m)
      # Emitting i
      movl -16(%ebp), %edi
      # Emitting m
      movl 16(%ebp), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label101
  jmp label100
# __Basic block 3_____________________________________________________
label100:
    # Emitting temp = new Vector()
      # Emitting new Vector()
      push $12
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_Vector, 0(%edi)
    movl %edi, -12(%ebp)
    # Emitting temp.Vector(...)
      # Emitting temp.Vector(...)
      sub $8, %esp
        # Emitting temp
        movl -12(%ebp), %edi
      push %edi
        # Emitting n
        movl 12(%ebp), %edi
      push %edi
        # Emitting default
        movl 8(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 8(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 32(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
    # Emitting this.vectors[i] = temp
      # Emitting temp
      movl -12(%ebp), %edi
      # Emitting this.vectors
        # Emitting this
        movl 20(%ebp), %esi
      push %esi
      call Javali$CheckNull
      add $4, %esp
      movl 4(%esi), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
      # Emitting i
      movl -16(%ebp), %edx
    push %edx
    sub $8, %esp
    push %edx
    push %esi
    call Javali$CheckArrayBounds
    add $16, %esp
    pop %edx
    movl %edi, 8(%esi,%edx,4)
    # Emitting i = (i + 1)
      # Emitting (i + 1)
        # Emitting i
        movl -16(%ebp), %edi
        # Emitting 1
        movl $1, %edx
      addl %edx, %edi
    movl %edi, -16(%ebp)
  # Exit to block 2
  jmp label99
# __Basic block 4_____________________________________________________
label101:
  # Exit to block 1
  jmp label98
label102:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Matrix.fill________________________________________________
  .globl Matrix_fill
Matrix_fill:
  # Variable     Offset
  # i            -12
  # implicit=8 localSlot=16 sum=24
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  jmp label103
# __Basic block 0_____________________________________________________
label103:
    # Emitting i = 0
      # Emitting 0
      movl $0, %edi
    movl %edi, -12(%ebp)
  # Exit to block 2
  jmp label105
# __Basic block 1_____________________________________________________
label104:
  # Return
  jmp label108
# __Basic block 2_____________________________________________________
label105:
  # Exit to block 3 if true, block 4 if false
    # Emitting (i < this.m)
      # Emitting i
      movl -12(%ebp), %edi
      # Emitting this.m
        # Emitting this
        movl 12(%ebp), %esi
      push %esi
      call Javali$CheckNull
      add $4, %esp
      movl 8(%esi), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label107
  jmp label106
# __Basic block 3_____________________________________________________
label106:
    # Emitting this.vectors[i].fill(...)
      # Emitting this.vectors[i].fill(...)
      sub $12, %esp
        # Emitting this.vectors[i]
          # Emitting this.vectors
            # Emitting this
            movl 12(%ebp), %edi
          sub $4, %esp
          push %edi
          call Javali$CheckNull
          add $8, %esp
          movl 4(%edi), %edi
        sub $4, %esp
        push %edi
        call Javali$CheckNull
        add $8, %esp
          # Emitting i
          movl -12(%ebp), %esi
        push %esi
        push %edi
        call Javali$CheckArrayBounds
        add $8, %esp
        movl 8(%edi,%esi,4), %esi
      push %esi
        # Emitting value
        movl 8(%ebp), %esi
      push %esi
      # Load "this" pointer
      movl 4(%esp), %esi
      sub $12, %esp
      push %esi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%esi), %esi
      movl 28(%esi), %esi
      call *%esi
      add $20, %esp
      movl %eax, %esi
    # Emitting i = (i + 1)
      # Emitting (i + 1)
        # Emitting i
        movl -12(%ebp), %esi
        # Emitting 1
        movl $1, %edi
      addl %edi, %esi
    movl %esi, -12(%ebp)
  # Exit to block 2
  jmp label105
# __Basic block 4_____________________________________________________
label107:
  # Exit to block 1
  jmp label104
label108:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Matrix.contains____________________________________________
  .globl Matrix_contains
Matrix_contains:
  # Variable     Offset
  # i            -12
  # implicit=8 localSlot=16 sum=24
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  jmp label109
# __Basic block 0_____________________________________________________
label109:
    # Emitting i = 0
      # Emitting 0
      movl $0, %edi
    movl %edi, -12(%ebp)
  # Exit to block 2
  jmp label111
# __Basic block 1_____________________________________________________
label110:
  # Return
  jmp label117
# __Basic block 2_____________________________________________________
label111:
  # Exit to block 3 if true, block 4 if false
    # Emitting (i < this.m)
      # Emitting i
      movl -12(%ebp), %edi
      # Emitting this.m
        # Emitting this
        movl 12(%ebp), %esi
      push %esi
      call Javali$CheckNull
      add $4, %esp
      movl 8(%esi), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label113
  jmp label112
# __Basic block 3_____________________________________________________
label112:
  # Exit to block 5 if true, block 6 if false
    # Emitting this.vectors[i].contains(...)
    sub $12, %esp
      # Emitting this.vectors[i]
        # Emitting this.vectors
          # Emitting this
          movl 12(%ebp), %edi
        sub $4, %esp
        push %edi
        call Javali$CheckNull
        add $8, %esp
        movl 4(%edi), %edi
      sub $4, %esp
      push %edi
      call Javali$CheckNull
      add $8, %esp
        # Emitting i
        movl -12(%ebp), %esi
      push %esi
      push %edi
      call Javali$CheckArrayBounds
      add $8, %esp
      movl 8(%edi,%esi,4), %esi
    push %esi
      # Emitting value
      movl 8(%ebp), %esi
    push %esi
    # Load "this" pointer
    movl 4(%esp), %esi
    sub $12, %esp
    push %esi
    call Javali$CheckNull
    add $16, %esp
    movl 0(%esi), %esi
    movl 4(%esi), %esi
    call *%esi
    add $20, %esp
    movl %eax, %esi
  cmpl $0, %esi
  je label115
  jmp label114
# __Basic block 4_____________________________________________________
label113:
    # Emitting return false
      # Emitting false
      movl $0, %esi
    movl %esi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label110
# __Basic block 5_____________________________________________________
label114:
    # Emitting return true
      # Emitting true
      movl $1, %esi
    movl %esi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label110
# __Basic block 6_____________________________________________________
label115:
    # Emitting nop
  # Exit to block 7
  jmp label116
# __Basic block 7_____________________________________________________
label116:
    # Emitting i = (i + 1)
      # Emitting (i + 1)
        # Emitting i
        movl -12(%ebp), %esi
        # Emitting 1
        movl $1, %edi
      addl %edi, %esi
    movl %esi, -12(%ebp)
  # Exit to block 2
  jmp label111
label117:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Matrix.compactOK___________________________________________
  .globl Matrix_compactOK
Matrix_compactOK:
  # Variable     Offset
  # i            -12
  # implicit=8 localSlot=16 sum=24
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  jmp label118
# __Basic block 0_____________________________________________________
label118:
    # Emitting i = 0
      # Emitting 0
      movl $0, %edi
    movl %edi, -12(%ebp)
  # Exit to block 2
  jmp label120
# __Basic block 1_____________________________________________________
label119:
  # Return
  jmp label126
# __Basic block 2_____________________________________________________
label120:
  # Exit to block 3 if true, block 4 if false
    # Emitting (i < this.m)
      # Emitting i
      movl -12(%ebp), %edi
      # Emitting this.m
        # Emitting this
        movl 8(%ebp), %esi
      push %esi
      call Javali$CheckNull
      add $4, %esp
      movl 8(%esi), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label122
  jmp label121
# __Basic block 3_____________________________________________________
label121:
  # Exit to block 5 if true, block 6 if false
    # Emitting !(this.vectors[i].compactOK(...))
      # Emitting this.vectors[i].compactOK(...)
        # Emitting this.vectors[i]
          # Emitting this.vectors
            # Emitting this
            movl 8(%ebp), %edi
          push %edi
          call Javali$CheckNull
          add $4, %esp
          movl 4(%edi), %edi
        push %edi
        call Javali$CheckNull
        add $4, %esp
          # Emitting i
          movl -12(%ebp), %esi
        sub $12, %esp
        push %esi
        push %edi
        call Javali$CheckArrayBounds
        add $20, %esp
        movl 8(%edi,%esi,4), %esi
      push %esi
      # Load "this" pointer
      movl 0(%esp), %esi
      sub $12, %esp
      push %esi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%esi), %esi
      movl 24(%esi), %esi
      call *%esi
      add $4, %esp
      movl %eax, %esi
    negl %esi
    incl %esi
  cmpl $0, %esi
  je label124
  jmp label123
# __Basic block 4_____________________________________________________
label122:
    # Emitting return true
      # Emitting true
      movl $1, %esi
    movl %esi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label119
# __Basic block 5_____________________________________________________
label123:
    # Emitting return false
      # Emitting false
      movl $0, %esi
    movl %esi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label119
# __Basic block 6_____________________________________________________
label124:
    # Emitting nop
  # Exit to block 7
  jmp label125
# __Basic block 7_____________________________________________________
label125:
    # Emitting i = (i + 1)
      # Emitting (i + 1)
        # Emitting i
        movl -12(%ebp), %esi
        # Emitting 1
        movl $1, %edi
      addl %edi, %esi
    movl %esi, -12(%ebp)
  # Exit to block 2
  jmp label120
label126:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Matrix.print_______________________________________________
  .globl Matrix_print
Matrix_print:
  # Variable     Offset
  # compact      -12
  # i            -16
  # implicit=8 localSlot=20 sum=28
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  jmp label127
# __Basic block 0_____________________________________________________
label127:
    # Emitting compact = this.compactOK(...)
      # Emitting this.compactOK(...)
        # Emitting this
        movl 8(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 0(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 32(%edi), %edi
      call *%edi
      add $4, %esp
      movl %eax, %edi
    movl %edi, -12(%ebp)
    # Emitting i = 0
      # Emitting 0
      movl $0, %edi
    movl %edi, -16(%ebp)
  # Exit to block 2
  jmp label129
# __Basic block 1_____________________________________________________
label128:
  # Return
  jmp label132
# __Basic block 2_____________________________________________________
label129:
  # Exit to block 3 if true, block 4 if false
    # Emitting (i < this.m)
      # Emitting i
      movl -16(%ebp), %edi
      # Emitting this.m
        # Emitting this
        movl 8(%ebp), %esi
      push %esi
      call Javali$CheckNull
      add $4, %esp
      movl 8(%esi), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label131
  jmp label130
# __Basic block 3_____________________________________________________
label130:
    # Emitting this.vectors[i].print2(...)
      # Emitting this.vectors[i].print2(...)
      sub $12, %esp
        # Emitting this.vectors[i]
          # Emitting this.vectors
            # Emitting this
            movl 8(%ebp), %edi
          sub $4, %esp
          push %edi
          call Javali$CheckNull
          add $8, %esp
          movl 4(%edi), %edi
        sub $4, %esp
        push %edi
        call Javali$CheckNull
        add $8, %esp
          # Emitting i
          movl -16(%ebp), %esi
        push %esi
        push %edi
        call Javali$CheckArrayBounds
        add $8, %esp
        movl 8(%edi,%esi,4), %esi
      push %esi
        # Emitting compact
        movl -12(%ebp), %esi
      push %esi
      # Load "this" pointer
      movl 4(%esp), %esi
      sub $12, %esp
      push %esi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%esi), %esi
      movl 12(%esi), %esi
      call *%esi
      add $20, %esp
      movl %eax, %esi
    # Emitting i = (i + 1)
      # Emitting (i + 1)
        # Emitting i
        movl -16(%ebp), %esi
        # Emitting 1
        movl $1, %edi
      addl %edi, %esi
    movl %esi, -16(%ebp)
  # Exit to block 2
  jmp label129
# __Basic block 4_____________________________________________________
label131:
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
  # Exit to block 1
  jmp label128
label132:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Matrix.set_________________________________________________
  .globl Matrix_set
Matrix_set:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label133
# __Basic block 0_____________________________________________________
label133:
    # Emitting this.vectors[i].set(...)
      # Emitting this.vectors[i].set(...)
      sub $8, %esp
        # Emitting this.vectors[i]
          # Emitting this.vectors
            # Emitting this
            movl 20(%ebp), %edi
          sub $8, %esp
          push %edi
          call Javali$CheckNull
          add $12, %esp
          movl 4(%edi), %edi
        sub $8, %esp
        push %edi
        call Javali$CheckNull
        add $12, %esp
          # Emitting i
          movl 16(%ebp), %esi
        sub $4, %esp
        push %esi
        push %edi
        call Javali$CheckArrayBounds
        add $12, %esp
        movl 8(%edi,%esi,4), %esi
      push %esi
        # Emitting j
        movl 12(%ebp), %esi
      push %esi
        # Emitting value
        movl 8(%ebp), %esi
      push %esi
      # Load "this" pointer
      movl 8(%esp), %esi
      sub $12, %esp
      push %esi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%esi), %esi
      movl 16(%esi), %esi
      call *%esi
      add $20, %esp
      movl %eax, %esi
  # Exit to block 1
  jmp label134
# __Basic block 1_____________________________________________________
label134:
  # Return
  jmp label135
label135:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Matrix.get_________________________________________________
  .globl Matrix_get
Matrix_get:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label136
# __Basic block 0_____________________________________________________
label136:
    # Emitting return this.vectors[i].get(...)
      # Emitting this.vectors[i].get(...)
      sub $12, %esp
        # Emitting this.vectors[i]
          # Emitting this.vectors
            # Emitting this
            movl 16(%ebp), %edi
          sub $4, %esp
          push %edi
          call Javali$CheckNull
          add $8, %esp
          movl 4(%edi), %edi
        sub $4, %esp
        push %edi
        call Javali$CheckNull
        add $8, %esp
          # Emitting i
          movl 12(%ebp), %esi
        push %esi
        push %edi
        call Javali$CheckArrayBounds
        add $8, %esp
        movl 8(%edi,%esi,4), %esi
      push %esi
        # Emitting j
        movl 8(%ebp), %esi
      push %esi
      # Load "this" pointer
      movl 4(%esp), %esi
      sub $12, %esp
      push %esi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%esi), %esi
      movl 20(%esi), %esi
      call *%esi
      add $20, %esp
      movl %eax, %esi
    movl %esi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label137
# __Basic block 1_____________________________________________________
label137:
  # Return
  jmp label138
label138:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Matrix.rows________________________________________________
  .globl Matrix_rows
Matrix_rows:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label139
# __Basic block 0_____________________________________________________
label139:
    # Emitting return this.m
      # Emitting this.m
        # Emitting this
        movl 8(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 8(%edi), %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label140
# __Basic block 1_____________________________________________________
label140:
  # Return
  jmp label141
label141:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Matrix.columns_____________________________________________
  .globl Matrix_columns
Matrix_columns:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label142
# __Basic block 0_____________________________________________________
label142:
    # Emitting return this.vectors[0].n
      # Emitting this.vectors[0].n
        # Emitting this.vectors[0]
          # Emitting this.vectors
            # Emitting this
            movl 8(%ebp), %edi
          push %edi
          call Javali$CheckNull
          add $4, %esp
          movl 4(%edi), %edi
        push %edi
        call Javali$CheckNull
        add $4, %esp
          # Emitting 0
          movl $0, %esi
        sub $12, %esp
        push %esi
        push %edi
        call Javali$CheckArrayBounds
        add $20, %esp
        movl 8(%edi,%esi,4), %esi
      push %esi
      call Javali$CheckNull
      add $4, %esp
      movl 8(%esi), %esi
    movl %esi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label143
# __Basic block 1_____________________________________________________
label143:
  # Return
  jmp label144
label144:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Matrix.mult________________________________________________
  .globl Matrix_mult
Matrix_mult:
  # Variable     Offset
  # i            -12
  # j            -16
  # sum          -20
  # k            -24
  # implicit=8 localSlot=28 sum=36
  enter $40, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  movl $0, -20(%ebp)
  movl $0, -24(%ebp)
  jmp label145
# __Basic block 0_____________________________________________________
label145:
  # Exit to block 2 if true, block 3 if false
    # Emitting ((null == A) || (null == B))
      # Emitting (null == A)
        # Emitting null
        movl $0, %edi
        # Emitting A
        movl 12(%ebp), %esi
      cmpl %esi, %edi
      push %eax
      movl $0, %eax
      sete %al
      movl %eax, %edi
      pop %eax
      # Emitting (null == B)
        # Emitting null
        movl $0, %esi
        # Emitting B
        movl 8(%ebp), %edx
      cmpl %edx, %esi
      push %eax
      movl $0, %eax
      sete %al
      movl %eax, %esi
      pop %eax
    orl %esi, %edi
  cmpl $0, %edi
  je label148
  jmp label147
# __Basic block 1_____________________________________________________
label146:
  # Return
  jmp label165
# __Basic block 2_____________________________________________________
label147:
    # Emitting return null
      # Emitting null
      movl $0, %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label146
# __Basic block 3_____________________________________________________
label148:
    # Emitting nop
  # Exit to block 4
  jmp label149
# __Basic block 4_____________________________________________________
label149:
  # Exit to block 5 if true, block 6 if false
    # Emitting ((this.rows(...) != A.rows(...)) || (this.columns(...) != B.columns(...)))
      # Emitting (this.rows(...) != A.rows(...))
        # Emitting this.rows(...)
          # Emitting this
          movl 16(%ebp), %edi
        push %edi
        # Load "this" pointer
        movl 0(%esp), %edi
        sub $12, %esp
        push %edi
        call Javali$CheckNull
        add $16, %esp
        movl 0(%edi), %edi
        movl 40(%edi), %edi
        call *%edi
        add $4, %esp
        movl %eax, %edi
        # Emitting A.rows(...)
          # Emitting A
          movl 12(%ebp), %esi
        push %esi
        # Load "this" pointer
        movl 0(%esp), %esi
        sub $12, %esp
        push %esi
        call Javali$CheckNull
        add $16, %esp
        movl 0(%esi), %esi
        movl 40(%esi), %esi
        call *%esi
        add $4, %esp
        movl %eax, %esi
      cmpl %esi, %edi
      push %eax
      movl $0, %eax
      setne %al
      movl %eax, %edi
      pop %eax
      # Emitting (this.columns(...) != B.columns(...))
        # Emitting this.columns(...)
          # Emitting this
          movl 16(%ebp), %esi
        push %esi
        # Load "this" pointer
        movl 0(%esp), %esi
        sub $12, %esp
        push %esi
        call Javali$CheckNull
        add $16, %esp
        movl 0(%esi), %esi
        movl 24(%esi), %esi
        call *%esi
        add $4, %esp
        movl %eax, %esi
        # Emitting B.columns(...)
          # Emitting B
          movl 8(%ebp), %edx
        push %edx
        # Load "this" pointer
        movl 0(%esp), %edx
        push %edx
        sub $8, %esp
        push %edx
        call Javali$CheckNull
        add $12, %esp
        pop %edx
        movl 0(%edx), %edx
        movl 24(%edx), %edx
        call *%edx
        add $4, %esp
        movl %eax, %edx
      cmpl %edx, %esi
      push %eax
      movl $0, %eax
      setne %al
      movl %eax, %esi
      pop %eax
    orl %esi, %edi
  cmpl $0, %edi
  je label151
  jmp label150
# __Basic block 5_____________________________________________________
label150:
    # Emitting return null
      # Emitting null
      movl $0, %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label146
# __Basic block 6_____________________________________________________
label151:
    # Emitting nop
  # Exit to block 7
  jmp label152
# __Basic block 7_____________________________________________________
label152:
  # Exit to block 8 if true, block 9 if false
    # Emitting (A.columns(...) != B.rows(...))
      # Emitting A.columns(...)
        # Emitting A
        movl 12(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 0(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 24(%edi), %edi
      call *%edi
      add $4, %esp
      movl %eax, %edi
      # Emitting B.rows(...)
        # Emitting B
        movl 8(%ebp), %esi
      push %esi
      # Load "this" pointer
      movl 0(%esp), %esi
      sub $12, %esp
      push %esi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%esi), %esi
      movl 40(%esi), %esi
      call *%esi
      add $4, %esp
      movl %eax, %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setne %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label154
  jmp label153
# __Basic block 8_____________________________________________________
label153:
    # Emitting return null
      # Emitting null
      movl $0, %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label146
# __Basic block 9_____________________________________________________
label154:
    # Emitting nop
  # Exit to block 10
  jmp label155
# __Basic block 10____________________________________________________
label155:
    # Emitting i = 0
      # Emitting 0
      movl $0, %edi
    movl %edi, -12(%ebp)
  # Exit to block 11
  jmp label156
# __Basic block 11____________________________________________________
label156:
  # Exit to block 12 if true, block 13 if false
    # Emitting (i < this.rows(...))
      # Emitting i
      movl -12(%ebp), %edi
      # Emitting this.rows(...)
        # Emitting this
        movl 16(%ebp), %esi
      push %esi
      # Load "this" pointer
      movl 0(%esp), %esi
      sub $12, %esp
      push %esi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%esi), %esi
      movl 40(%esi), %esi
      call *%esi
      add $4, %esp
      movl %eax, %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label158
  jmp label157
# __Basic block 12____________________________________________________
label157:
    # Emitting j = 0
      # Emitting 0
      movl $0, %edi
    movl %edi, -16(%ebp)
  # Exit to block 14
  jmp label159
# __Basic block 13____________________________________________________
label158:
    # Emitting return this
      # Emitting this
      movl 16(%ebp), %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label146
# __Basic block 14____________________________________________________
label159:
  # Exit to block 15 if true, block 16 if false
    # Emitting (j < this.columns(...))
      # Emitting j
      movl -16(%ebp), %edi
      # Emitting this.columns(...)
        # Emitting this
        movl 16(%ebp), %esi
      push %esi
      # Load "this" pointer
      movl 0(%esp), %esi
      sub $12, %esp
      push %esi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%esi), %esi
      movl 24(%esi), %esi
      call *%esi
      add $4, %esp
      movl %eax, %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label161
  jmp label160
# __Basic block 15____________________________________________________
label160:
    # Emitting sum = 0
      # Emitting 0
      movl $0, %edi
    movl %edi, -20(%ebp)
    # Emitting k = 0
      # Emitting 0
      movl $0, %edi
    movl %edi, -24(%ebp)
  # Exit to block 17
  jmp label162
# __Basic block 16____________________________________________________
label161:
    # Emitting i = (i + 1)
      # Emitting (i + 1)
        # Emitting i
        movl -12(%ebp), %edi
        # Emitting 1
        movl $1, %esi
      addl %esi, %edi
    movl %edi, -12(%ebp)
  # Exit to block 11
  jmp label156
# __Basic block 17____________________________________________________
label162:
  # Exit to block 18 if true, block 19 if false
    # Emitting (k < this.columns(...))
      # Emitting k
      movl -24(%ebp), %edi
      # Emitting this.columns(...)
        # Emitting this
        movl 16(%ebp), %esi
      push %esi
      # Load "this" pointer
      movl 0(%esp), %esi
      sub $12, %esp
      push %esi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%esi), %esi
      movl 24(%esi), %esi
      call *%esi
      add $4, %esp
      movl %eax, %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label164
  jmp label163
# __Basic block 18____________________________________________________
label163:
    # Emitting sum = (sum + (A.get(...) * B.get(...)))
      # Emitting (sum + (A.get(...) * B.get(...)))
        # Emitting sum
        movl -20(%ebp), %edi
        # Emitting (A.get(...) * B.get(...))
          # Emitting A.get(...)
          sub $8, %esp
            # Emitting A
            movl 12(%ebp), %esi
          push %esi
            # Emitting i
            movl -12(%ebp), %esi
          push %esi
            # Emitting k
            movl -24(%ebp), %esi
          push %esi
          # Load "this" pointer
          movl 8(%esp), %esi
          sub $12, %esp
          push %esi
          call Javali$CheckNull
          add $16, %esp
          movl 0(%esi), %esi
          movl 28(%esi), %esi
          call *%esi
          add $20, %esp
          movl %eax, %esi
          # Emitting B.get(...)
          sub $8, %esp
            # Emitting B
            movl 8(%ebp), %edx
          push %edx
            # Emitting k
            movl -24(%ebp), %edx
          push %edx
            # Emitting j
            movl -16(%ebp), %edx
          push %edx
          # Load "this" pointer
          movl 8(%esp), %edx
          push %edx
          sub $8, %esp
          push %edx
          call Javali$CheckNull
          add $12, %esp
          pop %edx
          movl 0(%edx), %edx
          movl 28(%edx), %edx
          call *%edx
          add $20, %esp
          movl %eax, %edx
        imull %edx, %esi
      addl %esi, %edi
    movl %edi, -20(%ebp)
    # Emitting k = (k + 1)
      # Emitting (k + 1)
        # Emitting k
        movl -24(%ebp), %edi
        # Emitting 1
        movl $1, %esi
      addl %esi, %edi
    movl %edi, -24(%ebp)
  # Exit to block 17
  jmp label162
# __Basic block 19____________________________________________________
label164:
    # Emitting this.set(...)
      # Emitting this.set(...)
      sub $4, %esp
        # Emitting this
        movl 16(%ebp), %edi
      push %edi
        # Emitting i
        movl -12(%ebp), %edi
      push %edi
        # Emitting j
        movl -16(%ebp), %edi
      push %edi
        # Emitting sum
        movl -20(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 12(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 16(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
    # Emitting j = (j + 1)
      # Emitting (j + 1)
        # Emitting j
        movl -16(%ebp), %edi
        # Emitting 1
        movl $1, %esi
      addl %esi, %edi
    movl %edi, -16(%ebp)
  # Exit to block 14
  jmp label159
label165:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
# Class SquareMatrix__________________________________________________
  # 
  .section .text
# __Method SquareMatrix.SquareMatrix__________________________________
  .globl SquareMatrix_SquareMatrix
SquareMatrix_SquareMatrix:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label166
# __Basic block 0_____________________________________________________
label166:
    # Emitting this.Matrix(...)
      # Emitting this.Matrix(...)
      sub $4, %esp
        # Emitting this
        movl 16(%ebp), %edi
      push %edi
        # Emitting n
        movl 12(%ebp), %edi
      push %edi
        # Emitting n
        movl 12(%ebp), %edi
      push %edi
        # Emitting default
        movl 8(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 12(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 12(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
  # Exit to block 1
  jmp label167
# __Basic block 1_____________________________________________________
label167:
  # Return
  jmp label168
label168:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method SquareMatrix.fillIdentity__________________________________
  .globl SquareMatrix_fillIdentity
SquareMatrix_fillIdentity:
  # Variable     Offset
  # i            -12
  # implicit=8 localSlot=16 sum=24
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  jmp label169
# __Basic block 0_____________________________________________________
label169:
    # Emitting i = 0
      # Emitting 0
      movl $0, %edi
    movl %edi, -12(%ebp)
  # Exit to block 2
  jmp label171
# __Basic block 1_____________________________________________________
label170:
  # Return
  jmp label174
# __Basic block 2_____________________________________________________
label171:
  # Exit to block 3 if true, block 4 if false
    # Emitting (i < this.m)
      # Emitting i
      movl -12(%ebp), %edi
      # Emitting this.m
        # Emitting this
        movl 8(%ebp), %esi
      push %esi
      call Javali$CheckNull
      add $4, %esp
      movl 8(%esi), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label173
  jmp label172
# __Basic block 3_____________________________________________________
label172:
    # Emitting this.set(...)
      # Emitting this.set(...)
      sub $4, %esp
        # Emitting this
        movl 8(%ebp), %edi
      push %edi
        # Emitting i
        movl -12(%ebp), %edi
      push %edi
        # Emitting i
        movl -12(%ebp), %edi
      push %edi
        # Emitting 1
        movl $1, %edi
      push %edi
      # Load "this" pointer
      movl 12(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 16(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
    # Emitting i = (i + 1)
      # Emitting (i + 1)
        # Emitting i
        movl -12(%ebp), %edi
        # Emitting 1
        movl $1, %esi
      addl %esi, %edi
    movl %edi, -12(%ebp)
  # Exit to block 2
  jmp label171
# __Basic block 4_____________________________________________________
label173:
  # Exit to block 1
  jmp label170
label174:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
# Class Vector________________________________________________________
  # 
  .section .text
# __Method Vector.Vector______________________________________________
  .globl Vector_Vector
Vector_Vector:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label175
# __Basic block 0_____________________________________________________
label175:
    # Emitting this.n = n
      # Emitting n
      movl 12(%ebp), %edi
      # Emitting this
      movl 16(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 8(%esi)
    # Emitting this.v = new int[][n]
      # Emitting new int[][n]
        # Emitting n
        movl 12(%ebp), %edi
      push %edi
      call Javali$CheckArraySize
      add $4, %esp
      movl %edi, %esi
      imul $4, %edi
      addl $8, %edi
      push %edi
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtablearr_int, 0(%edi)
      movl %esi, 4(%edi)
      # Emitting this
      movl 16(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 4(%esi)
    # Emitting this.fill(...)
      # Emitting this.fill(...)
      sub $12, %esp
        # Emitting this
        movl 16(%ebp), %edi
      push %edi
        # Emitting default
        movl 8(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 4(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 28(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
  # Exit to block 1
  jmp label176
# __Basic block 1_____________________________________________________
label176:
  # Return
  jmp label177
label177:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Vector.fill________________________________________________
  .globl Vector_fill
Vector_fill:
  # Variable     Offset
  # i            -12
  # implicit=8 localSlot=16 sum=24
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  jmp label178
# __Basic block 0_____________________________________________________
label178:
    # Emitting i = 0
      # Emitting 0
      movl $0, %edi
    movl %edi, -12(%ebp)
  # Exit to block 2
  jmp label180
# __Basic block 1_____________________________________________________
label179:
  # Return
  jmp label183
# __Basic block 2_____________________________________________________
label180:
  # Exit to block 3 if true, block 4 if false
    # Emitting (i < this.n)
      # Emitting i
      movl -12(%ebp), %edi
      # Emitting this.n
        # Emitting this
        movl 12(%ebp), %esi
      push %esi
      call Javali$CheckNull
      add $4, %esp
      movl 8(%esi), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label182
  jmp label181
# __Basic block 3_____________________________________________________
label181:
    # Emitting this.v[i] = value
      # Emitting value
      movl 8(%ebp), %edi
      # Emitting this.v
        # Emitting this
        movl 12(%ebp), %esi
      push %esi
      call Javali$CheckNull
      add $4, %esp
      movl 4(%esi), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
      # Emitting i
      movl -12(%ebp), %edx
    push %edx
    sub $8, %esp
    push %edx
    push %esi
    call Javali$CheckArrayBounds
    add $16, %esp
    pop %edx
    movl %edi, 8(%esi,%edx,4)
    # Emitting i = (i + 1)
      # Emitting (i + 1)
        # Emitting i
        movl -12(%ebp), %edi
        # Emitting 1
        movl $1, %edx
      addl %edx, %edi
    movl %edi, -12(%ebp)
  # Exit to block 2
  jmp label180
# __Basic block 4_____________________________________________________
label182:
  # Exit to block 1
  jmp label179
label183:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Vector.contains____________________________________________
  .globl Vector_contains
Vector_contains:
  # Variable     Offset
  # i            -12
  # implicit=8 localSlot=16 sum=24
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  jmp label184
# __Basic block 0_____________________________________________________
label184:
    # Emitting i = 0
      # Emitting 0
      movl $0, %edi
    movl %edi, -12(%ebp)
  # Exit to block 2
  jmp label186
# __Basic block 1_____________________________________________________
label185:
  # Return
  jmp label192
# __Basic block 2_____________________________________________________
label186:
  # Exit to block 3 if true, block 4 if false
    # Emitting (i < this.n)
      # Emitting i
      movl -12(%ebp), %edi
      # Emitting this.n
        # Emitting this
        movl 12(%ebp), %esi
      push %esi
      call Javali$CheckNull
      add $4, %esp
      movl 8(%esi), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label188
  jmp label187
# __Basic block 3_____________________________________________________
label187:
  # Exit to block 5 if true, block 6 if false
    # Emitting (this.v[i] == value)
      # Emitting this.v[i]
        # Emitting this.v
          # Emitting this
          movl 12(%ebp), %edi
        push %edi
        call Javali$CheckNull
        add $4, %esp
        movl 4(%edi), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
        # Emitting i
        movl -12(%ebp), %esi
      sub $12, %esp
      push %esi
      push %edi
      call Javali$CheckArrayBounds
      add $20, %esp
      movl 8(%edi,%esi,4), %esi
      # Emitting value
      movl 8(%ebp), %edi
    cmpl %edi, %esi
    push %eax
    movl $0, %eax
    sete %al
    movl %eax, %esi
    pop %eax
  cmpl $0, %esi
  je label190
  jmp label189
# __Basic block 4_____________________________________________________
label188:
    # Emitting return false
      # Emitting false
      movl $0, %esi
    movl %esi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label185
# __Basic block 5_____________________________________________________
label189:
    # Emitting return true
      # Emitting true
      movl $1, %esi
    movl %esi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label185
# __Basic block 6_____________________________________________________
label190:
    # Emitting nop
  # Exit to block 7
  jmp label191
# __Basic block 7_____________________________________________________
label191:
    # Emitting i = (i + 1)
      # Emitting (i + 1)
        # Emitting i
        movl -12(%ebp), %esi
        # Emitting 1
        movl $1, %edi
      addl %edi, %esi
    movl %esi, -12(%ebp)
  # Exit to block 2
  jmp label186
label192:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Vector.compactOK___________________________________________
  .globl Vector_compactOK
Vector_compactOK:
  # Variable     Offset
  # i            -12
  # value        -16
  # implicit=8 localSlot=20 sum=28
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  jmp label193
# __Basic block 0_____________________________________________________
label193:
    # Emitting i = 0
      # Emitting 0
      movl $0, %edi
    movl %edi, -12(%ebp)
  # Exit to block 2
  jmp label195
# __Basic block 1_____________________________________________________
label194:
  # Return
  jmp label201
# __Basic block 2_____________________________________________________
label195:
  # Exit to block 3 if true, block 4 if false
    # Emitting (i < this.n)
      # Emitting i
      movl -12(%ebp), %edi
      # Emitting this.n
        # Emitting this
        movl 8(%ebp), %esi
      push %esi
      call Javali$CheckNull
      add $4, %esp
      movl 8(%esi), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label197
  jmp label196
# __Basic block 3_____________________________________________________
label196:
    # Emitting value = this.v[i]
      # Emitting this.v[i]
        # Emitting this.v
          # Emitting this
          movl 8(%ebp), %edi
        push %edi
        call Javali$CheckNull
        add $4, %esp
        movl 4(%edi), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
        # Emitting i
        movl -12(%ebp), %esi
      sub $12, %esp
      push %esi
      push %edi
      call Javali$CheckArrayBounds
      add $20, %esp
      movl 8(%edi,%esi,4), %esi
    movl %esi, -16(%ebp)
  # Exit to block 5 if true, block 6 if false
    # Emitting ((value < 0) || (9 < value))
      # Emitting (value < 0)
        # Emitting value
        movl -16(%ebp), %esi
        # Emitting 0
        movl $0, %edi
      cmpl %edi, %esi
      push %eax
      movl $0, %eax
      setl %al
      movl %eax, %esi
      pop %eax
      # Emitting (9 < value)
        # Emitting 9
        movl $9, %edi
        # Emitting value
        movl -16(%ebp), %edx
      cmpl %edx, %edi
      push %eax
      movl $0, %eax
      setl %al
      movl %eax, %edi
      pop %eax
    orl %edi, %esi
  cmpl $0, %esi
  je label199
  jmp label198
# __Basic block 4_____________________________________________________
label197:
    # Emitting return true
      # Emitting true
      movl $1, %esi
    movl %esi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label194
# __Basic block 5_____________________________________________________
label198:
    # Emitting return false
      # Emitting false
      movl $0, %esi
    movl %esi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label194
# __Basic block 6_____________________________________________________
label199:
    # Emitting nop
  # Exit to block 7
  jmp label200
# __Basic block 7_____________________________________________________
label200:
    # Emitting i = (i + 1)
      # Emitting (i + 1)
        # Emitting i
        movl -12(%ebp), %esi
        # Emitting 1
        movl $1, %edi
      addl %edi, %esi
    movl %esi, -12(%ebp)
  # Exit to block 2
  jmp label195
label201:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Vector.print_______________________________________________
  .globl Vector_print
Vector_print:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label202
# __Basic block 0_____________________________________________________
label202:
    # Emitting this.print2(...)
      # Emitting this.print2(...)
      sub $12, %esp
        # Emitting this
        movl 8(%ebp), %edi
      push %edi
        # Emitting this.compactOK(...)
          # Emitting this
          movl 8(%ebp), %edi
        push %edi
        # Load "this" pointer
        movl 0(%esp), %edi
        sub $12, %esp
        push %edi
        call Javali$CheckNull
        add $16, %esp
        movl 0(%edi), %edi
        movl 24(%edi), %edi
        call *%edi
        add $4, %esp
        movl %eax, %edi
      push %edi
      # Load "this" pointer
      movl 4(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 12(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
  # Exit to block 1
  jmp label203
# __Basic block 1_____________________________________________________
label203:
  # Return
  jmp label204
label204:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Vector.print2______________________________________________
  .globl Vector_print2
Vector_print2:
  # Variable     Offset
  # nc           -12
  # i            -16
  # implicit=8 localSlot=20 sum=28
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  jmp label205
# __Basic block 0_____________________________________________________
label205:
    # Emitting nc = !(compact)
      # Emitting !(compact)
        # Emitting compact
        movl 8(%ebp), %edi
      negl %edi
      incl %edi
    movl %edi, -12(%ebp)
    # Emitting i = 0
      # Emitting 0
      movl $0, %edi
    movl %edi, -16(%ebp)
  # Exit to block 2
  jmp label207
# __Basic block 1_____________________________________________________
label206:
  # Return
  jmp label213
# __Basic block 2_____________________________________________________
label207:
  # Exit to block 3 if true, block 4 if false
    # Emitting (i < this.n)
      # Emitting i
      movl -16(%ebp), %edi
      # Emitting this.n
        # Emitting this
        movl 12(%ebp), %esi
      push %esi
      call Javali$CheckNull
      add $4, %esp
      movl 8(%esi), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label209
  jmp label208
# __Basic block 3_____________________________________________________
label208:
    # Emitting write(this.v[i])
      # Emitting this.v[i]
        # Emitting this.v
          # Emitting this
          movl 12(%ebp), %edi
        push %edi
        call Javali$CheckNull
        add $4, %esp
        movl 4(%edi), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
        # Emitting i
        movl -16(%ebp), %esi
      sub $12, %esp
      push %esi
      push %edi
      call Javali$CheckArrayBounds
      add $20, %esp
      movl 8(%edi,%esi,4), %esi
    push %esi
    call Javali$PrintInteger
    add $4, %esp
  # Exit to block 5 if true, block 6 if false
    # Emitting nc
    movl -12(%ebp), %esi
  cmpl $0, %esi
  je label211
  jmp label210
# __Basic block 4_____________________________________________________
label209:
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
  # Exit to block 1
  jmp label206
# __Basic block 5_____________________________________________________
label210:
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
  # Exit to block 7
  jmp label212
# __Basic block 6_____________________________________________________
label211:
    # Emitting nop
  # Exit to block 7
  jmp label212
# __Basic block 7_____________________________________________________
label212:
    # Emitting i = (i + 1)
      # Emitting (i + 1)
        # Emitting i
        movl -16(%ebp), %esi
        # Emitting 1
        movl $1, %edi
      addl %edi, %esi
    movl %esi, -16(%ebp)
  # Exit to block 2
  jmp label207
label213:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Vector.set_________________________________________________
  .globl Vector_set
Vector_set:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label214
# __Basic block 0_____________________________________________________
label214:
    # Emitting this.v[i] = value
      # Emitting value
      movl 8(%ebp), %edi
      # Emitting this.v
        # Emitting this
        movl 16(%ebp), %esi
      push %esi
      call Javali$CheckNull
      add $4, %esp
      movl 4(%esi), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
      # Emitting i
      movl 12(%ebp), %edx
    push %edx
    sub $8, %esp
    push %edx
    push %esi
    call Javali$CheckArrayBounds
    add $16, %esp
    pop %edx
    movl %edi, 8(%esi,%edx,4)
  # Exit to block 1
  jmp label215
# __Basic block 1_____________________________________________________
label215:
  # Return
  jmp label216
label216:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Vector.get_________________________________________________
  .globl Vector_get
Vector_get:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label217
# __Basic block 0_____________________________________________________
label217:
    # Emitting return this.v[i]
      # Emitting this.v[i]
        # Emitting this.v
          # Emitting this
          movl 12(%ebp), %edi
        push %edi
        call Javali$CheckNull
        add $4, %esp
        movl 4(%edi), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
        # Emitting i
        movl 8(%ebp), %esi
      sub $12, %esp
      push %esi
      push %edi
      call Javali$CheckArrayBounds
      add $20, %esp
      movl 8(%edi,%esi,4), %esi
    movl %esi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label218
# __Basic block 1_____________________________________________________
label218:
  # Return
  jmp label219
label219:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
