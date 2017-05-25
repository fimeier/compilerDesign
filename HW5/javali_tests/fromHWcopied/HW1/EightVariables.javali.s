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
  # i0           -20
  # i1           -24
  # i2           -28
  # i3           -32
  # i4           -36
  # i5           -40
  # i6           -44
  # i7           -48
  # r1           -52
  # implicit=8 localSlot=56 sum=64
  enter $56, $0
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
  movl $0, -40(%ebp)
  movl $0, -44(%ebp)
  movl $0, -48(%ebp)
  movl $0, -52(%ebp)
  jmp label7
# __Basic block 0_____________________________________________________
label7:
    # Emitting i0 = 0
      # Emitting 0
      movl $0, %edi
    movl %edi, -20(%ebp)
    # Emitting i1 = 1
      # Emitting 1
      movl $1, %edi
    movl %edi, -24(%ebp)
    # Emitting i2 = 2
      # Emitting 2
      movl $2, %edi
    movl %edi, -28(%ebp)
    # Emitting i3 = 3
      # Emitting 3
      movl $3, %edi
    movl %edi, -32(%ebp)
    # Emitting i4 = 4
      # Emitting 4
      movl $4, %edi
    movl %edi, -36(%ebp)
    # Emitting i5 = 5
      # Emitting 5
      movl $5, %edi
    movl %edi, -40(%ebp)
    # Emitting i6 = 6
      # Emitting 6
      movl $6, %edi
    movl %edi, -44(%ebp)
    # Emitting i7 = 7
      # Emitting 7
      movl $7, %edi
    movl %edi, -48(%ebp)
    # Emitting r1 = (i0 + (i1 + (i2 + (i3 + (i4 + (i5 + (i6 + i7)))))))
      # Emitting (i0 + (i1 + (i2 + (i3 + (i4 + (i5 + (i6 + i7)))))))
        # Emitting i0
        movl -20(%ebp), %edi
        # Emitting (i1 + (i2 + (i3 + (i4 + (i5 + (i6 + i7))))))
          # Emitting i1
          movl -24(%ebp), %esi
          # Emitting (i2 + (i3 + (i4 + (i5 + (i6 + i7)))))
            # Emitting i2
            movl -28(%ebp), %edx
            # Emitting (i3 + (i4 + (i5 + (i6 + i7))))
              # Emitting i3
              movl -32(%ebp), %ecx
              # Emitting (i4 + (i5 + (i6 + i7)))
                # Emitting i4
                movl -36(%ebp), %ebx
              push %ebx
                # Emitting (i5 + (i6 + i7))
                  # Emitting i5
                  movl -40(%ebp), %ebx
                push %ebx
                  # Emitting (i6 + i7)
                    # Emitting i6
                    movl -44(%ebp), %ebx
                    # Emitting i7
                    movl -48(%ebp), %eax
                  addl %eax, %ebx
                pop %eax
                addl %ebx, %eax
              pop %ebx
              addl %eax, %ebx
            addl %ebx, %ecx
          addl %ecx, %edx
        addl %edx, %esi
      addl %esi, %edi
    movl %edi, -52(%ebp)
    # Emitting r2 = (((((((i0 + i1) + i2) + i3) + i4) + i5) + i6) + i7)
      # Emitting (((((((i0 + i1) + i2) + i3) + i4) + i5) + i6) + i7)
        # Emitting ((((((i0 + i1) + i2) + i3) + i4) + i5) + i6)
          # Emitting (((((i0 + i1) + i2) + i3) + i4) + i5)
            # Emitting ((((i0 + i1) + i2) + i3) + i4)
              # Emitting (((i0 + i1) + i2) + i3)
                # Emitting ((i0 + i1) + i2)
                  # Emitting (i0 + i1)
                    # Emitting i0
                    movl -20(%ebp), %edi
                    # Emitting i1
                    movl -24(%ebp), %esi
                  addl %esi, %edi
                  # Emitting i2
                  movl -28(%ebp), %esi
                addl %esi, %edi
                # Emitting i3
                movl -32(%ebp), %esi
              addl %esi, %edi
              # Emitting i4
              movl -36(%ebp), %esi
            addl %esi, %edi
            # Emitting i5
            movl -40(%ebp), %esi
          addl %esi, %edi
          # Emitting i6
          movl -44(%ebp), %esi
        addl %esi, %edi
        # Emitting i7
        movl -48(%ebp), %esi
      addl %esi, %edi
    movl %edi, -12(%ebp)
    # Emitting r3 = (((i0 + i1) + (i2 + i3)) + ((i4 + i5) + (i6 + i7)))
      # Emitting (((i0 + i1) + (i2 + i3)) + ((i4 + i5) + (i6 + i7)))
        # Emitting ((i0 + i1) + (i2 + i3))
          # Emitting (i0 + i1)
            # Emitting i0
            movl -20(%ebp), %edi
            # Emitting i1
            movl -24(%ebp), %esi
          addl %esi, %edi
          # Emitting (i2 + i3)
            # Emitting i2
            movl -28(%ebp), %esi
            # Emitting i3
            movl -32(%ebp), %edx
          addl %edx, %esi
        addl %esi, %edi
        # Emitting ((i4 + i5) + (i6 + i7))
          # Emitting (i4 + i5)
            # Emitting i4
            movl -36(%ebp), %esi
            # Emitting i5
            movl -40(%ebp), %edx
          addl %edx, %esi
          # Emitting (i6 + i7)
            # Emitting i6
            movl -44(%ebp), %edx
            # Emitting i7
            movl -48(%ebp), %ecx
          addl %ecx, %edx
        addl %edx, %esi
      addl %esi, %edi
    movl %edi, -16(%ebp)
    # Emitting write(r1)
      # Emitting r1
      movl -52(%ebp), %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
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
    # Emitting write(r3)
      # Emitting r3
      movl -16(%ebp), %edi
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
