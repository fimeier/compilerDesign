vtable_ReductionLambda:
.int vtable_Object
.int ReductionLambda_apply
vtablearr_Random:
.int vtable_Object
vtablearr_NothingReduction:
.int vtable_Object
vtablearr_PrintBothAction:
.int vtable_Object
vtablearr_PrintValueAction:
.int vtable_Object
vtable_Node:
.int vtable_Object
.int Node_add
.int Node_getKey
.int Node_getValue
.int Node_runPostOrder
.int Node_compare
.int Node_getRight
.int Node_Node
.int Node_runInOrder
.int Node_runPreOrder
.int Node_getLeft
vtablearr_PrintKeyAction:
.int vtable_Object
vtablearr_DepthReduction:
.int vtable_Object
vtable_PrintBothAction:
.int vtable_ActionLambda
.int PrintBothAction_apply
vtable_ActionLambda:
.int vtable_Object
.int ActionLambda_apply
vtable_PrintValueAction:
.int vtable_ActionLambda
.int PrintValueAction_apply
vtablearr_Greater:
.int vtable_Object
vtable_Random:
.int vtable_Object
.int Random_next
.int Random_Random
vtablearr_CmpLambda:
.int vtable_Object
vtablearr_Main:
.int vtable_Object
vtable_Tree:
.int vtable_Object
.int Tree_add
.int Tree_prepareCountLambdas
.int Tree_printPreOrder
.int Tree_getDepth
.int Tree_prepareDepthLambdas
.int Tree_printInOrder
.int Tree_Tree
.int Tree_getCount
.int Tree_printPostOrder
.int Tree_preparePrintLambdas
vtable_DepthReduction:
.int vtable_ReductionLambda
.int DepthReduction_apply
vtable_Less:
.int vtable_CmpLambda
.int Less_apply
vtable_CountReduction:
.int vtable_ReductionLambda
.int CountReduction_apply
vtablearr_void:
.int vtable_Object
vtablearr_Node:
.int vtable_Object
vtable_CountAction:
.int vtable_ActionLambda
.int CountAction_apply
vtablearr_CountReduction:
.int vtable_Object
vtablearr_int:
.int vtable_Object
vtablearr_CountAction:
.int vtable_Object
vtablearr_Tree:
.int vtable_Object
vtablearr_ActionLambda:
.int vtable_Object
vtablearr_Less:
.int vtable_Object
vtable_CmpLambda:
.int vtable_Object
.int CmpLambda_apply
vtable_PrintKeyAction:
.int vtable_ActionLambda
.int PrintKeyAction_apply
vtablearr_DepthAction:
.int vtable_Object
vtablearr_ReductionLambda:
.int vtable_Object
vtable_DepthAction:
.int vtable_ActionLambda
.int DepthAction_apply
vtable_NothingReduction:
.int vtable_ReductionLambda
.int ReductionLambda_apply
vtable_Object:
.int 0
vtable_Greater:
.int vtable_CmpLambda
.int Greater_apply
vtablearr_boolean:
.int vtable_Object
vtable_Main:
.int vtable_Object
.int Main_init
.int Main_print
.int Main_main
.int Main_fill
vtablearr_Object:
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
    movl 12(%edi), %edi
    call *%edi
    add $16, %esp
    movl %eax, %edi
movl $0, %eax
leave
ret
# Class ActionLambda__________________________________________________
  # 
  .section .text
# __Method ActionLambda.apply_________________________________________
  .globl ActionLambda_apply
ActionLambda_apply:
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
# Class CmpLambda_____________________________________________________
  # 
  .section .text
# __Method CmpLambda.apply____________________________________________
  .globl CmpLambda_apply
CmpLambda_apply:
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
# Class CountAction___________________________________________________
  # 
  .section .text
# __Method CountAction.apply__________________________________________
  .globl CountAction_apply
CountAction_apply:
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
# Class CountReduction________________________________________________
  # 
  .section .text
# __Method CountReduction.apply_______________________________________
  .globl CountReduction_apply
CountReduction_apply:
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
    # Emitting return ((leftReturn + myReturn) + rightReturn)
      # Emitting ((leftReturn + myReturn) + rightReturn)
        # Emitting (leftReturn + myReturn)
          # Emitting leftReturn
          movl 16(%ebp), %edi
          # Emitting myReturn
          movl 12(%ebp), %esi
        addl %esi, %edi
        # Emitting rightReturn
        movl 8(%ebp), %esi
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
# Class DepthAction___________________________________________________
  # 
  .section .text
# __Method DepthAction.apply__________________________________________
  .globl DepthAction_apply
DepthAction_apply:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label19
# __Basic block 0_____________________________________________________
label19:
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
# Class DepthReduction________________________________________________
  # 
  .section .text
# __Method DepthReduction.apply_______________________________________
  .globl DepthReduction_apply
DepthReduction_apply:
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
    # Emitting (leftReturn > rightReturn)
      # Emitting leftReturn
      movl 16(%ebp), %edi
      # Emitting rightReturn
      movl 8(%ebp), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setg %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label25
  jmp label24
# __Basic block 1_____________________________________________________
label23:
  # Return
  jmp label26
# __Basic block 2_____________________________________________________
label24:
    # Emitting return (leftReturn + myReturn)
      # Emitting (leftReturn + myReturn)
        # Emitting leftReturn
        movl 16(%ebp), %edi
        # Emitting myReturn
        movl 12(%ebp), %esi
      addl %esi, %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label23
# __Basic block 3_____________________________________________________
label25:
    # Emitting return (rightReturn + myReturn)
      # Emitting (rightReturn + myReturn)
        # Emitting rightReturn
        movl 8(%ebp), %edi
        # Emitting myReturn
        movl 12(%ebp), %esi
      addl %esi, %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label23
label26:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
# Class Greater_______________________________________________________
  # 
  .section .text
# __Method Greater.apply______________________________________________
  .globl Greater_apply
Greater_apply:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label27
# __Basic block 0_____________________________________________________
label27:
  # Exit to block 2 if true, block 3 if false
    # Emitting (a > b)
      # Emitting a
      movl 12(%ebp), %edi
      # Emitting b
      movl 8(%ebp), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setg %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label30
  jmp label29
# __Basic block 1_____________________________________________________
label28:
  # Return
  jmp label35
# __Basic block 2_____________________________________________________
label29:
    # Emitting return -(1)
      # Emitting -(1)
        # Emitting 1
        movl $1, %edi
      negl %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label28
# __Basic block 3_____________________________________________________
label30:
    # Emitting nop
  # Exit to block 4
  jmp label31
# __Basic block 4_____________________________________________________
label31:
  # Exit to block 5 if true, block 6 if false
    # Emitting (a < b)
      # Emitting a
      movl 12(%ebp), %edi
      # Emitting b
      movl 8(%ebp), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label33
  jmp label32
# __Basic block 5_____________________________________________________
label32:
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
  jmp label28
# __Basic block 6_____________________________________________________
label33:
    # Emitting nop
  # Exit to block 7
  jmp label34
# __Basic block 7_____________________________________________________
label34:
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
  jmp label28
label35:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
# Class Less__________________________________________________________
  # 
  .section .text
