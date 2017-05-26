vtablearr_Record:
.int vtable_Object
vtablearr_Main:
.int vtable_Object
vtable_Object:
.int 0
vtable_Record:
.int vtable_Object
.int Record_print
vtablearr_int:
.int vtable_Object
vtablearr_boolean:
.int vtable_Object
vtable_Main:
.int vtable_Object
.int Main_swap
.int Main_main
.int Main_sort
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
      push $12
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
# __Method Main.swap__________________________________________________
  .globl Main_swap
Main_swap:
  # Variable     Offset
  # temp         -12
  # implicit=8 localSlot=16 sum=24
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  jmp label7
# __Basic block 0_____________________________________________________
label7:
    # Emitting temp = r1.a
      # Emitting r1.a
        # Emitting r1
        movl 12(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 4(%edi), %edi
    movl %edi, -12(%ebp)
    # Emitting r1.a = r2.a
      # Emitting r2.a
        # Emitting r2
        movl 8(%ebp), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
      movl 4(%edi), %edi
      # Emitting r1
      movl 12(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 4(%esi)
    # Emitting r2.a = temp
      # Emitting temp
      movl -12(%ebp), %edi
      # Emitting r2
      movl 8(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 4(%esi)
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
# __Method Main.sort__________________________________________________
  .globl Main_sort
Main_sort:
  # Variable     Offset
  # i            -12
  # j            -16
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
  jmp label10
# __Basic block 0_____________________________________________________
label10:
    # Emitting m = ((this.a[left].a + this.a[right].a) / 2)
      # Emitting ((this.a[left].a + this.a[right].a) / 2)
        # Emitting (this.a[left].a + this.a[right].a)
          # Emitting this.a[left].a
            # Emitting this.a[left]
              # Emitting this.a
                # Emitting this
                movl 16(%ebp), %edi
              push %edi
              call Javali$CheckNull
              add $4, %esp
              movl 4(%edi), %edi
            push %edi
            call Javali$CheckNull
            add $4, %esp
              # Emitting left
              movl 12(%ebp), %esi
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
          # Emitting this.a[right].a
            # Emitting this.a[right]
              # Emitting this.a
                # Emitting this
                movl 16(%ebp), %edi
              push %edi
              call Javali$CheckNull
              add $4, %esp
              movl 4(%edi), %edi
            push %edi
            call Javali$CheckNull
            add $4, %esp
              # Emitting right
              movl 8(%ebp), %edx
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
          call Javali$CheckNull
          add $16, %esp
          pop %edx
          movl 4(%edx), %edx
        addl %edx, %esi
        # Emitting 2
        movl $2, %edx
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
    movl %esi, -20(%ebp)
    # Emitting i = left
      # Emitting left
      movl 12(%ebp), %esi
    movl %esi, -12(%ebp)
    # Emitting j = right
      # Emitting right
      movl 8(%ebp), %esi
    movl %esi, -16(%ebp)
  # Exit to block 2
  jmp label12
# __Basic block 1_____________________________________________________
label11:
  # Return
  jmp label30
# __Basic block 2_____________________________________________________
label12:
  # Exit to block 3 if true, block 4 if false
    # Emitting (i <= j)
      # Emitting i
      movl -12(%ebp), %esi
      # Emitting j
      movl -16(%ebp), %edx
    cmpl %edx, %esi
    push %eax
    movl $0, %eax
    setle %al
    movl %eax, %esi
    pop %eax
  cmpl $0, %esi
  je label14
  jmp label13
# __Basic block 3_____________________________________________________
label13:
  # Exit to block 5
  jmp label15
# __Basic block 4_____________________________________________________
label14:
  # Exit to block 14 if true, block 15 if false
    # Emitting (left < j)
      # Emitting left
      movl 12(%ebp), %esi
      # Emitting j
      movl -16(%ebp), %edx
    cmpl %edx, %esi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %esi
    pop %eax
  cmpl $0, %esi
  je label25
  jmp label24
# __Basic block 5_____________________________________________________
label15:
  # Exit to block 6 if true, block 7 if false
    # Emitting (this.a[i].a < m)
      # Emitting this.a[i].a
        # Emitting this.a[i]
          # Emitting this.a
            # Emitting this
            movl 16(%ebp), %esi
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
        movl 8(%esi,%edx,4), %edx
      push %edx
      sub $12, %esp
      push %edx
      call Javali$CheckNull
      add $16, %esp
      pop %edx
      movl 4(%edx), %edx
      # Emitting m
      movl -20(%ebp), %esi
    cmpl %esi, %edx
    movl $0, %edx
    setl %dl
  cmpl $0, %edx
  je label17
  jmp label16
# __Basic block 6_____________________________________________________
label16:
    # Emitting i = (i + 1)
      # Emitting (i + 1)
        # Emitting i
        movl -12(%ebp), %edx
        # Emitting 1
        movl $1, %esi
      addl %esi, %edx
    movl %edx, -12(%ebp)
  # Exit to block 5
  jmp label15
# __Basic block 7_____________________________________________________
label17:
  # Exit to block 8
  jmp label18
# __Basic block 8_____________________________________________________
label18:
  # Exit to block 9 if true, block 10 if false
    # Emitting (this.a[j].a > m)
      # Emitting this.a[j].a
        # Emitting this.a[j]
          # Emitting this.a
            # Emitting this
            movl 16(%ebp), %edx
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
          # Emitting j
          movl -16(%ebp), %esi
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
      movl 4(%esi), %esi
      # Emitting m
      movl -20(%ebp), %edx
    cmpl %edx, %esi
    push %eax
    movl $0, %eax
    setg %al
    movl %eax, %esi
    pop %eax
  cmpl $0, %esi
  je label20
  jmp label19
# __Basic block 9_____________________________________________________
label19:
    # Emitting j = (j - 1)
      # Emitting (j - 1)
        # Emitting j
        movl -16(%ebp), %esi
        # Emitting 1
        movl $1, %edx
      subl %edx, %esi
    movl %esi, -16(%ebp)
  # Exit to block 8
  jmp label18
# __Basic block 10____________________________________________________
label20:
  # Exit to block 11 if true, block 12 if false
    # Emitting (i <= j)
      # Emitting i
      movl -12(%ebp), %esi
      # Emitting j
      movl -16(%ebp), %edx
    cmpl %edx, %esi
    push %eax
    movl $0, %eax
    setle %al
    movl %eax, %esi
    pop %eax
  cmpl $0, %esi
  je label22
  jmp label21
# __Basic block 11____________________________________________________
label21:
    # Emitting this.swap(...)
      # Emitting this.swap(...)
      sub $8, %esp
        # Emitting this
        movl 16(%ebp), %esi
      push %esi
        # Emitting this.a[i]
          # Emitting this.a
            # Emitting this
            movl 16(%ebp), %esi
          sub $4, %esp
          push %esi
          call Javali$CheckNull
          add $8, %esp
          movl 4(%esi), %esi
        sub $4, %esp
        push %esi
        call Javali$CheckNull
        add $8, %esp
          # Emitting i
          movl -12(%ebp), %edx
        push %edx
        sub $12, %esp
        push %edx
        push %esi
        call Javali$CheckArrayBounds
        add $20, %esp
        pop %edx
        movl 8(%esi,%edx,4), %edx
      push %edx
        # Emitting this.a[j]
          # Emitting this.a
            # Emitting this
            movl 16(%ebp), %edx
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
          # Emitting j
          movl -16(%ebp), %esi
        push %edx
        sub $8, %esp
        push %esi
        push %edx
        call Javali$CheckArrayBounds
        add $16, %esp
        pop %edx
        movl 8(%edx,%esi,4), %esi
      push %esi
      # Load "this" pointer
      movl 8(%esp), %esi
      sub $12, %esp
      push %esi
      call Javali$CheckNull
      add $16, %esp
      movl 0(%esi), %esi
      movl 4(%esi), %esi
      call *%esi
      add $20, %esp
      movl %eax, %esi
    # Emitting i = (i + 1)
      # Emitting (i + 1)
        # Emitting i
        movl -12(%ebp), %esi
        # Emitting 1
        movl $1, %edx
      addl %edx, %esi
    movl %esi, -12(%ebp)
    # Emitting j = (j - 1)
      # Emitting (j - 1)
        # Emitting j
        movl -16(%ebp), %esi
        # Emitting 1
        movl $1, %edx
      subl %edx, %esi
    movl %esi, -16(%ebp)
  # Exit to block 13
  jmp label23
# __Basic block 12____________________________________________________
label22:
    # Emitting nop
  # Exit to block 13
  jmp label23
# __Basic block 13____________________________________________________
label23:
  # Exit to block 2
  jmp label12
# __Basic block 14____________________________________________________
label24:
    # Emitting this.sort(...)
      # Emitting this.sort(...)
      sub $8, %esp
        # Emitting this
        movl 16(%ebp), %esi
      push %esi
        # Emitting left
        movl 12(%ebp), %esi
      push %esi
        # Emitting j
        movl -16(%ebp), %esi
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
  # Exit to block 16
  jmp label26
# __Basic block 15____________________________________________________
label25:
    # Emitting nop
  # Exit to block 16
  jmp label26
# __Basic block 16____________________________________________________
label26:
  # Exit to block 17 if true, block 18 if false
    # Emitting (i < right)
      # Emitting i
      movl -12(%ebp), %esi
      # Emitting right
      movl 8(%ebp), %edx
    cmpl %edx, %esi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %esi
    pop %eax
  cmpl $0, %esi
  je label28
  jmp label27
# __Basic block 17____________________________________________________
label27:
    # Emitting this.sort(...)
      # Emitting this.sort(...)
      sub $8, %esp
        # Emitting this
        movl 16(%ebp), %esi
      push %esi
        # Emitting i
        movl -12(%ebp), %esi
      push %esi
        # Emitting right
        movl 8(%ebp), %esi
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
  # Exit to block 19
  jmp label29
# __Basic block 18____________________________________________________
label28:
    # Emitting nop
  # Exit to block 19
  jmp label29
# __Basic block 19____________________________________________________
label29:
  # Exit to block 1
  jmp label11
label30:
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
  # SIZE         -12
  # j            -16
  # implicit=8 localSlot=20 sum=28
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  jmp label31
# __Basic block 0_____________________________________________________
label31:
    # Emitting SIZE = 5
      # Emitting 5
      movl $5, %edi
    movl %edi, -12(%ebp)
    # Emitting this.a = new Record[][SIZE]
      # Emitting new Record[][SIZE]
        # Emitting SIZE
        movl -12(%ebp), %edi
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
      movl $vtablearr_Record, 0(%edi)
      movl %esi, 4(%edi)
      # Emitting this
      movl 8(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 4(%esi)
    # Emitting j = 0
      # Emitting 0
      movl $0, %edi
    movl %edi, -16(%ebp)
  # Exit to block 2
  jmp label33
# __Basic block 1_____________________________________________________
label32:
  # Return
  jmp label42
# __Basic block 2_____________________________________________________
label33:
  # Exit to block 3 if true, block 4 if false
    # Emitting (j < SIZE)
      # Emitting j
      movl -16(%ebp), %edi
      # Emitting SIZE
      movl -12(%ebp), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label35
  jmp label34
# __Basic block 3_____________________________________________________
label34:
    # Emitting this.a[j] = new Record()
      # Emitting new Record()
      push $8
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_Record, 0(%edi)
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
      # Emitting j
      movl -16(%ebp), %edx
    push %edx
    sub $8, %esp
    push %edx
    push %esi
    call Javali$CheckArrayBounds
    add $16, %esp
    pop %edx
    movl %edi, 8(%esi,%edx,4)
    # Emitting j = (j + 1)
      # Emitting (j + 1)
        # Emitting j
        movl -16(%ebp), %edi
        # Emitting 1
        movl $1, %edx
      addl %edx, %edi
    movl %edi, -16(%ebp)
  # Exit to block 2
  jmp label33
# __Basic block 4_____________________________________________________
label35:
    # Emitting this.a[0].a = 5
      # Emitting 5
      movl $5, %edi
      # Emitting this.a[0]
        # Emitting this.a
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
    # Emitting this.a[1].a = 3
      # Emitting 3
      movl $3, %edi
      # Emitting this.a[1]
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
        # Emitting 1
        movl $1, %edx
      push %edx
      sub $8, %esp
      push %edx
      push %esi
      call Javali$CheckArrayBounds
      add $16, %esp
      pop %edx
      movl 8(%esi,%edx,4), %edx
    push %edx
    sub $12, %esp
    push %edx
    call Javali$CheckNull
    add $16, %esp
    pop %edx
    movl %edi, 4(%edx)
    # Emitting this.a[2].a = 1
      # Emitting 1
      movl $1, %edi
      # Emitting this.a[2]
        # Emitting this.a
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
        # Emitting 2
        movl $2, %esi
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
    # Emitting this.a[3].a = 4
      # Emitting 4
      movl $4, %edi
      # Emitting this.a[3]
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
        # Emitting 3
        movl $3, %edx
      push %edx
      sub $8, %esp
      push %edx
      push %esi
      call Javali$CheckArrayBounds
      add $16, %esp
      pop %edx
      movl 8(%esi,%edx,4), %edx
    push %edx
    sub $12, %esp
    push %edx
    call Javali$CheckNull
    add $16, %esp
    pop %edx
    movl %edi, 4(%edx)
    # Emitting this.a[4].a = 2
      # Emitting 2
      movl $2, %edi
      # Emitting this.a[4]
        # Emitting this.a
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
        # Emitting 4
        movl $4, %esi
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
    # Emitting j = 0
      # Emitting 0
      movl $0, %edi
    movl %edi, -16(%ebp)
  # Exit to block 5
  jmp label36
# __Basic block 5_____________________________________________________
label36:
  # Exit to block 6 if true, block 7 if false
    # Emitting (j < SIZE)
      # Emitting j
      movl -16(%ebp), %edi
      # Emitting SIZE
      movl -12(%ebp), %esi
    cmpl %esi, %edi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %edi
    pop %eax
  cmpl $0, %edi
  je label38
  jmp label37
# __Basic block 6_____________________________________________________
label37:
    # Emitting this.a[j].print(...)
      # Emitting this.a[j].print(...)
        # Emitting this.a[j]
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
          # Emitting j
          movl -16(%ebp), %esi
        sub $12, %esp
        push %esi
        push %edi
        call Javali$CheckArrayBounds
        add $20, %esp
        movl 8(%edi,%esi,4), %esi
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
    # Emitting j = (j + 1)
      # Emitting (j + 1)
        # Emitting j
        movl -16(%ebp), %esi
        # Emitting 1
        movl $1, %edi
      addl %edi, %esi
    movl %esi, -16(%ebp)
  # Exit to block 5
  jmp label36
# __Basic block 7_____________________________________________________
label38:
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
    # Emitting this.sort(...)
      # Emitting this.sort(...)
      sub $8, %esp
        # Emitting this
        movl 8(%ebp), %esi
      push %esi
        # Emitting 0
        movl $0, %esi
      push %esi
        # Emitting 4
        movl $4, %esi
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
    # Emitting j = 0
      # Emitting 0
      movl $0, %esi
    movl %esi, -16(%ebp)
  # Exit to block 8
  jmp label39
# __Basic block 8_____________________________________________________
label39:
  # Exit to block 9 if true, block 10 if false
    # Emitting (j < SIZE)
      # Emitting j
      movl -16(%ebp), %esi
      # Emitting SIZE
      movl -12(%ebp), %edi
    cmpl %edi, %esi
    push %eax
    movl $0, %eax
    setl %al
    movl %eax, %esi
    pop %eax
  cmpl $0, %esi
  je label41
  jmp label40
# __Basic block 9_____________________________________________________
label40:
    # Emitting this.a[j].print(...)
      # Emitting this.a[j].print(...)
        # Emitting this.a[j]
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
          # Emitting j
          movl -16(%ebp), %edi
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
    # Emitting j = (j + 1)
      # Emitting (j + 1)
        # Emitting j
        movl -16(%ebp), %edi
        # Emitting 1
        movl $1, %esi
      addl %esi, %edi
    movl %edi, -16(%ebp)
  # Exit to block 8
  jmp label39
# __Basic block 10____________________________________________________
label41:
    # Emitting writeln()
    sub $4, %esp
    call Javali$PrintNewLine
    add $4, %esp
  # Exit to block 1
  jmp label32
label42:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
# Class Record________________________________________________________
  # 
  .section .text
# __Method Record.print_______________________________________________
  .globl Record_print
Record_print:
  # Variable     Offset
  # implicit=8 localSlot=12 sum=20
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  jmp label43
# __Basic block 0_____________________________________________________
label43:
    # Emitting write(this.a)
      # Emitting this.a
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
  jmp label44
# __Basic block 1_____________________________________________________
label44:
  # Return
  jmp label45
label45:
  movl $0, %eax
  pop %ebx
  pop %edi
  pop %esi
  leave
  ret
