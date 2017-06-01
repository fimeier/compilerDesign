vtable_A:
.int vtable_Object
vtable_B:
.int vtable_A
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
# Class B_____________________________________________________________
  # 
# Class Main__________________________________________________________
  # 
  .section .text
# __Method Main.main__________________________________________________
  .globl Main_main
Main_main:
  # Variable     Offset
  # bools        -12
  # a            -16
  # b            -20
  # i            -24
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
    # Emitting a = new A[][1]
      # Emitting new A[][1]
        # Emitting 1
        movl $1, %edi
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
      movl $vtablearr_A, 0(%edi)
      movl %esi, 4(%edi)
    movl %edi, -16(%ebp)
    # Emitting b = new B[][1]
      # Emitting new B[][1]
        # Emitting 1
        movl $1, %edi
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
      movl $vtablearr_B, 0(%edi)
      movl %esi, 4(%edi)
    movl %edi, -20(%ebp)
    # Emitting i = new int[][2]
      # Emitting new int[][2]
        # Emitting 2
        movl $2, %edi
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
    movl %edi, -24(%ebp)
    # Emitting bools = new boolean[][2]
      # Emitting new boolean[][2]
        # Emitting 2
        movl $2, %edi
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
      movl $vtablearr_boolean, 0(%edi)
      movl %esi, 4(%edi)
    movl %edi, -12(%ebp)
    # Emitting b[0] = new B()
      # Emitting new B()
      push $4
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_B, 0(%edi)
      # Emitting b
      movl -20(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
      # Emitting 0
      movl $0, %edx
    push %edx
    sub $8, %esp
    push %edx
    push %esi
    call Javali$CheckArrayBounds
    add $16, %esp
    pop %edx
    movl %edi, 8(%esi,%edx,4)
    # Emitting a[0] = b[0]
      # Emitting b[0]
        # Emitting b
        movl -20(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
        # Emitting 0
        movl $0, %edx
      push %edx
      sub $8, %esp
      push %edx
      push %edi
      call Javali$CheckArrayBounds
      add $16, %esp
      pop %edx
      movl 8(%edi,%edx,4), %edx
      # Emitting a
      movl -16(%ebp), %edi
    push %edx
    sub $12, %esp
    push %edi
    call Javali$CheckNull
    add $16, %esp
    pop %edx
      # Emitting 0
      movl $0, %esi
    push %edx
    sub $8, %esp
    push %esi
    push %edi
    call Javali$CheckArrayBounds
    add $16, %esp
    pop %edx
    movl %edx, 8(%edi,%esi,4)
    # Emitting i[0] = 1
      # Emitting 1
      movl $1, %edx
      # Emitting i
      movl -24(%ebp), %esi
    push %edx
    sub $12, %esp
    push %esi
    call Javali$CheckNull
    add $16, %esp
    pop %edx
      # Emitting 0
      movl $0, %edi
    push %edx
    sub $8, %esp
    push %edi
    push %esi
    call Javali$CheckArrayBounds
    add $16, %esp
    pop %edx
    movl %edx, 8(%esi,%edi,4)
    # Emitting i[1] = (i[0] + 1)
      # Emitting (i[0] + 1)
        # Emitting i[0]
          # Emitting i
          movl -24(%ebp), %edx
        push %edx
        sub $12, %esp
        push %edx
        call Javali$CheckNull
        add $16, %esp
        pop %edx
          # Emitting 0
          movl $0, %edi
        push %edx
        sub $8, %esp
        push %edi
        push %edx
        call Javali$CheckArrayBounds
        add $16, %esp
        pop %edx
        movl 8(%edx,%edi,4), %edi
        # Emitting 1
        movl $1, %edx
      addl %edx, %edi
      # Emitting i
      movl -24(%ebp), %edx
    push %edx
    sub $12, %esp
    push %edx
    call Javali$CheckNull
    add $16, %esp
    pop %edx
      # Emitting 1
      movl $1, %esi
    push %edx
    sub $8, %esp
    push %esi
    push %edx
    call Javali$CheckArrayBounds
    add $16, %esp
    pop %edx
    movl %edi, 8(%edx,%esi,4)
    # Emitting bools[0] = true
      # Emitting true
      movl $1, %edi
      # Emitting bools
      movl -12(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
      # Emitting 0
      movl $0, %edx
    push %edx
    sub $8, %esp
    push %edx
    push %esi
    call Javali$CheckArrayBounds
    add $16, %esp
    pop %edx
    movl %edi, 8(%esi,%edx,4)
    # Emitting bools[1] = (bools[0] && false)
      # Emitting (bools[0] && false)
        # Emitting bools[0]
          # Emitting bools
          movl -12(%ebp), %edi
        push %edi
        call Javali$CheckNull
        add $4, %esp
          # Emitting 0
          movl $0, %edx
        push %edx
        sub $8, %esp
        push %edx
        push %edi
        call Javali$CheckArrayBounds
        add $16, %esp
        pop %edx
        movl 8(%edi,%edx,4), %edx
        # Emitting false
        movl $0, %edi
      andl %edi, %edx
      # Emitting bools
      movl -12(%ebp), %edi
    push %edx
    sub $12, %esp
    push %edi
    call Javali$CheckNull
    add $16, %esp
    pop %edx
      # Emitting 1
      movl $1, %esi
    push %edx
    sub $8, %esp
    push %esi
    push %edi
    call Javali$CheckArrayBounds
    add $16, %esp
    pop %edx
    movl %edx, 8(%edi,%esi,4)
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
