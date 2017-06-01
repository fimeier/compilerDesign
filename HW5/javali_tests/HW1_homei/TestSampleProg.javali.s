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
  jmp label7
# __Basic block 0_____________________________________________________
label7:
    # Emitting a = 100
      # Emitting 100
      movl $100, %edi
    movl %edi, -12(%ebp)
    # Emitting write(a)
      # Emitting a
      movl -12(%ebp), %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
    # Emitting b = read()
      # Emitting read()
      sub $4, %esp
      call Javali$ReadInteger
      add $4, %esp
      movl %eax, %edi
    movl %edi, -16(%ebp)
    # Emitting c = 0
      # Emitting 0
      movl $0, %edi
    movl %edi, -20(%ebp)
    # Emitting c = (c + ((a / b) * -(-(64))))
      # Emitting (c + ((a / b) * -(-(64))))
        # Emitting c
        movl -20(%ebp), %edi
        # Emitting ((a / b) * -(-(64)))
          # Emitting (a / b)
            # Emitting a
            movl -12(%ebp), %esi
            # Emitting b
            movl -16(%ebp), %edx
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
          # Emitting -(-(64))
            # Emitting -(64)
              # Emitting 64
              movl $64, %edx
            negl %edx
          negl %edx
        imull %edx, %esi
      addl %esi, %edi
    movl %edi, -20(%ebp)
    # Emitting write(c)
      # Emitting c
      movl -20(%ebp), %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
    # Emitting c = 0
      # Emitting 0
      movl $0, %edi
    movl %edi, -20(%ebp)
    # Emitting write((c + ((a / b) * -(-(64)))))
      # Emitting (c + ((a / b) * -(-(64))))
        # Emitting c
        movl -20(%ebp), %edi
        # Emitting ((a / b) * -(-(64)))
          # Emitting (a / b)
            # Emitting a
            movl -12(%ebp), %esi
            # Emitting b
            movl -16(%ebp), %edx
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
          # Emitting -(-(64))
            # Emitting -(64)
              # Emitting 64
              movl $64, %edx
            negl %edx
          negl %edx
        imull %edx, %esi
      addl %esi, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
    # Emitting d = -(1000000000)
      # Emitting -(1000000000)
        # Emitting 1000000000
        movl $1000000000, %edi
      negl %edi
    movl %edi, -24(%ebp)
    # Emitting write((d / -(3)))
      # Emitting (d / -(3))
        # Emitting d
        movl -24(%ebp), %edi
        # Emitting -(3)
          # Emitting 3
          movl $3, %esi
        negl %esi
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