# __Method Less.apply_________________________________________________
  .globl Less_apply
Less_apply:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label36
# __Basic block 0_____________________________________________________
label36:
  # Exit to block 2 if true, block 3 if false
    # Emitting (a < b)
      # Emitting a
      movl 12(%ebp), %edi
      # Emitting b
      movl 8(%ebp), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label39
  jmp label38
# __Basic block 1_____________________________________________________
label37:
  # Return
  jmp label44
# __Basic block 2_____________________________________________________
label38:
    # Emitting return -(1)
      # Emitting -(1)
        # Emitting 1
        movl $1, %edi
      negl %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label37
# __Basic block 3_____________________________________________________
label39:
    # Emitting nop
  # Exit to block 4
  jmp label40
# __Basic block 4_____________________________________________________
label40:
  # Exit to block 5 if true, block 6 if false
    # Emitting (a > b)
      # Emitting a
      movl 12(%ebp), %edi
      # Emitting b
      movl 8(%ebp), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setg %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label42
  jmp label41
# __Basic block 5_____________________________________________________
label41:
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
  jmp label37
# __Basic block 6_____________________________________________________
label42:
    # Emitting nop
  # Exit to block 7
  jmp label43
# __Basic block 7_____________________________________________________
label43:
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
  jmp label37
label44:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
# Class Main__________________________________________________________
  # 
  .section .text
# __Method Main.init__________________________________________________
  .globl Main_init
