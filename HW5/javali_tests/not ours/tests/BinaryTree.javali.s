vtable_NegativeCell:
.int vtable_Cell
.int NegativeCell_print
vtable_ReadToClearCell:
.int vtable_Cell
.int ReadToClearCell_print
vtablearr_ReadToClearCell:
.int vtable_Object
vtable_BinaryTree:
.int vtable_Object
.int BinaryTree_printKeys
.int BinaryTree_get
.int BinaryTree_insert
vtablearr_int:
.int vtable_Object
vtablearr_NegativeCell:
.int vtable_Object
vtablearr_DelayedCell:
.int vtable_Object
vtable_BinaryTreeFactory:
.int vtable_Object
.int BinaryTreeFactory_newTree
.int BinaryTreeFactory_fromArray
vtable_DelayedCell:
.int vtable_Cell
.int DelayedCell_print
vtablearr_Cell:
.int vtable_Object
vtablearr_Main:
.int vtable_Object
vtable_Object:
.int 0
vtablearr_BinaryTree:
.int vtable_Object
vtablearr_boolean:
.int vtable_Object
vtable_Main:
.int vtable_Object
.int Main_checkpoint
.int Main_main
.int Main_cellTest
.int Main_sortedPrint
vtable_Cell:
.int vtable_Object
.int Cell_print
vtablearr_Object:
.int vtable_Object
vtablearr_BinaryTreeFactory:
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
    movl 8(%edi), %edi
    call *%edi
    add $16, %esp
    movl %eax, %edi
movl $0, %eax
leave
ret
# Class BinaryTree____________________________________________________
  # 
  .section .text
# __Method BinaryTree.insert__________________________________________
  .globl BinaryTree_insert
