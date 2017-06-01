vtable_A:
.int vtable_Object
.int A_foo
vtable_B:
.int vtable_A
.int B_foo
.int B_boo
vtable_C:
.int vtable_B
.int B_foo
.int C_boo
vtablearr_A:
.int vtable_Object
vtablearr_C:
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
    # Emitting return 0
      # Emitting 0
      movl $0, %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
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
# Class B_____________________________________________________________
  # 
  .section .text
# __Method B.boo______________________________________________________
  .globl B_boo
B_boo:
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
    # Emitting return i
      # Emitting i
      movl 8(%ebp), %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
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
  jmp label13
# __Basic block 0_____________________________________________________
label13:
    # Emitting return 1
      # Emitting 1
      movl $1, %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
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
# Class C_____________________________________________________________
  # 
  .section .text
# __Method C.boo______________________________________________________
  .globl C_boo
C_boo:
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
    # Emitting return (i + 1)
      # Emitting (i + 1)
        # Emitting i
        movl 8(%ebp), %edi
        # Emitting 1
        movl $1, %esi
      addl %esi, %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
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
  # arr          -12
  # a            -16
  # b            -20
  # implicit=8 localSlot=24 sum=32
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  movl $0, -20(%ebp)
  jmp label19
# __Basic block 0_____________________________________________________
label19:
    # Emitting arr = new A[][1]
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
    movl %edi, -12(%ebp)
    # Emitting arr[0] = new A()
      # Emitting new A()
      push $8
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_A, 0(%edi)
      # Emitting arr
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
    # Emitting arr[0].k = 10
      # Emitting 10
      movl $10, %edi
      # Emitting arr[0]
        # Emitting arr
        movl -12(%ebp), %edx
      push %edx
      sub $12, %esp
      push %edx
      call Javali$CheckNull
      add $16, %esp
      pop %edx
        # Emitting 0
        movl $0, %esi
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
    # Emitting write(arr[0].k)
      # Emitting arr[0].k
        # Emitting arr[0]
          # Emitting arr
          movl -12(%ebp), %edi
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
      movl 4(%esi), %esi
    push %esi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting this.k = 6
      # Emitting 6
      movl $6, %esi
      # Emitting this
      movl 8(%ebp), %edi
    push %edi
    call Javali$CheckNull
    add $4, %esp
    movl %esi, 4(%edi)
    # Emitting a = new A()
      # Emitting new A()
      push $8
      call Javali$Alloc
      add $4, %esp
      movl %eax, %esi
      movl $vtable_A, 0(%esi)
    movl %esi, -16(%ebp)
    # Emitting write(a.foo(...))
      # Emitting a.foo(...)
        # Emitting a
        movl -16(%ebp), %esi
      push %esi
      # Load "this" pointer
      movl 0(%esp), %esi
      sub $12, %esp
      push %esi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%esi), %esi
      movl 4(%esi), %esi
      call *%esi
      add $4, %esp
      movl %eax, %esi
    push %esi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting b = new B()
      # Emitting new B()
      push $12
      call Javali$Alloc
      add $4, %esp
      movl %eax, %esi
      movl $vtable_B, 0(%esi)
    movl %esi, -20(%ebp)
    # Emitting write(b.foo(...))
      # Emitting b.foo(...)
        # Emitting b
        movl -20(%ebp), %esi
      push %esi
      # Load "this" pointer
      movl 0(%esp), %esi
      sub $12, %esp
      push %esi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%esi), %esi
      movl 4(%esi), %esi
      call *%esi
      add $4, %esp
      movl %eax, %esi
    push %esi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting write(this.k)
      # Emitting this.k
        # Emitting this
        movl 8(%ebp), %esi
      push %esi
      call Javali$CheckNull
      add $4, %esp
      movl 4(%esi), %esi
    push %esi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting write(b.boo(...))
      # Emitting b.boo(...)
      sub $12, %esp
        # Emitting b
        movl -20(%ebp), %esi
      push %esi
        # Emitting this.k
          # Emitting this
          movl 8(%ebp), %esi
        push %esi
        call Javali$CheckNull
        add $4, %esp
        movl 4(%esi), %esi
      push %esi
      # Load "this" pointer
      movl 4(%esp), %esi
      sub $12, %esp
      push %esi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%esi), %esi
      movl 8(%esi), %esi
      call *%esi
      add $20, %esp
      movl %eax, %esi
    push %esi
    call Javali$PrintInteger
    add $4, %esp
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
