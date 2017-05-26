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
  # v1           -16
  # v2           -20
  # v3           -24
  # v4           -28
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
  jmp label7
# __Basic block 0_____________________________________________________
label7:
    # Emitting a = new int[][3]
      # Emitting new int[][3]
        # Emitting 3
        movl $3, %edi
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
    movl %edi, -12(%ebp)
    # Emitting a[0] = 0
      # Emitting 0
      movl $0, %edi
      # Emitting a
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
    # Emitting a[1] = 2
      # Emitting 2
      movl $2, %edi
      # Emitting a
      movl -12(%ebp), %edx
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
    # Emitting a[4] = 2
      # Emitting 2
      movl $2, %edi
      # Emitting a
      movl -12(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
      # Emitting 4
      movl $4, %edx
    push %edx
    sub $8, %esp
    push %edx
    push %esi
    call Javali$CheckArrayBounds
    add $16, %esp
    pop %edx
    movl %edi, 8(%esi,%edx,4)
  # Exit to block 2 if true, block 3 if false
    # Emitting (a[1] == a[2])
      # Emitting a[1]
        # Emitting a
        movl -12(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
        # Emitting 1
        movl $1, %edx
      push %edx
      sub $8, %esp
      push %edx
      push %edi
      call Javali$CheckArrayBounds
      add $16, %esp
      pop %edx
      movl 8(%edi,%edx,4), %edx
      # Emitting a[2]
        # Emitting a
        movl -12(%ebp), %edi
      push %edx
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      pop %edx
        # Emitting 2
        movl $2, %esi
      push %edx
      sub $8, %esp
      push %esi
      push %edi
      call Javali$CheckArrayBounds
      add $16, %esp
      pop %edx
      movl 8(%edi,%esi,4), %esi
    cmpl %esi, %edx
    movl $0, %edx
    sete %dl
  cmpl $0, %edx
  je label10
  jmp label9
# __Basic block 1_____________________________________________________
label8:
  # Return
  jmp label12
# __Basic block 2_____________________________________________________
label9:
    # Emitting write(1)
      # Emitting 1
      movl $1, %edx
    push %edx
    sub $12, %esp
    push %edx
    call Javali$PrintInteger
    add $16, %esp
    pop %edx
  # Exit to block 4
  jmp label11
# __Basic block 3_____________________________________________________
label10:
    # Emitting write(0)
      # Emitting 0
      movl $0, %edx
    push %edx
    sub $12, %esp
    push %edx
    call Javali$PrintInteger
    add $16, %esp
    pop %edx
  # Exit to block 4
  jmp label11
# __Basic block 4_____________________________________________________
label11:
  # Exit to block 1
  jmp label8
label12:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