BinaryTree_insert:
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
  # Exit to block 2 if true, block 3 if false
    # Emitting (this.value == null)
      # Emitting this.value
        # Emitting this
        movl 16(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 12(%edi), %edi
      # Emitting null
      movl $0, %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    sete %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label10
  jmp label9
# __Basic block 1_____________________________________________________
label8:
  # Return
  jmp label21
# __Basic block 2_____________________________________________________
label9:
    # Emitting this.value = obj
      # Emitting obj
      movl 12(%ebp), %edi
      # Emitting this
      movl 16(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 12(%esi)
    # Emitting this.key = w
      # Emitting w
      movl 8(%ebp), %edi
      # Emitting this
      movl 16(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 16(%esi)
  # Exit to block 13
  jmp label20
# __Basic block 3_____________________________________________________
label10:
  # Exit to block 4 if true, block 5 if false
    # Emitting (w < this.key)
      # Emitting w
      movl 8(%ebp), %edi
      # Emitting this.key
        # Emitting this
        movl 16(%ebp), %esi
      push %esi
      call Javali$CheckNull
      add $4, %esp
      movl 16(%esi), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label12
  jmp label11
# __Basic block 4_____________________________________________________
label11:
  # Exit to block 6 if true, block 7 if false
    # Emitting (this.left == null)
      # Emitting this.left
        # Emitting this
        movl 16(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 4(%edi), %edi
      # Emitting null
      movl $0, %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    sete %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label14
  jmp label13
# __Basic block 5_____________________________________________________
label12:
  # Exit to block 9 if true, block 10 if false
    # Emitting (this.right == null)
      # Emitting this.right
        # Emitting this
        movl 16(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 8(%edi), %edi
      # Emitting null
      movl $0, %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    sete %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label17
  jmp label16
# __Basic block 6_____________________________________________________
label13:
    # Emitting this.left = new BinaryTree()
      # Emitting new BinaryTree()
      push $20
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_BinaryTree, 0(%edi)
      # Emitting this
      movl 16(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 4(%esi)
  # Exit to block 8
  jmp label15
# __Basic block 7_____________________________________________________
label14:
    # Emitting nop
  # Exit to block 8
  jmp label15
# __Basic block 8_____________________________________________________
label15:
    # Emitting this.left.insert(...)
      # Emitting this.left.insert(...)
      sub $8, %esp
        # Emitting this.left
          # Emitting this
          movl 16(%ebp), %edi
        sub $8, %esp
        push %edi
        call Javali$CheckNull
        add $12, %esp
        movl 4(%edi), %edi
      push %edi
        # Emitting obj
        movl 12(%ebp), %edi
      push %edi
        # Emitting w
        movl 8(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 8(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 12(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
  # Exit to block 12
  jmp label19
# __Basic block 9_____________________________________________________
label16:
    # Emitting this.right = new BinaryTree()
      # Emitting new BinaryTree()
      push $20
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_BinaryTree, 0(%edi)
      # Emitting this
      movl 16(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 8(%esi)
  # Exit to block 11
  jmp label18
# __Basic block 10____________________________________________________
label17:
    # Emitting nop
  # Exit to block 11
  jmp label18
# __Basic block 11____________________________________________________
label18:
    # Emitting this.right.insert(...)
      # Emitting this.right.insert(...)
      sub $8, %esp
        # Emitting this.right
          # Emitting this
          movl 16(%ebp), %edi
        sub $8, %esp
        push %edi
        call Javali$CheckNull
        add $12, %esp
        movl 8(%edi), %edi
      push %edi
        # Emitting obj
        movl 12(%ebp), %edi
      push %edi
        # Emitting w
        movl 8(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 8(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 12(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
  # Exit to block 12
  jmp label19
# __Basic block 12____________________________________________________
label19:
  # Exit to block 13
  jmp label20
# __Basic block 13____________________________________________________
label20:
  # Exit to block 1
  jmp label8
label21:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method BinaryTree.printKeys_______________________________________
  .globl BinaryTree_printKeys
BinaryTree_printKeys:
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
  # Exit to block 2 if true, block 3 if false
    # Emitting (this.left != null)
      # Emitting this.left
        # Emitting this
        movl 8(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 4(%edi), %edi
      # Emitting null
      movl $0, %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setne %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label25
  jmp label24
# __Basic block 1_____________________________________________________
label23:
  # Return
  jmp label30
# __Basic block 2_____________________________________________________
label24:
    # Emitting this.left.printKeys(...)
      # Emitting this.left.printKeys(...)
        # Emitting this.left
          # Emitting this
          movl 8(%ebp), %edi
        push %edi
        call Javali$CheckNull
        add $4, %esp
        movl 4(%edi), %edi
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
  # Exit to block 4
  jmp label26
# __Basic block 3_____________________________________________________
label25:
    # Emitting nop
  # Exit to block 4
  jmp label26
# __Basic block 4_____________________________________________________
label26:
    # Emitting write(this.key)
      # Emitting this.key
        # Emitting this
        movl 8(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 16(%edi), %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
  # Exit to block 5 if true, block 6 if false
    # Emitting (this.right != null)
      # Emitting this.right
        # Emitting this
        movl 8(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 8(%edi), %edi
      # Emitting null
      movl $0, %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setne %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label28
  jmp label27
# __Basic block 5_____________________________________________________
label27:
    # Emitting this.right.printKeys(...)
      # Emitting this.right.printKeys(...)
        # Emitting this.right
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
  # Exit to block 7
  jmp label29
# __Basic block 6_____________________________________________________
label28:
    # Emitting nop
  # Exit to block 7
  jmp label29
# __Basic block 7_____________________________________________________
label29:
  # Exit to block 1
  jmp label23
label30:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method BinaryTree.get_____________________________________________
  .globl BinaryTree_get
BinaryTree_get:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label31
# __Basic block 0_____________________________________________________
label31:
  # Exit to block 2 if true, block 3 if false
    # Emitting (i == this.key)
      # Emitting i
      movl 8(%ebp), %edi
      # Emitting this.key
        # Emitting this
        movl 12(%ebp), %esi
      push %esi
      call Javali$CheckNull
      add $4, %esp
      movl 16(%esi), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    sete %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label34
  jmp label33
# __Basic block 1_____________________________________________________
label32:
  # Return
  jmp label51
# __Basic block 2_____________________________________________________
label33:
    # Emitting return this.value
      # Emitting this.value
        # Emitting this
        movl 12(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 12(%edi), %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label32
# __Basic block 3_____________________________________________________
label34:
    # Emitting nop
  # Exit to block 4
  jmp label35
# __Basic block 4_____________________________________________________
label35:
  # Exit to block 5 if true, block 6 if false
    # Emitting ((this.left == null) && (this.right == null))
      # Emitting (this.left == null)
        # Emitting this.left
          # Emitting this
          movl 12(%ebp), %edi
        push %edi
        call Javali$CheckNull
        add $4, %esp
        movl 4(%edi), %edi
        # Emitting null
        movl $0, %esi
      cmpl %esi, %edi
      push %eax
      movl $0, %eax
      sete %al
      movl %eax, %edi
      pop %eax
      # Emitting (this.right == null)
        # Emitting this.right
          # Emitting this
          movl 12(%ebp), %esi
        push %esi
        call Javali$CheckNull
        add $4, %esp
        movl 8(%esi), %esi
        # Emitting null
        movl $0, %edx
      cmpl %edx, %esi
      push %eax
      movl $0, %eax
      sete %al
      movl %eax, %esi
      pop %eax
    andl %esi, %edi
  cmpl $0, %edi
  je label37
  jmp label36
# __Basic block 5_____________________________________________________
label36:
    # Emitting return this.value
      # Emitting this.value
        # Emitting this
        movl 12(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 12(%edi), %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label32
# __Basic block 6_____________________________________________________
label37:
    # Emitting nop
  # Exit to block 7
  jmp label38
# __Basic block 7_____________________________________________________
label38:
  # Exit to block 8 if true, block 9 if false
    # Emitting ((this.left == null) && (i < this.key))
      # Emitting (this.left == null)
        # Emitting this.left
          # Emitting this
          movl 12(%ebp), %edi
        push %edi
        call Javali$CheckNull
        add $4, %esp
        movl 4(%edi), %edi
        # Emitting null
        movl $0, %esi
      cmpl %esi, %edi
      push %eax
      movl $0, %eax
      sete %al
      movl %eax, %edi
      pop %eax
      # Emitting (i < this.key)
        # Emitting i
        movl 8(%ebp), %esi
        # Emitting this.key
          # Emitting this
          movl 12(%ebp), %edx
        push %edx
        sub $12, %esp
        push %edx
        call Javali$CheckNull
        add $16, %esp
        pop %edx
        movl 16(%edx), %edx
      cmpl %edx, %esi
      push %eax
      movl $0, %eax
      setl %al
      movl %eax, %esi
      pop %eax
    andl %esi, %edi
  cmpl $0, %edi
  je label40
  jmp label39
# __Basic block 8_____________________________________________________
label39:
    # Emitting return this.value
      # Emitting this.value
        # Emitting this
        movl 12(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 12(%edi), %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label32
# __Basic block 9_____________________________________________________
label40:
    # Emitting nop
  # Exit to block 10
  jmp label41
# __Basic block 10____________________________________________________
label41:
  # Exit to block 11 if true, block 12 if false
    # Emitting ((this.right == null) && (i > this.key))
      # Emitting (this.right == null)
        # Emitting this.right
          # Emitting this
          movl 12(%ebp), %edi
        push %edi
        call Javali$CheckNull
        add $4, %esp
        movl 8(%edi), %edi
        # Emitting null
        movl $0, %esi
      cmpl %esi, %edi
      push %eax
      movl $0, %eax
      sete %al
      movl %eax, %edi
      pop %eax
      # Emitting (i > this.key)
        # Emitting i
        movl 8(%ebp), %esi
        # Emitting this.key
          # Emitting this
          movl 12(%ebp), %edx
        push %edx
        sub $12, %esp
        push %edx
        call Javali$CheckNull
        add $16, %esp
        pop %edx
        movl 16(%edx), %edx
      cmpl %edx, %esi
      push %eax
      movl $0, %eax
      setg %al
      movl %eax, %esi
      pop %eax
    andl %esi, %edi
  cmpl $0, %edi
  je label43
  jmp label42
# __Basic block 11____________________________________________________
label42:
    # Emitting return this.value
      # Emitting this.value
        # Emitting this
        movl 12(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 12(%edi), %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label32
# __Basic block 12____________________________________________________
label43:
    # Emitting nop
  # Exit to block 13
  jmp label44
# __Basic block 13____________________________________________________
label44:
  # Exit to block 14 if true, block 15 if false
    # Emitting (i < this.key)
      # Emitting i
      movl 8(%ebp), %edi
      # Emitting this.key
        # Emitting this
        movl 12(%ebp), %esi
      push %esi
      call Javali$CheckNull
      add $4, %esp
      movl 16(%esi), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label46
  jmp label45
# __Basic block 14____________________________________________________
label45:
    # Emitting return this.left.get(...)
      # Emitting this.left.get(...)
      sub $12, %esp
        # Emitting this.left
          # Emitting this
          movl 12(%ebp), %edi
        sub $4, %esp
        push %edi
        call Javali$CheckNull
        add $8, %esp
        movl 4(%edi), %edi
      push %edi
        # Emitting i
        movl 8(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 4(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 8(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label32
# __Basic block 15____________________________________________________
label46:
    # Emitting nop
  # Exit to block 16
  jmp label47
# __Basic block 16____________________________________________________
label47:
  # Exit to block 17 if true, block 18 if false
    # Emitting (i > this.key)
      # Emitting i
      movl 8(%ebp), %edi
      # Emitting this.key
        # Emitting this
        movl 12(%ebp), %esi
      push %esi
      call Javali$CheckNull
      add $4, %esp
      movl 16(%esi), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setg %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label49
  jmp label48
# __Basic block 17____________________________________________________
label48:
    # Emitting return this.right.get(...)
      # Emitting this.right.get(...)
      sub $12, %esp
        # Emitting this.right
          # Emitting this
          movl 12(%ebp), %edi
        sub $4, %esp
        push %edi
        call Javali$CheckNull
        add $8, %esp
        movl 8(%edi), %edi
      push %edi
        # Emitting i
        movl 8(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 4(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 8(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label32
# __Basic block 18____________________________________________________
label49:
    # Emitting nop
  # Exit to block 19
  jmp label50
# __Basic block 19____________________________________________________
label50:
    # Emitting return null
      # Emitting null
      movl $0, %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label32
label51:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
# Class BinaryTreeFactory_____________________________________________
  # 
  .section .text
# __Method BinaryTreeFactory.newTree__________________________________
  .globl BinaryTreeFactory_newTree
BinaryTreeFactory_newTree:
  # Variable     Offset
  # bn           -12
  # implicit=8 localSlot=16 sum=24
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  jmp label52
# __Basic block 0_____________________________________________________
label52:
    # Emitting bn = new BinaryTree()
      # Emitting new BinaryTree()
      push $20
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_BinaryTree, 0(%edi)
    movl %edi, -12(%ebp)
    # Emitting return bn
      # Emitting bn
      movl -12(%ebp), %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label53
# __Basic block 1_____________________________________________________
label53:
  # Return
  jmp label54
label54:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method BinaryTreeFactory.fromArray________________________________
  .globl BinaryTreeFactory_fromArray
BinaryTreeFactory_fromArray:
  # Variable     Offset
  # i            -12
  # bn           -16
  # implicit=8 localSlot=20 sum=28
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  jmp label55
# __Basic block 0_____________________________________________________
label55:
    # Emitting bn = new BinaryTree()
      # Emitting new BinaryTree()
      push $20
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_BinaryTree, 0(%edi)
    movl %edi, -16(%ebp)
  # Exit to block 2
  jmp label57
# __Basic block 1_____________________________________________________
label56:
  # Return
  jmp label60
# __Basic block 2_____________________________________________________
label57:
  # Exit to block 3 if true, block 4 if false
    # Emitting (i < size)
      # Emitting i
      movl -12(%ebp), %edi
      # Emitting size
      movl 8(%ebp), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label59
  jmp label58
# __Basic block 3_____________________________________________________
label58:
    # Emitting bn.insert(...)
      # Emitting bn.insert(...)
      sub $8, %esp
        # Emitting bn
        movl -16(%ebp), %edi
      push %edi
        # Emitting values[i]
          # Emitting values
          movl 12(%ebp), %edi
        sub $4, %esp
        push %edi
        call Javali$CheckNull
        add $8, %esp
          # Emitting i
          movl -12(%ebp), %esi
        push %esi
        push %edi
        call Javali$CheckArrayBounds
        add $8, %esp
        movl 8(%edi,%esi,4), %esi
      push %esi
        # Emitting i
        movl -12(%ebp), %esi
      push %esi
      # Load "this" pointer
      movl 8(%esp), %esi
      sub $12, %esp
      push %esi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%esi), %esi
      movl 12(%esi), %esi
      call *%esi
      add $20, %esp
      movl %eax, %esi
    # Emitting i = (i + 1)
      # Emitting (i + 1)
        # Emitting i
        movl -12(%ebp), %esi
        # Emitting 1
        movl $1, %edi
      addl %edi, %esi
    movl %esi, -12(%ebp)
  # Exit to block 2
  jmp label57
# __Basic block 4_____________________________________________________
label59:
    # Emitting return bn
      # Emitting bn
      movl -16(%ebp), %esi
    movl %esi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label56
label60:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
# Class Cell__________________________________________________________
  # 
  .section .text
# __Method Cell.print_________________________________________________
  .globl Cell_print
Cell_print:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label61
# __Basic block 0_____________________________________________________
label61:
    # Emitting write(this.k)
      # Emitting this.k
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
  jmp label62
# __Basic block 1_____________________________________________________
label62:
  # Return
  jmp label63
label63:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
# Class DelayedCell___________________________________________________
  # 
  .section .text
# __Method DelayedCell.print__________________________________________
  .globl DelayedCell_print
DelayedCell_print:
  # Variable     Offset
  # c            -12
  # implicit=8 localSlot=16 sum=24
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  jmp label64
# __Basic block 0_____________________________________________________
label64:
    # Emitting write(this.k)
      # Emitting this.k
        # Emitting this
        movl 8(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 8(%edi), %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting c = (Cell)(this)
      # Emitting (Cell)(this)
        # Emitting this
        movl 8(%ebp), %edi
      sub $12, %esp
      push %edi
      push $vtable_Cell
      call Javali$CheckCast
      add $20, %esp
    movl %edi, -12(%ebp)
    # Emitting this.k = c.k
      # Emitting c.k
        # Emitting c
        movl -12(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 4(%edi), %edi
      # Emitting this
      movl 8(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 8(%esi)
  # Exit to block 1
  jmp label65
# __Basic block 1_____________________________________________________
label65:
  # Return
  jmp label66
label66:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
# Class Main__________________________________________________________
  # 
  .section .text
# __Method Main.checkpoint____________________________________________
  .globl Main_checkpoint
Main_checkpoint:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label67
# __Basic block 0_____________________________________________________
label67:
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
    # Emitting write(this.t)
      # Emitting this.t
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
    # Emitting this.t = (this.t + 1)
      # Emitting (this.t + 1)
        # Emitting this.t
          # Emitting this
          movl 8(%ebp), %edi
        push %edi
        call Javali$CheckNull
        add $4, %esp
        movl 4(%edi), %edi
        # Emitting 1
        movl $1, %esi
      addl %esi, %edi
      # Emitting this
      movl 8(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 4(%esi)
  # Exit to block 1
  jmp label68
# __Basic block 1_____________________________________________________
label68:
  # Return
  jmp label69
label69:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Main.main__________________________________________________
  .globl Main_main
Main_main:
  # Variable     Offset
  # p            -12
  # input        -16
  # size         -20
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
  jmp label70
# __Basic block 0_____________________________________________________
label70:
    # Emitting this.checkpoint(...)
      # Emitting this.checkpoint(...)
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
    # Emitting size = read()
      # Emitting read()
      sub $4, %esp
      call Javali$ReadInteger
      add $4, %esp
      movl %eax, %edi
    movl %edi, -20(%ebp)
    # Emitting input = new int[][size]
      # Emitting new int[][size]
        # Emitting size
        movl -20(%ebp), %edi
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
    movl %edi, -16(%ebp)
    # Emitting this.checkpoint(...)
      # Emitting this.checkpoint(...)
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
    # Emitting p = read()
      # Emitting read()
      sub $4, %esp
      call Javali$ReadInteger
      add $4, %esp
      movl %eax, %edi
    movl %edi, -12(%ebp)
  # Exit to block 2
  jmp label72
# __Basic block 1_____________________________________________________
label71:
  # Return
  jmp label78
# __Basic block 2_____________________________________________________
label72:
  # Exit to block 3 if true, block 4 if false
    # Emitting ((p != -(1)) && (i < size))
      # Emitting (p != -(1))
        # Emitting p
        movl -12(%ebp), %edi
        # Emitting -(1)
          # Emitting 1
          movl $1, %esi
        negl %esi
      cmpl %esi, %edi
      push %eax
      movl $0, %eax
      setne %al
      movl %eax, %edi
      pop %eax
      # Emitting (i < size)
        # Emitting i
        movl -24(%ebp), %esi
        # Emitting size
        movl -20(%ebp), %edx
      cmpl %edx, %esi
      push %eax
      movl $0, %eax
      setl %al
      movl %eax, %esi
      pop %eax
    andl %esi, %edi
  cmpl $0, %edi
  je label74
  jmp label73
# __Basic block 3_____________________________________________________
label73:
  # Exit to block 5 if true, block 6 if false
    # Emitting (p > 0)
      # Emitting p
      movl -12(%ebp), %edi
      # Emitting 0
      movl $0, %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setg %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label76
  jmp label75
# __Basic block 4_____________________________________________________
label74:
    # Emitting this.checkpoint(...)
      # Emitting this.checkpoint(...)
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
    # Emitting this.sortedPrint(...)
      # Emitting this.sortedPrint(...)
      sub $8, %esp
        # Emitting this
        movl 8(%ebp), %edi
      push %edi
        # Emitting input
        movl -16(%ebp), %edi
      push %edi
        # Emitting i
        movl -24(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 8(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 16(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
    # Emitting this.checkpoint(...)
      # Emitting this.checkpoint(...)
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
    # Emitting this.cellTest(...)
      # Emitting this.cellTest(...)
      sub $8, %esp
        # Emitting this
        movl 8(%ebp), %edi
      push %edi
        # Emitting input
        movl -16(%ebp), %edi
      push %edi
        # Emitting i
        movl -24(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 8(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 12(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
  # Exit to block 1
  jmp label71
# __Basic block 5_____________________________________________________
label75:
    # Emitting input[i] = p
      # Emitting p
      movl -12(%ebp), %edi
      # Emitting input
      movl -16(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
      # Emitting i
      movl -24(%ebp), %edx
    push %edx
    sub $8, %esp
    push %edx
    push %esi
    call Javali$CheckArrayBounds
    add $16, %esp
    pop %edx
    movl %edi, 8(%esi,%edx,4)
  # Exit to block 7
  jmp label77
# __Basic block 6_____________________________________________________
label76:
    # Emitting nop
  # Exit to block 7
  jmp label77
# __Basic block 7_____________________________________________________
label77:
    # Emitting p = read()
      # Emitting read()
      sub $4, %esp
      call Javali$ReadInteger
      add $4, %esp
      movl %eax, %edi
    movl %edi, -12(%ebp)
    # Emitting i = (i + 1)
      # Emitting (i + 1)
        # Emitting i
        movl -24(%ebp), %edi
        # Emitting 1
        movl $1, %edx
      addl %edx, %edi
    movl %edi, -24(%ebp)
  # Exit to block 2
  jmp label72
label78:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Main.sortedPrint___________________________________________
  .globl Main_sortedPrint
Main_sortedPrint:
  # Variable     Offset
  # factory      -12
  # a            -16
  # tree         -20
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
  jmp label79
# __Basic block 0_____________________________________________________
label79:
    # Emitting factory = new BinaryTreeFactory()
      # Emitting new BinaryTreeFactory()
      push $4
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_BinaryTreeFactory, 0(%edi)
    movl %edi, -12(%ebp)
    # Emitting tree = factory.newTree(...)
      # Emitting factory.newTree(...)
        # Emitting factory
        movl -12(%ebp), %edi
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
    movl %edi, -20(%ebp)
    # Emitting a = new Object()
      # Emitting new Object()
      push $4
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_Object, 0(%edi)
    movl %edi, -16(%ebp)
  # Exit to block 2
  jmp label81
# __Basic block 1_____________________________________________________
label80:
  # Return
  jmp label84
# __Basic block 2_____________________________________________________
label81:
  # Exit to block 3 if true, block 4 if false
    # Emitting (i < size)
      # Emitting i
      movl -24(%ebp), %edi
      # Emitting size
      movl 8(%ebp), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label83
  jmp label82
# __Basic block 3_____________________________________________________
label82:
    # Emitting tree.insert(...)
      # Emitting tree.insert(...)
      sub $8, %esp
        # Emitting tree
        movl -20(%ebp), %edi
      push %edi
        # Emitting a
        movl -16(%ebp), %edi
      push %edi
        # Emitting input[i]
          # Emitting input
          movl 12(%ebp), %edi
        push %edi
        call Javali$CheckNull
        add $4, %esp
          # Emitting i
          movl -24(%ebp), %esi
        sub $12, %esp
        push %esi
        push %edi
        call Javali$CheckArrayBounds
        add $20, %esp
        movl 8(%edi,%esi,4), %esi
      push %esi
      # Load "this" pointer
      movl 8(%esp), %esi
      sub $12, %esp
      push %esi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%esi), %esi
      movl 12(%esi), %esi
      call *%esi
      add $20, %esp
      movl %eax, %esi
    # Emitting i = (i + 1)
      # Emitting (i + 1)
        # Emitting i
        movl -24(%ebp), %esi
        # Emitting 1
        movl $1, %edi
      addl %edi, %esi
    movl %esi, -24(%ebp)
  # Exit to block 2
  jmp label81
# __Basic block 4_____________________________________________________
label83:
    # Emitting tree.printKeys(...)
      # Emitting tree.printKeys(...)
        # Emitting tree
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
  # Exit to block 1
  jmp label80
label84:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Main.cellTest______________________________________________
  .globl Main_cellTest
Main_cellTest:
  # Variable     Offset
  # factory      -12
  # c            -16
  # normalCells   -20
  # tree         -24
  # i            -28
  # mixedCells   -32
  # implicit=8 localSlot=36 sum=44
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
  movl $0, -32(%ebp)
  jmp label85
# __Basic block 0_____________________________________________________
label85:
    # Emitting this.checkpoint(...)
      # Emitting this.checkpoint(...)
        # Emitting this
        movl 16(%ebp), %edi
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
    # Emitting factory = new BinaryTreeFactory()
      # Emitting new BinaryTreeFactory()
      push $4
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_BinaryTreeFactory, 0(%edi)
    movl %edi, -12(%ebp)
    # Emitting normalCells = new Object[][size]
      # Emitting new Object[][size]
        # Emitting size
        movl 8(%ebp), %edi
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
      movl $vtablearr_Object, 0(%edi)
      movl %esi, 4(%edi)
    movl %edi, -20(%ebp)
    # Emitting mixedCells = new Object[][size]
      # Emitting new Object[][size]
        # Emitting size
        movl 8(%ebp), %edi
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
      movl $vtablearr_Object, 0(%edi)
      movl %esi, 4(%edi)
    movl %edi, -32(%ebp)
  # Exit to block 2
  jmp label87
# __Basic block 1_____________________________________________________
label86:
  # Return
  jmp label93
# __Basic block 2_____________________________________________________
label87:
  # Exit to block 3 if true, block 4 if false
    # Emitting (i < size)
      # Emitting i
      movl -28(%ebp), %edi
      # Emitting size
      movl 8(%ebp), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label89
  jmp label88
# __Basic block 3_____________________________________________________
label88:
    # Emitting c = new Cell()
      # Emitting new Cell()
      push $8
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_Cell, 0(%edi)
    movl %edi, -16(%ebp)
    # Emitting c.k = input[i]
      # Emitting input[i]
        # Emitting input
        movl 12(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
        # Emitting i
        movl -28(%ebp), %esi
      sub $12, %esp
      push %esi
      push %edi
      call Javali$CheckArrayBounds
      add $20, %esp
      movl 8(%edi,%esi,4), %esi
      # Emitting c
      movl -16(%ebp), %edi
    push %edi
    call Javali$CheckNull
    add $4, %esp
    movl %esi, 4(%edi)
    # Emitting normalCells[i] = (Object)(c)
      # Emitting (Object)(c)
        # Emitting c
        movl -16(%ebp), %esi
      sub $12, %esp
      push %esi
      push $vtable_Object
      call Javali$CheckCast
      add $20, %esp
      # Emitting normalCells
      movl -20(%ebp), %edi
    push %edi
    call Javali$CheckNull
    add $4, %esp
      # Emitting i
      movl -28(%ebp), %edx
    push %edx
    sub $8, %esp
    push %edx
    push %edi
    call Javali$CheckArrayBounds
    add $16, %esp
    pop %edx
    movl %esi, 8(%edi,%edx,4)
    # Emitting i = (i + 1)
      # Emitting (i + 1)
        # Emitting i
        movl -28(%ebp), %esi
        # Emitting 1
        movl $1, %edx
      addl %edx, %esi
    movl %esi, -28(%ebp)
  # Exit to block 2
  jmp label87
# __Basic block 4_____________________________________________________
label89:
    # Emitting this.checkpoint(...)
      # Emitting this.checkpoint(...)
        # Emitting this
        movl 16(%ebp), %esi
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
    # Emitting tree = factory.fromArray(...)
      # Emitting factory.fromArray(...)
      sub $8, %esp
        # Emitting factory
        movl -12(%ebp), %esi
      push %esi
        # Emitting normalCells
        movl -20(%ebp), %esi
      push %esi
        # Emitting size
        movl 8(%ebp), %esi
      push %esi
      # Load "this" pointer
      movl 8(%esp), %esi
      sub $12, %esp
      push %esi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%esi), %esi
      movl 8(%esi), %esi
      call *%esi
      add $20, %esp
      movl %eax, %esi
    movl %esi, -24(%ebp)
    # Emitting tree.printKeys(...)
      # Emitting tree.printKeys(...)
        # Emitting tree
        movl -24(%ebp), %esi
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
    # Emitting i = -(2)
      # Emitting -(2)
        # Emitting 2
        movl $2, %esi
      negl %esi
    movl %esi, -28(%ebp)
  # Exit to block 5
  jmp label90
# __Basic block 5_____________________________________________________
label90:
  # Exit to block 6 if true, block 7 if false
    # Emitting (i < (size + 2))
      # Emitting i
      movl -28(%ebp), %esi
      # Emitting (size + 2)
        # Emitting size
        movl 8(%ebp), %edx
        # Emitting 2
        movl $2, %edi
      addl %edi, %edx
    cmpl %edx, %esi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %esi
    pop %eax
  cmpl $0, %esi
  je label92
  jmp label91
# __Basic block 6_____________________________________________________
label91:
    # Emitting write(c.k)
      # Emitting c.k
        # Emitting c
        movl -16(%ebp), %esi
      push %esi
      call Javali$CheckNull
      add $4, %esp
      movl 4(%esi), %esi
    push %esi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting i = (i + 1)
      # Emitting (i + 1)
        # Emitting i
        movl -28(%ebp), %esi
        # Emitting 1
        movl $1, %edx
      addl %edx, %esi
    movl %esi, -28(%ebp)
  # Exit to block 5
  jmp label90
# __Basic block 7_____________________________________________________
label92:
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
    # Emitting this.checkpoint(...)
      # Emitting this.checkpoint(...)
        # Emitting this
        movl 16(%ebp), %esi
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
    # Emitting i = 0
      # Emitting 0
      movl $0, %esi
    movl %esi, -28(%ebp)
  # Exit to block 1
  jmp label86
label93:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
# Class NegativeCell__________________________________________________
  # 
  .section .text
# __Method NegativeCell.print_________________________________________
  .globl NegativeCell_print
NegativeCell_print:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label94
# __Basic block 0_____________________________________________________
label94:
    # Emitting write(-(this.k))
      # Emitting -(this.k)
        # Emitting this.k
          # Emitting this
          movl 8(%ebp), %edi
        push %edi
        call Javali$CheckNull
        add $4, %esp
        movl 4(%edi), %edi
      negl %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
  # Exit to block 1
  jmp label95
# __Basic block 1_____________________________________________________
label95:
  # Return
  jmp label96
label96:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
# Class ReadToClearCell_______________________________________________
  # 
  .section .text
# __Method ReadToClearCell.print______________________________________
  .globl ReadToClearCell_print
ReadToClearCell_print:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label97
# __Basic block 0_____________________________________________________
label97:
    # Emitting write(this.k)
      # Emitting this.k
        # Emitting this
        movl 8(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 4(%edi), %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting this.k = 0
      # Emitting 0
      movl $0, %edi
      # Emitting this
      movl 8(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 4(%esi)
  # Exit to block 1
  jmp label98
# __Basic block 1_____________________________________________________
label98:
  # Return
  jmp label99
label99:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
