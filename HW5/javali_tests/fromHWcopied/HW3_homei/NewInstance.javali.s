vtable_A:
.int vtable_Object
.int A_m
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
.int Main_k
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
# Class Main__________________________________________________________
  # 
  .section .text
# __Method Main.k_____________________________________________________
  .globl Main_k
Main_k:
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
    # Emitting return 5
      # Emitting 5
      movl $5, %edi
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
  .section .text
# __Method Main.main__________________________________________________
  .globl Main_main
Main_main:
  # Variable     Offset
  # ab           -12
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
    # Emitting this.k(...)
      # Emitting this.k(...)
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
      movl 8(%edi), %edi
      call *%edi
      add $4, %esp
      movl %eax, %edi
    # Emitting ab = new A()
      # Emitting new A()
      push $16
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_A, 0(%edi)
    movl %edi, -12(%ebp)
    # Emitting this.arr = new A[][15]
      # Emitting new A[][15]
        # Emitting 15
        movl $15, %edi
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
    # Emitting this.k(...)
      # Emitting this.k(...)
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
      movl 8(%edi), %edi
      call *%edi
      add $4, %esp
      movl %eax, %edi
    # Emitting ab = this.arr[4]
      # Emitting this.arr[4]
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
        # Emitting 4
        movl $4, %esi
      sub $12, %esp
      push %esi
      push %edi
      call Javali$CheckArrayBounds
      add $20, %esp
      movl 8(%edi,%esi,4), %esi
    movl %esi, -12(%ebp)
    # Emitting this.arr[+(((5 * 3) + 2))].aga[1].m(...)
      # Emitting this.arr[+(((5 * 3) + 2))].aga[1].m(...)
        # Emitting this.arr[+(((5 * 3) + 2))].aga[1]
          # Emitting this.arr[+(((5 * 3) + 2))].aga
            # Emitting this.arr[+(((5 * 3) + 2))]
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
              # Emitting +(((5 * 3) + 2))
                # Emitting ((5 * 3) + 2)
                  # Emitting (5 * 3)
                    # Emitting 5
                    movl $5, %edi
                    # Emitting 3
                    movl $3, %edx
                  imull %edx, %edi
                  # Emitting 2
                  movl $2, %edx
                addl %edx, %edi
            sub $12, %esp
            push %edi
            push %esi
            call Javali$CheckArrayBounds
            add $20, %esp
            movl 8(%esi,%edi,4), %edi
          push %edi
          call Javali$CheckNull
          add $4, %esp
          movl 8(%edi), %edi
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
    # Emitting this.arr[4].aga[0].m(...).aga[2].aba.k[this.arr[3].aba.k[3]] = this.arr[3].m(...).aba.k[7]
      # Emitting this.arr[3].m(...).aba.k[7]
        # Emitting this.arr[3].m(...).aba.k
          # Emitting this.arr[3].m(...).aba
            # Emitting this.arr[3].m(...)
              # Emitting this.arr[3]
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
                # Emitting 3
                movl $3, %edi
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
          push %edi
          call Javali$CheckNull
          add $4, %esp
          movl 4(%edi), %edi
        push %edi
        call Javali$CheckNull
        add $4, %esp
        movl 12(%edi), %edi
      push %edi
      call Javali$CheckNull
      add $4, %esp
        # Emitting 7
        movl $7, %esi
      sub $12, %esp
      push %esi
      push %edi
      call Javali$CheckArrayBounds
      add $20, %esp
      movl 8(%edi,%esi,4), %esi
      # Emitting this.arr[4].aga[0].m(...).aga[2].aba.k
        # Emitting this.arr[4].aga[0].m(...).aga[2].aba
          # Emitting this.arr[4].aga[0].m(...).aga[2]
            # Emitting this.arr[4].aga[0].m(...).aga
              # Emitting this.arr[4].aga[0].m(...)
                # Emitting this.arr[4].aga[0]
                  # Emitting this.arr[4].aga
                    # Emitting this.arr[4]
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
                      # Emitting 4
                      movl $4, %edx
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
                  movl 8(%edx), %edx
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
            call Javali$CheckNull
            add $4, %esp
            movl 8(%edi), %edi
          push %edi
          call Javali$CheckNull
          add $4, %esp
            # Emitting 2
            movl $2, %edx
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
      push %edx
      sub $12, %esp
      push %edx
      call Javali$CheckNull
      add $16, %esp
      pop %edx
      movl 12(%edx), %edx
    push %edx
    sub $12, %esp
    push %edx
    call Javali$CheckNull
    add $16, %esp
    pop %edx
      # Emitting this.arr[3].aba.k[3]
        # Emitting this.arr[3].aba.k
          # Emitting this.arr[3].aba
            # Emitting this.arr[3]
              # Emitting this.arr
                # Emitting this
                movl 8(%ebp), %edi
              push %edx
              sub $12, %esp
              push %edi
              call Javali$CheckNull
              add $16, %esp
              pop %edx
              movl 4(%edi), %edi
            push %edx
            sub $12, %esp
            push %edi
            call Javali$CheckNull
            add $16, %esp
            pop %edx
              # Emitting 3
              movl $3, %ecx
            push %ecx
            push %edx
            sub $4, %esp
            push %ecx
            push %edi
            call Javali$CheckArrayBounds
            add $12, %esp
            pop %edx
            pop %ecx
            movl 8(%edi,%ecx,4), %ecx
          push %ecx
          push %edx
          sub $8, %esp
          push %ecx
          call Javali$CheckNull
          add $12, %esp
          pop %edx
          pop %ecx
          movl 4(%ecx), %ecx
        push %ecx
        push %edx
        sub $8, %esp
        push %ecx
        call Javali$CheckNull
        add $12, %esp
        pop %edx
        pop %ecx
        movl 12(%ecx), %ecx
      push %ecx
      push %edx
      sub $8, %esp
      push %ecx
      call Javali$CheckNull
      add $12, %esp
      pop %edx
      pop %ecx
        # Emitting 3
        movl $3, %edi
      push %ecx
      push %edx
      sub $4, %esp
      push %edi
      push %ecx
      call Javali$CheckArrayBounds
      add $12, %esp
      pop %edx
      pop %ecx
      movl 8(%ecx,%edi,4), %edi
    push %edx
    sub $8, %esp
    push %edi
    push %edx
    call Javali$CheckArrayBounds
    add $16, %esp
    pop %edx
    movl %esi, 8(%edx,%edi,4)
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
# __Method A.m________________________________________________________
  .globl A_m
