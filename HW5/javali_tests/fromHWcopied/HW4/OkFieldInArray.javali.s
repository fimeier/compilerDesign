vtable_A:
.int vtable_Object
.int A_foo
vtablearr_A:
.int vtable_Object
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
# Class A_____________________________________________________________
  # 
  .section .text
# __Method A.foo______________________________________________________
  .globl A_foo
A_foo:
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
    # Emitting write(1)
      # Emitting 1
      movl $1, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting write(this.field)
      # Emitting this.field
        # Emitting this
        movl 8(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 4(%edi), %edi
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
# Class Main__________________________________________________________
  # 
  .section .text
# __Method Main.main__________________________________________________
  .globl Main_main
Main_main:
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
    # Emitting this.x = new A[][2]
      # Emitting new A[][2]
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
      movl $vtablearr_A, 0(%edi)
      movl %esi, 4(%edi)
      # Emitting this
      movl 8(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 4(%esi)
    # Emitting i = 1
      # Emitting 1
      movl $1, %edi
    movl %edi, -12(%ebp)
    # Emitting write(i)
      # Emitting i
      movl -12(%ebp), %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
    # Emitting this.x[i] = new A()
      # Emitting new A()
      push $8
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_A, 0(%edi)
      # Emitting this.x
        # Emitting this
        movl 8(%ebp), %esi
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
    # Emitting this.x[i].field = (i + 1)
      # Emitting (i + 1)
        # Emitting i
        movl -12(%ebp), %edi
        # Emitting 1
        movl $1, %edx
      addl %edx, %edi
      # Emitting this.x[i]
        # Emitting this.x
          # Emitting this
          movl 8(%ebp), %edx
        push %edx
        sub $12, %esp
        push %edx
        call Javali$CheckNull
        add $16, %esp
        pop %edx
        movl 4(%edx), %edx
      push %edx
      sub $12, %esp
      push %edx
      call Javali$CheckNull
      add $16, %esp
      pop %edx
        # Emitting i
        movl -12(%ebp), %esi
      push %edx
      sub $8, %esp
      push %esi
      push %edx
      call Javali$CheckArrayBounds
      add $16, %esp
      pop %edx
      movl 8(%edx,%esi,4), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 4(%esi)
    # Emitting i = this.x[1].field
      # Emitting this.x[1].field
        # Emitting this.x[1]
          # Emitting this.x
            # Emitting this
            movl 8(%ebp), %edi
          push %edi
          call Javali$CheckNull
          add $4, %esp
          movl 4(%edi), %edi
        push %edi
        call Javali$CheckNull
        add $4, %esp
          # Emitting 1
          movl $1, %esi
        sub $12, %esp
        push %esi
        push %edi
        call Javali$CheckArrayBounds
        add $20, %esp
        movl 8(%edi,%esi,4), %esi
      push %esi
      call Javali$CheckNull
      add $4, %esp
      movl 4(%esi), %esi
    movl %esi, -12(%ebp)
    # Emitting write(i)
      # Emitting i
      movl -12(%ebp), %esi
    push %esi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
    # Emitting this.x[1].foo(...)
      # Emitting this.x[1].foo(...)
        # Emitting this.x[1]
          # Emitting this.x
            # Emitting this
            movl 8(%ebp), %esi
          push %esi
          call Javali$CheckNull
          add $4, %esp
          movl 4(%esi), %esi
        push %esi
        call Javali$CheckNull
        add $4, %esp
          # Emitting 1
          movl $1, %edi
        sub $12, %esp
        push %edi
        push %esi
        call Javali$CheckArrayBounds
        add $20, %esp
        movl 8(%esi,%edi,4), %edi
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
