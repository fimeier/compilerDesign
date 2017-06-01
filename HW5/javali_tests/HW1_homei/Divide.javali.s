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
    # Emitting a = 8
      # Emitting 8
      movl $8, %edi
    movl %edi, -12(%ebp)
    # Emitting b = 2
      # Emitting 2
      movl $2, %edi
    movl %edi, -16(%ebp)
    # Emitting c = 9
      # Emitting 9
      movl $9, %edi
    movl %edi, -20(%ebp)
    # Emitting write(((a / b) / c))
      # Emitting ((a / b) / c)
        # Emitting (a / b)
          # Emitting a
          movl -12(%ebp), %edi
          # Emitting b
          movl -16(%ebp), %esi
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
        # Emitting c
        movl -20(%ebp), %esi
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
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
    # Emitting write((c / b))
      # Emitting (c / b)
        # Emitting c
        movl -20(%ebp), %edi
        # Emitting b
        movl -16(%ebp), %esi
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
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
    # Emitting b = (a * c)
      # Emitting (a * c)
        # Emitting a
        movl -12(%ebp), %edi
        # Emitting c
        movl -20(%ebp), %esi
      imull %esi, %edi
    movl %edi, -16(%ebp)
    # Emitting write(((a + b) + c))
      # Emitting ((a + b) + c)
        # Emitting (a + b)
          # Emitting a
          movl -12(%ebp), %edi
          # Emitting b
          movl -16(%ebp), %esi
        addl %esi, %edi
        # Emitting c
        movl -20(%ebp), %esi
      addl %esi, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
    # Emitting write(b)
      # Emitting b
      movl -16(%ebp), %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
    # Emitting write((((6 * 7) / (4 * 3)) - ((3 + 2) + (6 + 3))))
      # Emitting (((6 * 7) / (4 * 3)) - ((3 + 2) + (6 + 3)))
        # Emitting ((6 * 7) / (4 * 3))
          # Emitting (6 * 7)
            # Emitting 6
            movl $6, %edi
            # Emitting 7
            movl $7, %esi
          imull %esi, %edi
          # Emitting (4 * 3)
            # Emitting 4
            movl $4, %esi
            # Emitting 3
            movl $3, %edx
          imull %edx, %esi
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
        # Emitting ((3 + 2) + (6 + 3))
          # Emitting (3 + 2)
            # Emitting 3
            movl $3, %esi
            # Emitting 2
            movl $2, %edx
          addl %edx, %esi
          # Emitting (6 + 3)
            # Emitting 6
            movl $6, %edx
            # Emitting 3
            movl $3, %ecx
          addl %ecx, %edx
        addl %edx, %esi
      subl %esi, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
    # Emitting write((((((6 * 54) / (5 * 3)) / ((18 / 18) / (34 / 34))) / (((2 * 12) / (3 * 2)) / ((15 / 2) / (10 / 2)))) / ((((6 * 54) / (5 * 3)) / ((18 / 18) / (34 / 34))) / (((2 * 12) / (3 * 2)) / ((15 / 2) / (10 / 2))))))
      # Emitting (((((6 * 54) / (5 * 3)) / ((18 / 18) / (34 / 34))) / (((2 * 12) / (3 * 2)) / ((15 / 2) / (10 / 2)))) / ((((6 * 54) / (5 * 3)) / ((18 / 18) / (34 / 34))) / (((2 * 12) / (3 * 2)) / ((15 / 2) / (10 / 2)))))
        # Emitting ((((6 * 54) / (5 * 3)) / ((18 / 18) / (34 / 34))) / (((2 * 12) / (3 * 2)) / ((15 / 2) / (10 / 2))))
          # Emitting (((6 * 54) / (5 * 3)) / ((18 / 18) / (34 / 34)))
            # Emitting ((6 * 54) / (5 * 3))
              # Emitting (6 * 54)
                # Emitting 6
                movl $6, %edi
                # Emitting 54
                movl $54, %esi
              imull %esi, %edi
              # Emitting (5 * 3)
                # Emitting 5
                movl $5, %esi
                # Emitting 3
                movl $3, %edx
              imull %edx, %esi
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
            # Emitting ((18 / 18) / (34 / 34))
              # Emitting (18 / 18)
                # Emitting 18
                movl $18, %esi
                # Emitting 18
                movl $18, %edx
              push %edx
              sub $12, %esp
              push %edx
              call Javali$CheckNonZero
              add $16, %esp
              pop %edx
              pushl %edx
              pushl %esi
              popl %eax
              popl %ebx
              cltd
              idivl %ebx
              movl %eax, %esi
              # Emitting (34 / 34)
                # Emitting 34
                movl $34, %edx
                # Emitting 34
                movl $34, %ecx
              push %ecx
              push %edx
              sub $8, %esp
              push %ecx
              call Javali$CheckNonZero
              add $12, %esp
              pop %edx
              pop %ecx
              pushl %ecx
              pushl %edx
              popl %eax
              popl %ebx
              cltd
              idivl %ebx
              movl %eax, %edx
            push %edx
            sub $12, %esp
            push %edx
            call Javali$CheckNonZero
            add $16, %esp
            pop %edx
            pushl %edx
            pushl %esi
            popl %eax
            popl %ebx
            cltd
            idivl %ebx
            movl %eax, %esi
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
          # Emitting (((2 * 12) / (3 * 2)) / ((15 / 2) / (10 / 2)))
            # Emitting ((2 * 12) / (3 * 2))
              # Emitting (2 * 12)
                # Emitting 2
                movl $2, %esi
                # Emitting 12
                movl $12, %edx
              imull %edx, %esi
              # Emitting (3 * 2)
                # Emitting 3
                movl $3, %edx
                # Emitting 2
                movl $2, %ecx
              imull %ecx, %edx
            push %edx
            sub $12, %esp
            push %edx
            call Javali$CheckNonZero
            add $16, %esp
            pop %edx
            pushl %edx
            pushl %esi
            popl %eax
            popl %ebx
            cltd
            idivl %ebx
            movl %eax, %esi
            # Emitting ((15 / 2) / (10 / 2))
              # Emitting (15 / 2)
                # Emitting 15
                movl $15, %edx
                # Emitting 2
                movl $2, %ecx
              push %ecx
              push %edx
              sub $8, %esp
              push %ecx
              call Javali$CheckNonZero
              add $12, %esp
              pop %edx
              pop %ecx
              pushl %ecx
              pushl %edx
              popl %eax
              popl %ebx
              cltd
              idivl %ebx
              movl %eax, %edx
              # Emitting (10 / 2)
                # Emitting 10
                movl $10, %ecx
                # Emitting 2
                movl $2, %ebx
              push %ecx
              push %edx
              sub $8, %esp
              push %ebx
              call Javali$CheckNonZero
              add $12, %esp
              pop %edx
              pop %ecx
              pushl %edx
              pushl %ebx
              pushl %ecx
              popl %eax
              popl %ebx
              cltd
              idivl %ebx
              movl %eax, %ecx
              popl %edx
            push %ecx
            push %edx
            sub $8, %esp
            push %ecx
            call Javali$CheckNonZero
            add $12, %esp
            pop %edx
            pop %ecx
            pushl %ecx
            pushl %edx
            popl %eax
            popl %ebx
            cltd
            idivl %ebx
            movl %eax, %edx
          push %edx
          sub $12, %esp
          push %edx
          call Javali$CheckNonZero
          add $16, %esp
          pop %edx
          pushl %edx
          pushl %esi
          popl %eax
          popl %ebx
          cltd
          idivl %ebx
          movl %eax, %esi
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
        # Emitting ((((6 * 54) / (5 * 3)) / ((18 / 18) / (34 / 34))) / (((2 * 12) / (3 * 2)) / ((15 / 2) / (10 / 2))))
          # Emitting (((6 * 54) / (5 * 3)) / ((18 / 18) / (34 / 34)))
            # Emitting ((6 * 54) / (5 * 3))
              # Emitting (6 * 54)
                # Emitting 6
                movl $6, %esi
                # Emitting 54
                movl $54, %edx
              imull %edx, %esi
              # Emitting (5 * 3)
                # Emitting 5
                movl $5, %edx
                # Emitting 3
                movl $3, %ecx
              imull %ecx, %edx
            push %edx
            sub $12, %esp
            push %edx
            call Javali$CheckNonZero
            add $16, %esp
            pop %edx
            pushl %edx
            pushl %esi
            popl %eax
            popl %ebx
            cltd
            idivl %ebx
            movl %eax, %esi
            # Emitting ((18 / 18) / (34 / 34))
              # Emitting (18 / 18)
                # Emitting 18
                movl $18, %edx
                # Emitting 18
                movl $18, %ecx
              push %ecx
              push %edx
              sub $8, %esp
              push %ecx
              call Javali$CheckNonZero
              add $12, %esp
              pop %edx
              pop %ecx
              pushl %ecx
              pushl %edx
              popl %eax
              popl %ebx
              cltd
              idivl %ebx
              movl %eax, %edx
              # Emitting (34 / 34)
                # Emitting 34
                movl $34, %ecx
                # Emitting 34
                movl $34, %ebx
              push %ecx
              push %edx
              sub $8, %esp
              push %ebx
              call Javali$CheckNonZero
              add $12, %esp
              pop %edx
              pop %ecx
              pushl %edx
              pushl %ebx
              pushl %ecx
              popl %eax
              popl %ebx
              cltd
              idivl %ebx
              movl %eax, %ecx
              popl %edx
            push %ecx
            push %edx
            sub $8, %esp
            push %ecx
            call Javali$CheckNonZero
            add $12, %esp
            pop %edx
            pop %ecx
            pushl %ecx
            pushl %edx
            popl %eax
            popl %ebx
            cltd
            idivl %ebx
            movl %eax, %edx
          push %edx
          sub $12, %esp
          push %edx
          call Javali$CheckNonZero
          add $16, %esp
          pop %edx
          pushl %edx
          pushl %esi
          popl %eax
          popl %ebx
          cltd
          idivl %ebx
          movl %eax, %esi
          # Emitting (((2 * 12) / (3 * 2)) / ((15 / 2) / (10 / 2)))
            # Emitting ((2 * 12) / (3 * 2))
              # Emitting (2 * 12)
                # Emitting 2
                movl $2, %edx
                # Emitting 12
                movl $12, %ecx
              imull %ecx, %edx
              # Emitting (3 * 2)
                # Emitting 3
                movl $3, %ecx
                # Emitting 2
                movl $2, %ebx
              imull %ebx, %ecx
            push %ecx
            push %edx
            sub $8, %esp
            push %ecx
            call Javali$CheckNonZero
            add $12, %esp
            pop %edx
            pop %ecx
            pushl %ecx
            pushl %edx
            popl %eax
            popl %ebx
            cltd
            idivl %ebx
            movl %eax, %edx
            # Emitting ((15 / 2) / (10 / 2))
              # Emitting (15 / 2)
                # Emitting 15
                movl $15, %ecx
                # Emitting 2
                movl $2, %ebx
              push %ecx
              push %edx
              sub $8, %esp
              push %ebx
              call Javali$CheckNonZero
              add $12, %esp
              pop %edx
              pop %ecx
              pushl %edx
              pushl %ebx
              pushl %ecx
              popl %eax
              popl %ebx
              cltd
              idivl %ebx
              movl %eax, %ecx
              popl %edx
              # Emitting (10 / 2)
                # Emitting 10
                movl $10, %ebx
                # Emitting 2
                movl $2, %eax
              push %eax
              push %ecx
              push %edx
              sub $4, %esp
              push %eax
              call Javali$CheckNonZero
              add $8, %esp
              pop %edx
              pop %ecx
              pop %eax
              pushl %edx
              pushl %eax
              pushl %ebx
              popl %eax
              popl %ebx
              cltd
              idivl %ebx
              movl %eax, %ebx
              popl %edx
            push %ecx
            push %edx
            sub $8, %esp
            push %ebx
            call Javali$CheckNonZero
            add $12, %esp
            pop %edx
            pop %ecx
            pushl %edx
            pushl %ebx
            pushl %ecx
            popl %eax
            popl %ebx
            cltd
            idivl %ebx
            movl %eax, %ecx
            popl %edx
          push %ecx
          push %edx
          sub $8, %esp
          push %ecx
          call Javali$CheckNonZero
          add $12, %esp
          pop %edx
          pop %ecx
          pushl %ecx
          pushl %edx
          popl %eax
          popl %ebx
          cltd
          idivl %ebx
          movl %eax, %edx
        push %edx
        sub $12, %esp
        push %edx
        call Javali$CheckNonZero
        add $16, %esp
        pop %edx
        pushl %edx
        pushl %esi
        popl %eax
        popl %ebx
        cltd
        idivl %ebx
        movl %eax, %esi
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
