vtable_A:
.int vtable_Object
.int A_funA
.int A_foo
vtable_B:
.int vtable_A
.int A_funA
.int B_foo
.int B_funB
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
.int Main_loc
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
      push $16
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
    # Emitting write(this.x)
      # Emitting this.x
        # Emitting this
        movl 8(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 4(%edi), %edi
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
  .section .text
# __Method A.funA_____________________________________________________
  .globl A_funA
A_funA:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label10
# __Basic block 0_____________________________________________________
label10:
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
# Class B_____________________________________________________________
  # 
  .section .text
# __Method B.funB_____________________________________________________
  .globl B_funB
B_funB:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label13
# __Basic block 0_____________________________________________________
label13:
  # Exit to block 1
  jmp label14
# __Basic block 1_____________________________________________________
label14:
  # Return
  jmp label15
label15:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method B.foo______________________________________________________
  .globl B_foo
B_foo:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label16
# __Basic block 0_____________________________________________________
label16:
  # Exit to block 1
  jmp label17
# __Basic block 1_____________________________________________________
label17:
  # Return
  jmp label18
label18:
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
  # c            -12
  # implicit=8 localSlot=16 sum=24
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  jmp label19
# __Basic block 0_____________________________________________________
label19:
    # Emitting c = new int[][3]
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
    # Emitting this.a = new A()
      # Emitting new A()
      push $8
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_A, 0(%edi)
      # Emitting this
      movl 8(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 4(%esi)
    # Emitting this.b = new B()
      # Emitting new B()
      push $8
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_B, 0(%edi)
      # Emitting this
      movl 8(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 8(%esi)
    # Emitting this.a.x = 5
      # Emitting 5
      movl $5, %edi
      # Emitting this.a
        # Emitting this
        movl 8(%ebp), %esi
      push %esi
      call Javali$CheckNull
      add $4, %esp
      movl 4(%esi), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 4(%esi)
    # Emitting this.g = this.a.x
      # Emitting this.a.x
        # Emitting this.a
          # Emitting this
          movl 8(%ebp), %edi
        push %edi
        call Javali$CheckNull
        add $4, %esp
        movl 4(%edi), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 4(%edi), %edi
      # Emitting this
      movl 8(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 12(%esi)
    # Emitting c[0] = this.loc(...)
      # Emitting this.loc(...)
      sub $12, %esp
        # Emitting this
        movl 8(%ebp), %edi
      push %edi
        # Emitting (this.g + 1)
          # Emitting this.g
            # Emitting this
            movl 8(%ebp), %edi
          push %edi
          call Javali$CheckNull
          add $4, %esp
          movl 12(%edi), %edi
          # Emitting 1
          movl $1, %esi
        addl %esi, %edi
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
      # Emitting c
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
    # Emitting write(c[0])
      # Emitting c[0]
        # Emitting c
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
    push %edx
    sub $12, %esp
    push %edx
    call Javali$PrintInteger
    add $16, %esp
    pop %edx
  # Exit to block 1
  jmp label20
# __Basic block 1_____________________________________________________
label20:
  # Return
  jmp label21
label21:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Main.loc___________________________________________________
  .globl Main_loc
Main_loc:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label22
# __Basic block 0_____________________________________________________
label22:
    # Emitting arg = (arg + 2)
      # Emitting (arg + 2)
        # Emitting arg
        movl 8(%ebp), %edi
        # Emitting 2
        movl $2, %esi
      addl %esi, %edi
    movl %edi, 8(%ebp)
    # Emitting return arg
      # Emitting arg
      movl 8(%ebp), %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label23
# __Basic block 1_____________________________________________________
label23:
  # Return
  jmp label24
label24:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
