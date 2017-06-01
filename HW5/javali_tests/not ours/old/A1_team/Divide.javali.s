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
  # r2           -12
  # r3           -16
  # r1           -20
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
    # Emitting r1 = 8
      # Emitting 8
      movl $8, %edi
    movl %edi, -20(%ebp)
    # Emitting r2 = 2
      # Emitting 2
      movl $2, %edi
    movl %edi, -12(%ebp)
    # Emitting r3 = 9
      # Emitting 9
      movl $9, %edi
    movl %edi, -16(%ebp)
    # Emitting write(((r1 / r2) / r2))
      # Emitting ((r1 / r2) / r2)
        # Emitting (r1 / r2)
          # Emitting r1
          movl -20(%ebp), %edi
          # Emitting r2
          movl -12(%ebp), %esi
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
        # Emitting r2
        movl -12(%ebp), %esi
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
    # Emitting write((r3 / r2))
      # Emitting (r3 / r2)
        # Emitting r3
        movl -16(%ebp), %edi
        # Emitting r2
        movl -12(%ebp), %esi
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
    # Emitting r2 = (r1 * r3)
      # Emitting (r1 * r3)
        # Emitting r1
        movl -20(%ebp), %edi
        # Emitting r3
        movl -16(%ebp), %esi
      imull %esi, %edi
    movl %edi, -12(%ebp)
    # Emitting write(r2)
      # Emitting r2
      movl -12(%ebp), %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
    # Emitting write((((3 * 4) / (2 * 3)) - ((4 + 7) + (9 + 13))))
      # Emitting (((3 * 4) / (2 * 3)) - ((4 + 7) + (9 + 13)))
        # Emitting ((3 * 4) / (2 * 3))
          # Emitting (3 * 4)
            # Emitting 3
            movl $3, %edi
            # Emitting 4
            movl $4, %esi
          imull %esi, %edi
          # Emitting (2 * 3)
            # Emitting 2
            movl $2, %esi
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
        # Emitting ((4 + 7) + (9 + 13))
          # Emitting (4 + 7)
            # Emitting 4
            movl $4, %esi
            # Emitting 7
            movl $7, %edx
          addl %edx, %esi
          # Emitting (9 + 13)
            # Emitting 9
            movl $9, %edx
            # Emitting 13
            movl $13, %ecx
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
    # Emitting write((((((3 * 4) / (2 * 3)) / ((18 / 4) / (13 / 9))) / (((17 * 12) / (2 * 3)) / ((18 / 4) / (13 / 9)))) / ((((700 * 4) / (2 * 3)) / ((18 / 4) / (13 / 9))) / (((17 * 12) / (2 * 3)) / ((18 / 4) / (13 / 9))))))
      # Emitting (((((3 * 4) / (2 * 3)) / ((18 / 4) / (13 / 9))) / (((17 * 12) / (2 * 3)) / ((18 / 4) / (13 / 9)))) / ((((700 * 4) / (2 * 3)) / ((18 / 4) / (13 / 9))) / (((17 * 12) / (2 * 3)) / ((18 / 4) / (13 / 9)))))
        # Emitting ((((3 * 4) / (2 * 3)) / ((18 / 4) / (13 / 9))) / (((17 * 12) / (2 * 3)) / ((18 / 4) / (13 / 9))))
          # Emitting (((3 * 4) / (2 * 3)) / ((18 / 4) / (13 / 9)))
            # Emitting ((3 * 4) / (2 * 3))
              # Emitting (3 * 4)
                # Emitting 3
                movl $3, %edi
                # Emitting 4
                movl $4, %esi
              imull %esi, %edi
              # Emitting (2 * 3)
                # Emitting 2
                movl $2, %esi
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
            # Emitting ((18 / 4) / (13 / 9))
              # Emitting (18 / 4)
                # Emitting 18
                movl $18, %esi
                # Emitting 4
                movl $4, %edx
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
              # Emitting (13 / 9)
                # Emitting 13
                movl $13, %edx
                # Emitting 9
                movl $9, %ecx
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
          # Emitting (((17 * 12) / (2 * 3)) / ((18 / 4) / (13 / 9)))
            # Emitting ((17 * 12) / (2 * 3))
              # Emitting (17 * 12)
                # Emitting 17
                movl $17, %esi
                # Emitting 12
                movl $12, %edx
              imull %edx, %esi
              # Emitting (2 * 3)
                # Emitting 2
                movl $2, %edx
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
            # Emitting ((18 / 4) / (13 / 9))
              # Emitting (18 / 4)
                # Emitting 18
                movl $18, %edx
                # Emitting 4
                movl $4, %ecx
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
              # Emitting (13 / 9)
                # Emitting 13
                movl $13, %ecx
                # Emitting 9
                movl $9, %ebx
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
        # Emitting ((((700 * 4) / (2 * 3)) / ((18 / 4) / (13 / 9))) / (((17 * 12) / (2 * 3)) / ((18 / 4) / (13 / 9))))
          # Emitting (((700 * 4) / (2 * 3)) / ((18 / 4) / (13 / 9)))
            # Emitting ((700 * 4) / (2 * 3))
              # Emitting (700 * 4)
                # Emitting 700
                movl $700, %esi
                # Emitting 4
                movl $4, %edx
              imull %edx, %esi
              # Emitting (2 * 3)
                # Emitting 2
                movl $2, %edx
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
            # Emitting ((18 / 4) / (13 / 9))
              # Emitting (18 / 4)
                # Emitting 18
                movl $18, %edx
                # Emitting 4
                movl $4, %ecx
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
              # Emitting (13 / 9)
                # Emitting 13
                movl $13, %ecx
                # Emitting 9
                movl $9, %ebx
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
          # Emitting (((17 * 12) / (2 * 3)) / ((18 / 4) / (13 / 9)))
            # Emitting ((17 * 12) / (2 * 3))
              # Emitting (17 * 12)
                # Emitting 17
                movl $17, %edx
                # Emitting 12
                movl $12, %ecx
              imull %ecx, %edx
              # Emitting (2 * 3)
                # Emitting 2
                movl $2, %ecx
                # Emitting 3
                movl $3, %ebx
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
            # Emitting ((18 / 4) / (13 / 9))
              # Emitting (18 / 4)
                # Emitting 18
                movl $18, %ecx
                # Emitting 4
                movl $4, %ebx
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
              # Emitting (13 / 9)
                # Emitting 13
                movl $13, %ebx
                # Emitting 9
                movl $9, %eax
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
