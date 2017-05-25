vtable_A:
.int vtable_Object
.int A_fun
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
.int Main_foo
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
      push $24
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
# Class Main__________________________________________________________
  # 
  .section .text
# __Method Main.main__________________________________________________
  .globl Main_main
Main_main:
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
    # Emitting this.i1 = this.i2
      # Emitting this.i2
        # Emitting this
        movl 8(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 20(%edi), %edi
      # Emitting this
      movl 8(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 16(%esi)
    # Emitting this.i1 = this.a.a
      # Emitting this.a.a
        # Emitting this.a
          # Emitting this
          movl 8(%ebp), %edi
        push %edi
        call Javali$CheckNull
        add $4, %esp
        movl 8(%edi), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 4(%edi), %edi
      # Emitting this
      movl 8(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 16(%esi)
    # Emitting this.i2 = this.arr[1]
      # Emitting this.arr[1]
        # Emitting this.arr
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
      # Emitting this
      movl 8(%ebp), %edi
    push %edi
    call Javali$CheckNull
    add $4, %esp
    movl %esi, 20(%edi)
    # Emitting this.i1 = this.a.fun(...)
      # Emitting this.a.fun(...)
        # Emitting this.a
          # Emitting this
          movl 8(%ebp), %esi
        push %esi
        call Javali$CheckNull
        add $4, %esp
        movl 8(%esi), %esi
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
      # Emitting this
      movl 8(%ebp), %edi
    push %edi
    call Javali$CheckNull
    add $4, %esp
    movl %esi, 16(%edi)
    # Emitting this.i1 = this.foo(...)
      # Emitting this.foo(...)
        # Emitting this
        movl 8(%ebp), %esi
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
      # Emitting this
      movl 8(%ebp), %edi
    push %edi
    call Javali$CheckNull
    add $4, %esp
    movl %esi, 16(%edi)
    # Emitting write(this.i2)
      # Emitting this.i2
        # Emitting this
        movl 8(%ebp), %esi
      push %esi
      call Javali$CheckNull
      add $4, %esp
      movl 20(%esi), %esi
    push %esi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting write(this.a.a)
      # Emitting this.a.a
        # Emitting this.a
          # Emitting this
          movl 8(%ebp), %esi
        push %esi
        call Javali$CheckNull
        add $4, %esp
        movl 8(%esi), %esi
      push %esi
      call Javali$CheckNull
      add $4, %esp
      movl 4(%esi), %esi
    push %esi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting write(this.arr[1])
      # Emitting this.arr[1]
        # Emitting this.arr
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
    call Javali$PrintInteger
    add $4, %esp
    # Emitting write(this.a.fun(...))
      # Emitting this.a.fun(...)
        # Emitting this.a
          # Emitting this
          movl 8(%ebp), %edi
        push %edi
        call Javali$CheckNull
        add $4, %esp
        movl 8(%edi), %edi
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
    push %edi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting write(this.foo(...))
      # Emitting this.foo(...)
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
    push %edi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting this.a.a = this.i1
      # Emitting this.i1
        # Emitting this
        movl 8(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 16(%edi), %edi
      # Emitting this.a
        # Emitting this
        movl 8(%ebp), %esi
      push %esi
      call Javali$CheckNull
      add $4, %esp
      movl 8(%esi), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 4(%esi)
    # Emitting this.arr[1] = this.i2
      # Emitting this.i2
        # Emitting this
        movl 8(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 20(%edi), %edi
      # Emitting this.arr
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
      movl $1, %edx
    push %edx
    sub $8, %esp
    push %edx
    push %esi
    call Javali$CheckArrayBounds
    add $16, %esp
    pop %edx
    movl %edi, 8(%esi,%edx,4)
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
# __Method Main.foo___________________________________________________
  .globl Main_foo
Main_foo:
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
# Class A_____________________________________________________________
  # 
  .section .text
# __Method A.fun______________________________________________________
  .globl A_fun
A_fun:
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