A_m:
  # Variable     Offset
  # ret          -12
  # implicit=8 localSlot=16 sum=24
  enter $24, $0
  and $-16, %esp
  push %esi
  push %edi
  push %ebx
  movl $0, -12(%ebp)
  jmp label13
# __Basic block 0_____________________________________________________
label13:
    # Emitting this.aga = new A[][50]
      # Emitting new A[][50]
        # Emitting 50
        movl $50, %edi
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
    movl %edi, 8(%esi)
    # Emitting this.k = new int[][(4 + 5)]
      # Emitting new int[][(4 + 5)]
        # Emitting (4 + 5)
          # Emitting 4
          movl $4, %edi
          # Emitting 5
          movl $5, %esi
        addl %esi, %edi
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
      # Emitting this
      movl 8(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 12(%esi)
    # Emitting this.k = new int[][(this.aga[7].m(...).k[4] + 4)]
      # Emitting new int[][(this.aga[7].m(...).k[4] + 4)]
        # Emitting (this.aga[7].m(...).k[4] + 4)
          # Emitting this.aga[7].m(...).k[4]
            # Emitting this.aga[7].m(...).k
              # Emitting this.aga[7].m(...)
                # Emitting this.aga[7]
                  # Emitting this.aga
                    # Emitting this
                    movl 8(%ebp), %edi
                  push %edi
                  call Javali$CheckNull
                  add $4, %esp
                  movl 8(%edi), %edi
                push %edi
                call Javali$CheckNull
                add $4, %esp
                  # Emitting 7
                  movl $7, %esi
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
            push %esi
            call Javali$CheckNull
            add $4, %esp
            movl 12(%esi), %esi
          push %esi
          call Javali$CheckNull
          add $4, %esp
            # Emitting 4
            movl $4, %edi
          sub $12, %esp
          push %edi
          push %esi
          call Javali$CheckArrayBounds
          add $20, %esp
          movl 8(%esi,%edi,4), %edi
          # Emitting 4
          movl $4, %esi
        addl %esi, %edi
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
      # Emitting this
      movl 8(%ebp), %esi
    push %esi
    call Javali$CheckNull
    add $4, %esp
    movl %edi, 12(%esi)
    # Emitting ret = new A()
      # Emitting new A()
      push $16
      call Javali$Alloc
      add $4, %esp
      movl %eax, %edi
      movl $vtable_A, 0(%edi)
    movl %edi, -12(%ebp)
    # Emitting return ret
      # Emitting ret
      movl -12(%ebp), %edi
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