Main_init:
  # Variable     Offset
  # cmpOp        -12
  # implicit=8 localSlot=16 sum=24
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  jmp label45
# __Basic block 0_____________________________________________________
label45:
    # Emitting this.r = new Random()
      # Emitting new Random()
      push $20
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_Random, 0(%edi)
      # Emitting this
      movl 8(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 4(%esi)
    # Emitting this.r.Random(...)
      # Emitting this.r.Random(...)
      sub $12, %esp
        # Emitting this.r
          # Emitting this
          movl 8(%ebp), %edi
        sub $4, %esp
        push %edi
        call Javali$CheckNull
        add $8, %esp
        movl 4(%edi), %edi
      push %edi
        # Emitting 42
        movl $42, %edi
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
    # Emitting cmpOp = new Less()
      # Emitting new Less()
      push $4
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_Less, 0(%edi)
    movl %edi, -12(%ebp)
    # Emitting this.t1 = new Tree()
      # Emitting new Tree()
      push $44
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_Tree, 0(%edi)
      # Emitting this
      movl 8(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 8(%esi)
    # Emitting this.t1.Tree(...)
      # Emitting this.t1.Tree(...)
      sub $12, %esp
        # Emitting this.t1
          # Emitting this
          movl 8(%ebp), %edi
        sub $4, %esp
        push %edi
        call Javali$CheckNull
        add $8, %esp
        movl 8(%edi), %edi
      push %edi
        # Emitting cmpOp
        movl -12(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 4(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 28(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
    # Emitting cmpOp = new Greater()
      # Emitting new Greater()
      push $4
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_Greater, 0(%edi)
    movl %edi, -12(%ebp)
    # Emitting this.t2 = new Tree()
      # Emitting new Tree()
      push $44
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_Tree, 0(%edi)
      # Emitting this
      movl 8(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 12(%esi)
    # Emitting this.t2.Tree(...)
      # Emitting this.t2.Tree(...)
      sub $12, %esp
        # Emitting this.t2
          # Emitting this
          movl 8(%ebp), %edi
        sub $4, %esp
        push %edi
        call Javali$CheckNull
        add $8, %esp
        movl 12(%edi), %edi
      push %edi
        # Emitting cmpOp
        movl -12(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 4(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 28(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
  # Exit to block 1
  jmp label46
# __Basic block 1_____________________________________________________
label46:
  # Return
  jmp label47
label47:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Main.fill__________________________________________________
  .globl Main_fill
Main_fill:
  # Variable     Offset
  # i            -12
  # value        -16
  # key          -20
  # implicit=8 localSlot=24 sum=32
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  movl $0, -20(%ebp)
  jmp label48
# __Basic block 0_____________________________________________________
label48:
    # Emitting i = 0
      # Emitting 0
      movl $0, %edi
    movl %edi, -12(%ebp)
  # Exit to block 2
  jmp label50
# __Basic block 1_____________________________________________________
label49:
  # Return
  jmp label53
# __Basic block 2_____________________________________________________
label50:
  # Exit to block 3 if true, block 4 if false
    # Emitting (i < n)
      # Emitting i
      movl -12(%ebp), %edi
      # Emitting n
      movl 8(%ebp), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label52
  jmp label51
# __Basic block 3_____________________________________________________
label51:
    # Emitting key = this.r.next(...)
      # Emitting this.r.next(...)
        # Emitting this.r
          # Emitting this
          movl 16(%ebp), %edi
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
    movl %edi, -20(%ebp)
    # Emitting value = key
      # Emitting key
      movl -20(%ebp), %edi
    movl %edi, -16(%ebp)
    # Emitting t.add(...)
      # Emitting t.add(...)
      sub $8, %esp
        # Emitting t
        movl 12(%ebp), %edi
      push %edi
        # Emitting key
        movl -20(%ebp), %edi
      push %edi
        # Emitting value
        movl -16(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 8(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 4(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
    # Emitting i = (i + 1)
      # Emitting (i + 1)
        # Emitting i
        movl -12(%ebp), %edi
        # Emitting 1
        movl $1, %esi
      addl %esi, %edi
    movl %edi, -12(%ebp)
  # Exit to block 2
  jmp label50
# __Basic block 4_____________________________________________________
label52:
  # Exit to block 1
  jmp label49
label53:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Main.print_________________________________________________
  .globl Main_print
Main_print:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label54
# __Basic block 0_____________________________________________________
label54:
    # Emitting write(t.getCount(...))
      # Emitting t.getCount(...)
        # Emitting t
        movl 8(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 0(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 32(%edi), %edi
      call *%edi
      add $4, %esp
      movl %eax, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
    # Emitting write(t.getDepth(...))
      # Emitting t.getDepth(...)
        # Emitting t
        movl 8(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 0(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 16(%edi), %edi
      call *%edi
      add $4, %esp
      movl %eax, %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
    # Emitting t.printInOrder(...)
      # Emitting t.printInOrder(...)
      sub $12, %esp
        # Emitting t
        movl 8(%ebp), %edi
      push %edi
        # Emitting 1
        movl $1, %edi
      push %edi
      # Load "this" pointer
      movl 4(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 24(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
  # Exit to block 1
  jmp label55
# __Basic block 1_____________________________________________________
label55:
  # Return
  jmp label56
label56:
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
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label57
# __Basic block 0_____________________________________________________
label57:
    # Emitting this.init(...)
      # Emitting this.init(...)
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
    # Emitting this.fill(...)
      # Emitting this.fill(...)
      sub $8, %esp
        # Emitting this
        movl 8(%ebp), %edi
      push %edi
        # Emitting this.t1
          # Emitting this
          movl 8(%ebp), %edi
        sub $4, %esp
        push %edi
        call Javali$CheckNull
        add $8, %esp
        movl 8(%edi), %edi
      push %edi
        # Emitting 100
        movl $100, %edi
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
    # Emitting this.fill(...)
      # Emitting this.fill(...)
      sub $8, %esp
        # Emitting this
        movl 8(%ebp), %edi
      push %edi
        # Emitting this.t2
          # Emitting this
          movl 8(%ebp), %edi
        sub $4, %esp
        push %edi
        call Javali$CheckNull
        add $8, %esp
        movl 12(%edi), %edi
      push %edi
        # Emitting 100
        movl $100, %edi
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
    # Emitting this.print(...)
      # Emitting this.print(...)
      sub $12, %esp
        # Emitting this
        movl 8(%ebp), %edi
      push %edi
        # Emitting this.t1
          # Emitting this
          movl 8(%ebp), %edi
        push %edi
        call Javali$CheckNull
        add $4, %esp
        movl 8(%edi), %edi
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
    # Emitting this.print(...)
      # Emitting this.print(...)
      sub $12, %esp
        # Emitting this
        movl 8(%ebp), %edi
      push %edi
        # Emitting this.t2
          # Emitting this
          movl 8(%ebp), %edi
        push %edi
        call Javali$CheckNull
        add $4, %esp
        movl 12(%edi), %edi
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
  # Exit to block 1
  jmp label58
# __Basic block 1_____________________________________________________
label58:
  # Return
  jmp label59
label59:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
# Class Node__________________________________________________________
  # 
  .section .text
# __Method Node.Node__________________________________________________
  .globl Node_Node
Node_Node:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label60
# __Basic block 0_____________________________________________________
label60:
    # Emitting this.cmpOp = cmpOp
      # Emitting cmpOp
      movl 16(%ebp), %edi
      # Emitting this
      movl 20(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 4(%esi)
    # Emitting this.left = null
      # Emitting null
      movl $0, %edi
      # Emitting this
      movl 20(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 8(%esi)
    # Emitting this.right = null
      # Emitting null
      movl $0, %edi
      # Emitting this
      movl 20(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 12(%esi)
    # Emitting this.key = key
      # Emitting key
      movl 12(%ebp), %edi
      # Emitting this
      movl 20(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 20(%esi)
    # Emitting this.value = value
      # Emitting value
      movl 8(%ebp), %edi
      # Emitting this
      movl 20(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 16(%esi)
  # Exit to block 1
  jmp label61
# __Basic block 1_____________________________________________________
label61:
  # Return
  jmp label62
label62:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Node.add___________________________________________________
  .globl Node_add
Node_add:
  # Variable     Offset
  # cmp          -12
  # implicit=8 localSlot=16 sum=24
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  jmp label63
# __Basic block 0_____________________________________________________
label63:
    # Emitting cmp = n.compare(...)
      # Emitting n.compare(...)
      sub $12, %esp
        # Emitting n
        movl 8(%ebp), %edi
      push %edi
        # Emitting this
        movl 12(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 4(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 20(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
    movl %edi, -12(%ebp)
  # Exit to block 2 if true, block 3 if false
    # Emitting (cmp == 0)
      # Emitting cmp
      movl -12(%ebp), %edi
      # Emitting 0
      movl $0, %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    sete %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label66
  jmp label65
# __Basic block 1_____________________________________________________
label64:
  # Return
  jmp label77
# __Basic block 2_____________________________________________________
label65:
    # Emitting this.value = n.getValue(...)
      # Emitting n.getValue(...)
        # Emitting n
        movl 8(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 0(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 12(%edi), %edi
      call *%edi
      add $4, %esp
      movl %eax, %edi
      # Emitting this
      movl 12(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 16(%esi)
    # Emitting return
    movl $0, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label64
# __Basic block 3_____________________________________________________
label66:
    # Emitting nop
  # Exit to block 4
  jmp label67
# __Basic block 4_____________________________________________________
label67:
  # Exit to block 5 if true, block 6 if false
    # Emitting (cmp < 0)
      # Emitting cmp
      movl -12(%ebp), %edi
      # Emitting 0
      movl $0, %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label69
  jmp label68
# __Basic block 5_____________________________________________________
label68:
  # Exit to block 7 if true, block 8 if false
    # Emitting (this.left == null)
      # Emitting this.left
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
  cmpl $0, %edi
  je label71
  jmp label70
# __Basic block 6_____________________________________________________
label69:
  # Exit to block 10 if true, block 11 if false
    # Emitting (this.right == null)
      # Emitting this.right
        # Emitting this
        movl 12(%ebp), %edi
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
  je label74
  jmp label73
# __Basic block 7_____________________________________________________
label70:
    # Emitting this.left = n
      # Emitting n
      movl 8(%ebp), %edi
      # Emitting this
      movl 12(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 8(%esi)
  # Exit to block 9
  jmp label72
# __Basic block 8_____________________________________________________
label71:
    # Emitting this.left.add(...)
      # Emitting this.left.add(...)
      sub $12, %esp
        # Emitting this.left
          # Emitting this
          movl 12(%ebp), %edi
        sub $4, %esp
        push %edi
        call Javali$CheckNull
        add $8, %esp
        movl 8(%edi), %edi
      push %edi
        # Emitting n
        movl 8(%ebp), %edi
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
  # Exit to block 9
  jmp label72
# __Basic block 9_____________________________________________________
label72:
  # Exit to block 13
  jmp label76
# __Basic block 10____________________________________________________
label73:
    # Emitting this.right = n
      # Emitting n
      movl 8(%ebp), %edi
      # Emitting this
      movl 12(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 12(%esi)
  # Exit to block 12
  jmp label75
# __Basic block 11____________________________________________________
label74:
    # Emitting this.right.add(...)
      # Emitting this.right.add(...)
      sub $12, %esp
        # Emitting this.right
          # Emitting this
          movl 12(%ebp), %edi
        sub $4, %esp
        push %edi
        call Javali$CheckNull
        add $8, %esp
        movl 12(%edi), %edi
      push %edi
        # Emitting n
        movl 8(%ebp), %edi
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
  # Exit to block 12
  jmp label75
# __Basic block 12____________________________________________________
label75:
  # Exit to block 13
  jmp label76
# __Basic block 13____________________________________________________
label76:
  # Exit to block 1
  jmp label64
label77:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Node.getLeft_______________________________________________
  .globl Node_getLeft
Node_getLeft:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label78
# __Basic block 0_____________________________________________________
label78:
    # Emitting return this.left
      # Emitting this.left
        # Emitting this
        movl 8(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 8(%edi), %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label79
# __Basic block 1_____________________________________________________
label79:
  # Return
  jmp label80
label80:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Node.getRight______________________________________________
  .globl Node_getRight
Node_getRight:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label81
# __Basic block 0_____________________________________________________
label81:
    # Emitting return this.right
      # Emitting this.right
        # Emitting this
        movl 8(%ebp), %edi
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
  jmp label82
# __Basic block 1_____________________________________________________
label82:
  # Return
  jmp label83
label83:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Node.compare_______________________________________________
  .globl Node_compare
Node_compare:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label84
# __Basic block 0_____________________________________________________
label84:
    # Emitting return this.cmpOp.apply(...)
      # Emitting this.cmpOp.apply(...)
      sub $8, %esp
        # Emitting this.cmpOp
          # Emitting this
          movl 12(%ebp), %edi
        sub $8, %esp
        push %edi
        call Javali$CheckNull
        add $12, %esp
        movl 4(%edi), %edi
      push %edi
        # Emitting this.key
          # Emitting this
          movl 12(%ebp), %edi
        sub $4, %esp
        push %edi
        call Javali$CheckNull
        add $8, %esp
        movl 20(%edi), %edi
      push %edi
        # Emitting other.getKey(...)
          # Emitting other
          movl 8(%ebp), %edi
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
        add $4, %esp
        movl %eax, %edi
      push %edi
      # Load "this" pointer
      movl 8(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 4(%edi), %edi
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
  jmp label85
# __Basic block 1_____________________________________________________
label85:
  # Return
  jmp label86
label86:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Node.getKey________________________________________________
  .globl Node_getKey
Node_getKey:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label87
# __Basic block 0_____________________________________________________
label87:
    # Emitting return this.key
      # Emitting this.key
        # Emitting this
        movl 8(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 20(%edi), %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label88
# __Basic block 1_____________________________________________________
label88:
  # Return
  jmp label89
label89:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Node.getValue______________________________________________
  .globl Node_getValue
Node_getValue:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label90
# __Basic block 0_____________________________________________________
label90:
    # Emitting return this.value
      # Emitting this.value
        # Emitting this
        movl 8(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 16(%edi), %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label91
# __Basic block 1_____________________________________________________
label91:
  # Return
  jmp label92
label92:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Node.runPreOrder___________________________________________
  .globl Node_runPreOrder
Node_runPreOrder:
  # Variable     Offset
  # r            -12
  # l            -16
  # m            -20
  # implicit=8 localSlot=24 sum=32
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  movl $0, -20(%ebp)
  jmp label93
# __Basic block 0_____________________________________________________
label93:
    # Emitting m = action.apply(...)
      # Emitting action.apply(...)
      sub $8, %esp
        # Emitting action
        movl 12(%ebp), %edi
      push %edi
        # Emitting this.key
          # Emitting this
          movl 16(%ebp), %edi
        sub $4, %esp
        push %edi
        call Javali$CheckNull
        add $8, %esp
        movl 20(%edi), %edi
      push %edi
        # Emitting this.value
          # Emitting this
          movl 16(%ebp), %edi
        push %edi
        call Javali$CheckNull
        add $4, %esp
        movl 16(%edi), %edi
      push %edi
      # Load "this" pointer
      movl 8(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 4(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
    movl %edi, -20(%ebp)
  # Exit to block 2 if true, block 3 if false
    # Emitting (this.left != null)
      # Emitting this.left
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
    setne %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label96
  jmp label95
# __Basic block 1_____________________________________________________
label94:
  # Return
  jmp label101
# __Basic block 2_____________________________________________________
label95:
    # Emitting l = this.left.runPreOrder(...)
      # Emitting this.left.runPreOrder(...)
      sub $8, %esp
        # Emitting this.left
          # Emitting this
          movl 16(%ebp), %edi
        sub $8, %esp
        push %edi
        call Javali$CheckNull
        add $12, %esp
        movl 8(%edi), %edi
      push %edi
        # Emitting action
        movl 12(%ebp), %edi
      push %edi
        # Emitting reduce
        movl 8(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 8(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 36(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
    movl %edi, -16(%ebp)
  # Exit to block 4
  jmp label97
# __Basic block 3_____________________________________________________
label96:
    # Emitting l = 0
      # Emitting 0
      movl $0, %edi
    movl %edi, -16(%ebp)
  # Exit to block 4
  jmp label97
# __Basic block 4_____________________________________________________
label97:
  # Exit to block 5 if true, block 6 if false
    # Emitting (this.right != null)
      # Emitting this.right
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
    setne %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label99
  jmp label98
# __Basic block 5_____________________________________________________
label98:
    # Emitting r = this.right.runPreOrder(...)
      # Emitting this.right.runPreOrder(...)
      sub $8, %esp
        # Emitting this.right
          # Emitting this
          movl 16(%ebp), %edi
        sub $8, %esp
        push %edi
        call Javali$CheckNull
        add $12, %esp
        movl 12(%edi), %edi
      push %edi
        # Emitting action
        movl 12(%ebp), %edi
      push %edi
        # Emitting reduce
        movl 8(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 8(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 36(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
    movl %edi, -12(%ebp)
  # Exit to block 7
  jmp label100
# __Basic block 6_____________________________________________________
label99:
    # Emitting r = 0
      # Emitting 0
      movl $0, %edi
    movl %edi, -12(%ebp)
  # Exit to block 7
  jmp label100
# __Basic block 7_____________________________________________________
label100:
    # Emitting return reduce.apply(...)
      # Emitting reduce.apply(...)
      sub $4, %esp
        # Emitting reduce
        movl 8(%ebp), %edi
      push %edi
        # Emitting l
        movl -16(%ebp), %edi
      push %edi
        # Emitting m
        movl -20(%ebp), %edi
      push %edi
        # Emitting r
        movl -12(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 12(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 4(%edi), %edi
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
  jmp label94
label101:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Node.runInOrder____________________________________________
  .globl Node_runInOrder
Node_runInOrder:
  # Variable     Offset
  # r            -12
  # l            -16
  # m            -20
  # implicit=8 localSlot=24 sum=32
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  movl $0, -20(%ebp)
  jmp label102
# __Basic block 0_____________________________________________________
label102:
  # Exit to block 2 if true, block 3 if false
    # Emitting (this.left != null)
      # Emitting this.left
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
    setne %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label105
  jmp label104
# __Basic block 1_____________________________________________________
label103:
  # Return
  jmp label110
# __Basic block 2_____________________________________________________
label104:
    # Emitting l = this.left.runInOrder(...)
      # Emitting this.left.runInOrder(...)
      sub $8, %esp
        # Emitting this.left
          # Emitting this
          movl 16(%ebp), %edi
        sub $8, %esp
        push %edi
        call Javali$CheckNull
        add $12, %esp
        movl 8(%edi), %edi
      push %edi
        # Emitting action
        movl 12(%ebp), %edi
      push %edi
        # Emitting reduce
        movl 8(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 8(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 32(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
    movl %edi, -16(%ebp)
  # Exit to block 4
  jmp label106
# __Basic block 3_____________________________________________________
label105:
    # Emitting l = 0
      # Emitting 0
      movl $0, %edi
    movl %edi, -16(%ebp)
  # Exit to block 4
  jmp label106
# __Basic block 4_____________________________________________________
label106:
    # Emitting m = action.apply(...)
      # Emitting action.apply(...)
      sub $8, %esp
        # Emitting action
        movl 12(%ebp), %edi
      push %edi
        # Emitting this.key
          # Emitting this
          movl 16(%ebp), %edi
        sub $4, %esp
        push %edi
        call Javali$CheckNull
        add $8, %esp
        movl 20(%edi), %edi
      push %edi
        # Emitting this.value
          # Emitting this
          movl 16(%ebp), %edi
        push %edi
        call Javali$CheckNull
        add $4, %esp
        movl 16(%edi), %edi
      push %edi
      # Load "this" pointer
      movl 8(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 4(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
    movl %edi, -20(%ebp)
  # Exit to block 5 if true, block 6 if false
    # Emitting (this.right != null)
      # Emitting this.right
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
    setne %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label108
  jmp label107
# __Basic block 5_____________________________________________________
label107:
    # Emitting r = this.right.runInOrder(...)
      # Emitting this.right.runInOrder(...)
      sub $8, %esp
        # Emitting this.right
          # Emitting this
          movl 16(%ebp), %edi
        sub $8, %esp
        push %edi
        call Javali$CheckNull
        add $12, %esp
        movl 12(%edi), %edi
      push %edi
        # Emitting action
        movl 12(%ebp), %edi
      push %edi
        # Emitting reduce
        movl 8(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 8(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 32(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
    movl %edi, -12(%ebp)
  # Exit to block 7
  jmp label109
# __Basic block 6_____________________________________________________
label108:
    # Emitting r = 0
      # Emitting 0
      movl $0, %edi
    movl %edi, -12(%ebp)
  # Exit to block 7
  jmp label109
# __Basic block 7_____________________________________________________
label109:
    # Emitting return reduce.apply(...)
      # Emitting reduce.apply(...)
      sub $4, %esp
        # Emitting reduce
        movl 8(%ebp), %edi
      push %edi
        # Emitting l
        movl -16(%ebp), %edi
      push %edi
        # Emitting m
        movl -20(%ebp), %edi
      push %edi
        # Emitting r
        movl -12(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 12(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 4(%edi), %edi
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
  jmp label103
label110:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Node.runPostOrder__________________________________________
  .globl Node_runPostOrder
Node_runPostOrder:
  # Variable     Offset
  # r            -12
  # l            -16
  # m            -20
  # implicit=8 localSlot=24 sum=32
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  movl $0, -20(%ebp)
  jmp label111
# __Basic block 0_____________________________________________________
label111:
  # Exit to block 2 if true, block 3 if false
    # Emitting (this.left != null)
      # Emitting this.left
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
    setne %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label114
  jmp label113
# __Basic block 1_____________________________________________________
label112:
  # Return
  jmp label119
# __Basic block 2_____________________________________________________
label113:
    # Emitting l = this.left.runPreOrder(...)
      # Emitting this.left.runPreOrder(...)
      sub $8, %esp
        # Emitting this.left
          # Emitting this
          movl 16(%ebp), %edi
        sub $8, %esp
        push %edi
        call Javali$CheckNull
        add $12, %esp
        movl 8(%edi), %edi
      push %edi
        # Emitting action
        movl 12(%ebp), %edi
      push %edi
        # Emitting reduce
        movl 8(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 8(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 36(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
    movl %edi, -16(%ebp)
  # Exit to block 4
  jmp label115
# __Basic block 3_____________________________________________________
label114:
    # Emitting l = 0
      # Emitting 0
      movl $0, %edi
    movl %edi, -16(%ebp)
  # Exit to block 4
  jmp label115
# __Basic block 4_____________________________________________________
label115:
  # Exit to block 5 if true, block 6 if false
    # Emitting (this.right != null)
      # Emitting this.right
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
    setne %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label117
  jmp label116
# __Basic block 5_____________________________________________________
label116:
    # Emitting r = this.right.runPreOrder(...)
      # Emitting this.right.runPreOrder(...)
      sub $8, %esp
        # Emitting this.right
          # Emitting this
          movl 16(%ebp), %edi
        sub $8, %esp
        push %edi
        call Javali$CheckNull
        add $12, %esp
        movl 12(%edi), %edi
      push %edi
        # Emitting action
        movl 12(%ebp), %edi
      push %edi
        # Emitting reduce
        movl 8(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 8(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 36(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
    movl %edi, -12(%ebp)
  # Exit to block 7
  jmp label118
# __Basic block 6_____________________________________________________
label117:
    # Emitting r = 0
      # Emitting 0
      movl $0, %edi
    movl %edi, -12(%ebp)
  # Exit to block 7
  jmp label118
# __Basic block 7_____________________________________________________
label118:
    # Emitting m = action.apply(...)
      # Emitting action.apply(...)
      sub $8, %esp
        # Emitting action
        movl 12(%ebp), %edi
      push %edi
        # Emitting this.key
          # Emitting this
          movl 16(%ebp), %edi
        sub $4, %esp
        push %edi
        call Javali$CheckNull
        add $8, %esp
        movl 20(%edi), %edi
      push %edi
        # Emitting this.value
          # Emitting this
          movl 16(%ebp), %edi
        push %edi
        call Javali$CheckNull
        add $4, %esp
        movl 16(%edi), %edi
      push %edi
      # Load "this" pointer
      movl 8(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 4(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
    movl %edi, -20(%ebp)
    # Emitting return reduce.apply(...)
      # Emitting reduce.apply(...)
      sub $4, %esp
        # Emitting reduce
        movl 8(%ebp), %edi
      push %edi
        # Emitting l
        movl -16(%ebp), %edi
      push %edi
        # Emitting m
        movl -20(%ebp), %edi
      push %edi
        # Emitting r
        movl -12(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 12(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 4(%edi), %edi
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
  jmp label112
label119:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
# Class NothingReduction______________________________________________
  # 
# Class PrintBothAction_______________________________________________
  # 
  .section .text
# __Method PrintBothAction.apply______________________________________
  .globl PrintBothAction_apply
PrintBothAction_apply:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label120
# __Basic block 0_____________________________________________________
label120:
    # Emitting write(key)
      # Emitting key
      movl 12(%ebp), %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
    # Emitting write(value)
      # Emitting value
      movl 8(%ebp), %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
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
  jmp label121
# __Basic block 1_____________________________________________________
label121:
  # Return
  jmp label122
label122:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
# Class PrintKeyAction________________________________________________
  # 
  .section .text
# __Method PrintKeyAction.apply_______________________________________
  .globl PrintKeyAction_apply
PrintKeyAction_apply:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label123
# __Basic block 0_____________________________________________________
label123:
    # Emitting write(key)
      # Emitting key
      movl 12(%ebp), %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
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
  jmp label124
# __Basic block 1_____________________________________________________
label124:
  # Return
  jmp label125
label125:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
# Class PrintValueAction______________________________________________
  # 
  .section .text
# __Method PrintValueAction.apply_____________________________________
  .globl PrintValueAction_apply
PrintValueAction_apply:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label126
# __Basic block 0_____________________________________________________
label126:
    # Emitting write(value)
      # Emitting value
      movl 8(%ebp), %edi
    push %edi
    call Javali$PrintInteger
    add $4, %esp
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
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
  jmp label127
# __Basic block 1_____________________________________________________
label127:
  # Return
  jmp label128
label128:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
# Class Random________________________________________________________
  # 
  .section .text
# __Method Random.Random______________________________________________
  .globl Random_Random
Random_Random:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label129
# __Basic block 0_____________________________________________________
label129:
    # Emitting this.im = 134456
      # Emitting 134456
      movl $134456, %edi
      # Emitting this
      movl 12(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 4(%esi)
    # Emitting this.ia = 8121
      # Emitting 8121
      movl $8121, %edi
      # Emitting this
      movl 12(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 12(%esi)
    # Emitting this.ic = 28411
      # Emitting 28411
      movl $28411, %edi
      # Emitting this
      movl 12(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 16(%esi)
    # Emitting this.jran = (seed % this.im)
      # Emitting (seed % this.im)
        # Emitting seed
        movl 8(%ebp), %edi
        # Emitting this.im
          # Emitting this
          movl 12(%ebp), %esi
        push %esi
        call Javali$CheckNull
        add $4, %esp
        movl 4(%esi), %esi
      push %esi
      call Javali$CheckNonZero
      add $4, %esp
      pushl %esi
      pushl %edi
      popl %eax
      popl %ebx
      cltd
      idivl %ebx
      movl %edx, %edi
      # Emitting this
      movl 12(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 8(%esi)
    # Emitting this.next(...)
      # Emitting this.next(...)
        # Emitting this
        movl 12(%ebp), %edi
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
  jmp label130
# __Basic block 1_____________________________________________________
label130:
  # Return
  jmp label131
label131:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Random.next________________________________________________
  .globl Random_next
Random_next:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label132
# __Basic block 0_____________________________________________________
label132:
    # Emitting this.jran = (((this.jran * this.ia) + this.ic) % this.im)
      # Emitting (((this.jran * this.ia) + this.ic) % this.im)
        # Emitting ((this.jran * this.ia) + this.ic)
          # Emitting (this.jran * this.ia)
            # Emitting this.jran
              # Emitting this
              movl 8(%ebp), %edi
            push %edi
            call Javali$CheckNull
            add $4, %esp
            movl 8(%edi), %edi
            # Emitting this.ia
              # Emitting this
              movl 8(%ebp), %esi
            push %esi
            call Javali$CheckNull
            add $4, %esp
            movl 12(%esi), %esi
          imull %esi, %edi
          # Emitting this.ic
            # Emitting this
            movl 8(%ebp), %esi
          push %esi
          call Javali$CheckNull
          add $4, %esp
          movl 16(%esi), %esi
        addl %esi, %edi
        # Emitting this.im
          # Emitting this
          movl 8(%ebp), %esi
        push %esi
        call Javali$CheckNull
        add $4, %esp
        movl 4(%esi), %esi
      push %esi
      call Javali$CheckNonZero
      add $4, %esp
      pushl %esi
      pushl %edi
      popl %eax
      popl %ebx
      cltd
      idivl %ebx
      movl %edx, %edi
      # Emitting this
      movl 8(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 8(%esi)
    # Emitting return this.jran
      # Emitting this.jran
        # Emitting this
        movl 8(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 8(%edi), %edi
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label133
# __Basic block 1_____________________________________________________
label133:
  # Return
  jmp label134
label134:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
# Class ReductionLambda_______________________________________________
  # 
  .section .text
# __Method ReductionLambda.apply______________________________________
  .globl ReductionLambda_apply
ReductionLambda_apply:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label135
# __Basic block 0_____________________________________________________
label135:
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
  jmp label136
# __Basic block 1_____________________________________________________
label136:
  # Return
  jmp label137
label137:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
# Class Tree__________________________________________________________
  # 
  .section .text
# __Method Tree.Tree__________________________________________________
  .globl Tree_Tree
Tree_Tree:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label138
# __Basic block 0_____________________________________________________
label138:
    # Emitting this.cmpOp = cmpOp
      # Emitting cmpOp
      movl 8(%ebp), %edi
      # Emitting this
      movl 12(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 4(%esi)
    # Emitting this.preparePrintLambdas(...)
      # Emitting this.preparePrintLambdas(...)
        # Emitting this
        movl 12(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 0(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 40(%edi), %edi
      call *%edi
      add $4, %esp
      movl %eax, %edi
    # Emitting this.prepareCountLambdas(...)
      # Emitting this.prepareCountLambdas(...)
        # Emitting this
        movl 12(%ebp), %edi
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
      add $4, %esp
      movl %eax, %edi
    # Emitting this.prepareDepthLambdas(...)
      # Emitting this.prepareDepthLambdas(...)
        # Emitting this
        movl 12(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 0(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 20(%edi), %edi
      call *%edi
      add $4, %esp
      movl %eax, %edi
  # Exit to block 1
  jmp label139
# __Basic block 1_____________________________________________________
label139:
  # Return
  jmp label140
label140:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Tree.add___________________________________________________
  .globl Tree_add
Tree_add:
  # Variable     Offset
  # n            -12
  # implicit=8 localSlot=16 sum=24
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  jmp label141
# __Basic block 0_____________________________________________________
label141:
    # Emitting n = new Node()
      # Emitting new Node()
      push $24
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_Node, 0(%edi)
    movl %edi, -12(%ebp)
    # Emitting n.Node(...)
      # Emitting n.Node(...)
      sub $4, %esp
        # Emitting n
        movl -12(%ebp), %edi
      push %edi
        # Emitting this.cmpOp
          # Emitting this
          movl 16(%ebp), %edi
        sub $8, %esp
        push %edi
        call Javali$CheckNull
        add $12, %esp
        movl 4(%edi), %edi
      push %edi
        # Emitting key
        movl 12(%ebp), %edi
      push %edi
        # Emitting value
        movl 8(%ebp), %edi
      push %edi
      # Load "this" pointer
      movl 12(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 28(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
  # Exit to block 2 if true, block 3 if false
    # Emitting (this.root == null)
      # Emitting this.root
        # Emitting this
        movl 16(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 20(%edi), %edi
      # Emitting null
      movl $0, %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    sete %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label144
  jmp label143
# __Basic block 1_____________________________________________________
label142:
  # Return
  jmp label146
# __Basic block 2_____________________________________________________
label143:
    # Emitting this.root = n
      # Emitting n
      movl -12(%ebp), %edi
      # Emitting this
      movl 16(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 20(%esi)
  # Exit to block 4
  jmp label145
# __Basic block 3_____________________________________________________
label144:
    # Emitting this.root.add(...)
      # Emitting this.root.add(...)
      sub $12, %esp
        # Emitting this.root
          # Emitting this
          movl 16(%ebp), %edi
        sub $4, %esp
        push %edi
        call Javali$CheckNull
        add $8, %esp
        movl 20(%edi), %edi
      push %edi
        # Emitting n
        movl -12(%ebp), %edi
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
  # Exit to block 4
  jmp label145
# __Basic block 4_____________________________________________________
label145:
  # Exit to block 1
  jmp label142
label146:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Tree.prepareCountLambdas___________________________________
  .globl Tree_prepareCountLambdas
Tree_prepareCountLambdas:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label147
# __Basic block 0_____________________________________________________
label147:
    # Emitting this.countAction = new CountAction()
      # Emitting new CountAction()
      push $4
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_CountAction, 0(%edi)
      # Emitting this
      movl 8(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 36(%esi)
    # Emitting this.countReduce = new CountReduction()
      # Emitting new CountReduction()
      push $4
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_CountReduction, 0(%edi)
      # Emitting this
      movl 8(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 28(%esi)
  # Exit to block 1
  jmp label148
# __Basic block 1_____________________________________________________
label148:
  # Return
  jmp label149
label149:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Tree.getCount______________________________________________
  .globl Tree_getCount
Tree_getCount:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label150
# __Basic block 0_____________________________________________________
label150:
  # Exit to block 2 if true, block 3 if false
    # Emitting (this.root != null)
      # Emitting this.root
        # Emitting this
        movl 8(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 20(%edi), %edi
      # Emitting null
      movl $0, %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setne %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label153
  jmp label152
# __Basic block 1_____________________________________________________
label151:
  # Return
  jmp label154
# __Basic block 2_____________________________________________________
label152:
    # Emitting return this.root.runPostOrder(...)
      # Emitting this.root.runPostOrder(...)
      sub $8, %esp
        # Emitting this.root
          # Emitting this
          movl 8(%ebp), %edi
        sub $8, %esp
        push %edi
        call Javali$CheckNull
        add $12, %esp
        movl 20(%edi), %edi
      push %edi
        # Emitting this.countAction
          # Emitting this
          movl 8(%ebp), %edi
        sub $4, %esp
        push %edi
        call Javali$CheckNull
        add $8, %esp
        movl 36(%edi), %edi
      push %edi
        # Emitting this.countReduce
          # Emitting this
          movl 8(%ebp), %edi
        push %edi
        call Javali$CheckNull
        add $4, %esp
        movl 28(%edi), %edi
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
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label151
# __Basic block 3_____________________________________________________
label153:
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
  jmp label151
label154:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Tree.prepareDepthLambdas___________________________________
  .globl Tree_prepareDepthLambdas
Tree_prepareDepthLambdas:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label155
# __Basic block 0_____________________________________________________
label155:
    # Emitting this.depthAction = new DepthAction()
      # Emitting new DepthAction()
      push $4
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_DepthAction, 0(%edi)
      # Emitting this
      movl 8(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 40(%esi)
    # Emitting this.depthReduce = new DepthReduction()
      # Emitting new DepthReduction()
      push $4
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_DepthReduction, 0(%edi)
      # Emitting this
      movl 8(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 12(%esi)
  # Exit to block 1
  jmp label156
# __Basic block 1_____________________________________________________
label156:
  # Return
  jmp label157
label157:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Tree.getDepth______________________________________________
  .globl Tree_getDepth
Tree_getDepth:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label158
# __Basic block 0_____________________________________________________
label158:
  # Exit to block 2 if true, block 3 if false
    # Emitting (this.root != null)
      # Emitting this.root
        # Emitting this
        movl 8(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 20(%edi), %edi
      # Emitting null
      movl $0, %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setne %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label161
  jmp label160
# __Basic block 1_____________________________________________________
label159:
  # Return
  jmp label162
# __Basic block 2_____________________________________________________
label160:
    # Emitting return this.root.runPostOrder(...)
      # Emitting this.root.runPostOrder(...)
      sub $8, %esp
        # Emitting this.root
          # Emitting this
          movl 8(%ebp), %edi
        sub $8, %esp
        push %edi
        call Javali$CheckNull
        add $12, %esp
        movl 20(%edi), %edi
      push %edi
        # Emitting this.depthAction
          # Emitting this
          movl 8(%ebp), %edi
        sub $4, %esp
        push %edi
        call Javali$CheckNull
        add $8, %esp
        movl 40(%edi), %edi
      push %edi
        # Emitting this.depthReduce
          # Emitting this
          movl 8(%ebp), %edi
        push %edi
        call Javali$CheckNull
        add $4, %esp
        movl 12(%edi), %edi
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
    movl %edi, %eax
    pop %ebx
    pop %edi
    pop %esi
    leave
    ret
  # Exit to block 1
  jmp label159
# __Basic block 3_____________________________________________________
label161:
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
  jmp label159
label162:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Tree.preparePrintLambdas___________________________________
  .globl Tree_preparePrintLambdas
Tree_preparePrintLambdas:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label163
# __Basic block 0_____________________________________________________
label163:
    # Emitting this.printKeyAction = new PrintKeyAction()
      # Emitting new PrintKeyAction()
      push $4
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_PrintKeyAction, 0(%edi)
      # Emitting this
      movl 8(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 32(%esi)
    # Emitting this.printValueAction = new PrintValueAction()
      # Emitting new PrintValueAction()
      push $4
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_PrintValueAction, 0(%edi)
      # Emitting this
      movl 8(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 24(%esi)
    # Emitting this.printBothAction = new PrintBothAction()
      # Emitting new PrintBothAction()
      push $4
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_PrintBothAction, 0(%edi)
      # Emitting this
      movl 8(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 8(%esi)
    # Emitting this.printReduce = new NothingReduction()
      # Emitting new NothingReduction()
      push $4
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_NothingReduction, 0(%edi)
      # Emitting this
      movl 8(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 16(%esi)
  # Exit to block 1
  jmp label164
# __Basic block 1_____________________________________________________
label164:
  # Return
  jmp label165
label165:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Tree.printPreOrder_________________________________________
  .globl Tree_printPreOrder
Tree_printPreOrder:
  # Variable     Offset
  # action       -12
  # implicit=8 localSlot=16 sum=24
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  jmp label166
# __Basic block 0_____________________________________________________
label166:
  # Exit to block 2 if true, block 3 if false
    # Emitting (type == 1)
      # Emitting type
      movl 8(%ebp), %edi
      # Emitting 1
      movl $1, %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    sete %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label169
  jmp label168
# __Basic block 1_____________________________________________________
label167:
  # Return
  jmp label177
# __Basic block 2_____________________________________________________
label168:
    # Emitting action = this.printKeyAction
      # Emitting this.printKeyAction
        # Emitting this
        movl 12(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 32(%edi), %edi
    movl %edi, -12(%ebp)
  # Exit to block 7
  jmp label173
# __Basic block 3_____________________________________________________
label169:
  # Exit to block 4 if true, block 5 if false
    # Emitting (type == 2)
      # Emitting type
      movl 8(%ebp), %edi
      # Emitting 2
      movl $2, %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    sete %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label171
  jmp label170
# __Basic block 4_____________________________________________________
label170:
    # Emitting action = this.printValueAction
      # Emitting this.printValueAction
        # Emitting this
        movl 12(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 24(%edi), %edi
    movl %edi, -12(%ebp)
  # Exit to block 6
  jmp label172
# __Basic block 5_____________________________________________________
label171:
    # Emitting action = this.printBothAction
      # Emitting this.printBothAction
        # Emitting this
        movl 12(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 8(%edi), %edi
    movl %edi, -12(%ebp)
  # Exit to block 6
  jmp label172
# __Basic block 6_____________________________________________________
label172:
  # Exit to block 7
  jmp label173
# __Basic block 7_____________________________________________________
label173:
  # Exit to block 8 if true, block 9 if false
    # Emitting (this.root != null)
      # Emitting this.root
        # Emitting this
        movl 12(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 20(%edi), %edi
      # Emitting null
      movl $0, %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setne %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label175
  jmp label174
# __Basic block 8_____________________________________________________
label174:
    # Emitting this.root.runPreOrder(...)
      # Emitting this.root.runPreOrder(...)
      sub $8, %esp
        # Emitting this.root
          # Emitting this
          movl 12(%ebp), %edi
        sub $8, %esp
        push %edi
        call Javali$CheckNull
        add $12, %esp
        movl 20(%edi), %edi
      push %edi
        # Emitting action
        movl -12(%ebp), %edi
      push %edi
        # Emitting this.printReduce
          # Emitting this
          movl 12(%ebp), %edi
        push %edi
        call Javali$CheckNull
        add $4, %esp
        movl 16(%edi), %edi
      push %edi
      # Load "this" pointer
      movl 8(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 36(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
  # Exit to block 10
  jmp label176
# __Basic block 9_____________________________________________________
label175:
    # Emitting nop
  # Exit to block 10
  jmp label176
# __Basic block 10____________________________________________________
label176:
  # Exit to block 1
  jmp label167
label177:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Tree.printInOrder__________________________________________
  .globl Tree_printInOrder
Tree_printInOrder:
  # Variable     Offset
  # action       -12
  # implicit=8 localSlot=16 sum=24
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  jmp label178
# __Basic block 0_____________________________________________________
label178:
  # Exit to block 2 if true, block 3 if false
    # Emitting (type == 1)
      # Emitting type
      movl 8(%ebp), %edi
      # Emitting 1
      movl $1, %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    sete %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label181
  jmp label180
# __Basic block 1_____________________________________________________
label179:
  # Return
  jmp label189
# __Basic block 2_____________________________________________________
label180:
    # Emitting action = this.printKeyAction
      # Emitting this.printKeyAction
        # Emitting this
        movl 12(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 32(%edi), %edi
    movl %edi, -12(%ebp)
  # Exit to block 7
  jmp label185
# __Basic block 3_____________________________________________________
label181:
  # Exit to block 4 if true, block 5 if false
    # Emitting (type == 2)
      # Emitting type
      movl 8(%ebp), %edi
      # Emitting 2
      movl $2, %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    sete %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label183
  jmp label182
# __Basic block 4_____________________________________________________
label182:
    # Emitting action = this.printValueAction
      # Emitting this.printValueAction
        # Emitting this
        movl 12(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 24(%edi), %edi
    movl %edi, -12(%ebp)
  # Exit to block 6
  jmp label184
# __Basic block 5_____________________________________________________
label183:
    # Emitting action = this.printBothAction
      # Emitting this.printBothAction
        # Emitting this
        movl 12(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 8(%edi), %edi
    movl %edi, -12(%ebp)
  # Exit to block 6
  jmp label184
# __Basic block 6_____________________________________________________
label184:
  # Exit to block 7
  jmp label185
# __Basic block 7_____________________________________________________
label185:
  # Exit to block 8 if true, block 9 if false
    # Emitting (this.root != null)
      # Emitting this.root
        # Emitting this
        movl 12(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 20(%edi), %edi
      # Emitting null
      movl $0, %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setne %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label187
  jmp label186
# __Basic block 8_____________________________________________________
label186:
    # Emitting this.root.runInOrder(...)
      # Emitting this.root.runInOrder(...)
      sub $8, %esp
        # Emitting this.root
          # Emitting this
          movl 12(%ebp), %edi
        sub $8, %esp
        push %edi
        call Javali$CheckNull
        add $12, %esp
        movl 20(%edi), %edi
      push %edi
        # Emitting action
        movl -12(%ebp), %edi
      push %edi
        # Emitting this.printReduce
          # Emitting this
          movl 12(%ebp), %edi
        push %edi
        call Javali$CheckNull
        add $4, %esp
        movl 16(%edi), %edi
      push %edi
      # Load "this" pointer
      movl 8(%esp), %edi
      sub $12, %esp
      push %edi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%edi), %edi
      movl 32(%edi), %edi
      call *%edi
      add $20, %esp
      movl %eax, %edi
  # Exit to block 10
  jmp label188
# __Basic block 9_____________________________________________________
label187:
    # Emitting nop
  # Exit to block 10
  jmp label188
# __Basic block 10____________________________________________________
label188:
  # Exit to block 1
  jmp label179
label189:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
  .section .text
# __Method Tree.printPostOrder________________________________________
  .globl Tree_printPostOrder
Tree_printPostOrder:
  # Variable     Offset
  # action       -12
  # implicit=8 localSlot=16 sum=24
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  jmp label190
# __Basic block 0_____________________________________________________
label190:
  # Exit to block 2 if true, block 3 if false
    # Emitting (type == 1)
      # Emitting type
      movl 8(%ebp), %edi
      # Emitting 1
      movl $1, %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    sete %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label193
  jmp label192
# __Basic block 1_____________________________________________________
label191:
  # Return
  jmp label201
# __Basic block 2_____________________________________________________
label192:
    # Emitting action = this.printKeyAction
      # Emitting this.printKeyAction
        # Emitting this
        movl 12(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 32(%edi), %edi
    movl %edi, -12(%ebp)
  # Exit to block 7
  jmp label197
# __Basic block 3_____________________________________________________
label193:
  # Exit to block 4 if true, block 5 if false
    # Emitting (type == 2)
      # Emitting type
      movl 8(%ebp), %edi
      # Emitting 2
      movl $2, %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    sete %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label195
  jmp label194
# __Basic block 4_____________________________________________________
label194:
    # Emitting action = this.printValueAction
      # Emitting this.printValueAction
        # Emitting this
        movl 12(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 24(%edi), %edi
    movl %edi, -12(%ebp)
  # Exit to block 6
  jmp label196
# __Basic block 5_____________________________________________________
label195:
    # Emitting action = this.printBothAction
      # Emitting this.printBothAction
        # Emitting this
        movl 12(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 8(%edi), %edi
    movl %edi, -12(%ebp)
  # Exit to block 6
  jmp label196
# __Basic block 6_____________________________________________________
label196:
  # Exit to block 7
  jmp label197
# __Basic block 7_____________________________________________________
label197:
  # Exit to block 8 if true, block 9 if false
    # Emitting (this.root != null)
      # Emitting this.root
        # Emitting this
        movl 12(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 20(%edi), %edi
      # Emitting null
      movl $0, %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setne %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label199
  jmp label198
# __Basic block 8_____________________________________________________
label198:
    # Emitting this.root.runPostOrder(...)
      # Emitting this.root.runPostOrder(...)
      sub $8, %esp
        # Emitting this.root
          # Emitting this
          movl 12(%ebp), %edi
        sub $8, %esp
        push %edi
        call Javali$CheckNull
        add $12, %esp
        movl 20(%edi), %edi
      push %edi
        # Emitting action
        movl -12(%ebp), %edi
      push %edi
        # Emitting this.printReduce
          # Emitting this
          movl 12(%ebp), %edi
        push %edi
        call Javali$CheckNull
        add $4, %esp
        movl 16(%edi), %edi
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
  # Exit to block 10
  jmp label200
# __Basic block 9_____________________________________________________
label199:
    # Emitting nop
  # Exit to block 10
  jmp label200
# __Basic block 10____________________________________________________
label200:
  # Exit to block 1
  jmp label191
label201:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
