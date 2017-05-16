.section .data
	vtable_Object:
		.int 0
	vtable_Main:
		.int vtable_Object
		.int Main_main
	STR_NL:
		.string "\n"
	STR_D:
		.string "%d"
.section .text
.global main

main:
pushl %ebp
movl %esp, %ebp
pushl $4
pushl $2
call calloc
addl $8, %esp
movl $vtable_Main, (%eax)
pushl %eax
call Main_main
addl $4, %esp
popl %ebp
ret
  # Emitting class Main {...}
    # Emitting int b
    # Emitting void main(...) {...}
Main_main:
    # store old ebp
    pushl %ebp
    # set new ebp
    movl %esp, %ebp
    # save callee-saved registers to stack
    pushl %esi
    pushl %edi
    pushl %ebx
    # set local variables:
    # variable bt
    pushl $0
    # variable bf
    pushl $0
    # variable a
    pushl $0
    # set local variables:
      # Emitting (...)
        # Emitting b = 300
          # Emitting 300
          movl $300, %edi
        movl 8(%ebp), %esi
        movl %edi, 4(%esi)
        # Emitting a = 200
          # Emitting 200
          movl $200, %edi
        movl %edi, -24(%ebp)
        # Emitting bt = true
          # Emitting true
          movl $1, %edi
        movl %edi, -16(%ebp)
        # Emitting bf = false
          # Emitting false
          movl $0, %edi
        movl %edi, -20(%ebp)
        # Emitting if ((a < b)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting (a < b)
            # Emitting b
            movl 8(%ebp), %edi
            movl 4(%edi), %edi
            # Emitting a
            movl -24(%ebp), %esi
          cmpl %edi, %esi
          setl %al
          movzbl %al, %esi
        jge .L2
          # Emitting (...)
            # Emitting write(a)
              # Emitting a
              movl -24(%ebp), %esi
            sub $16, %esp
            movl %esi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
        jmp .L3
.L2:
          # Emitting (...)
            # Emitting write(666)
              # Emitting 666
              movl $666, %esi
            sub $16, %esp
            movl %esi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
.L3:
        # Emitting if ((a <= b)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting (a <= b)
            # Emitting b
            movl 8(%ebp), %esi
            movl 4(%esi), %esi
            # Emitting a
            movl -24(%ebp), %edi
          cmpl %esi, %edi
          setle %al
          movzbl %al, %edi
        jg .L4
          # Emitting (...)
            # Emitting write(a)
              # Emitting a
              movl -24(%ebp), %edi
            sub $16, %esp
            movl %edi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
        jmp .L5
.L4:
          # Emitting (...)
            # Emitting write(666)
              # Emitting 666
              movl $666, %edi
            sub $16, %esp
            movl %edi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
.L5:
        # Emitting if ((a > b)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting (a > b)
            # Emitting b
            movl 8(%ebp), %edi
            movl 4(%edi), %edi
            # Emitting a
            movl -24(%ebp), %esi
          cmpl %edi, %esi
          setg %al
          movzbl %al, %esi
        jle .L6
          # Emitting (...)
            # Emitting write(a)
              # Emitting a
              movl -24(%ebp), %esi
            sub $16, %esp
            movl %esi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
        jmp .L7
.L6:
          # Emitting (...)
            # Emitting write(666)
              # Emitting 666
              movl $666, %esi
            sub $16, %esp
            movl %esi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
.L7:
        # Emitting if ((a > b)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting (a > b)
            # Emitting b
            movl 8(%ebp), %esi
            movl 4(%esi), %esi
            # Emitting a
            movl -24(%ebp), %edi
          cmpl %esi, %edi
          setg %al
          movzbl %al, %edi
        jle .L8
          # Emitting (...)
            # Emitting write(a)
              # Emitting a
              movl -24(%ebp), %edi
            sub $16, %esp
            movl %edi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
        jmp .L9
.L8:
          # Emitting (...)
            # Emitting write(666)
              # Emitting 666
              movl $666, %edi
            sub $16, %esp
            movl %edi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
.L9:
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        # Emitting if ((false && true)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting (false && true)
            # Emitting true
            movl $1, %edi
            # Emitting false
            movl $0, %esi
          andl %edi, %esi
          cmpl $0, %esi
        je .L10
          # Emitting (...)
            # Emitting write(a)
              # Emitting a
              movl -24(%ebp), %esi
            sub $16, %esp
            movl %esi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
        jmp .L11
.L10:
          # Emitting (...)
            # Emitting write(666)
              # Emitting 666
              movl $666, %esi
            sub $16, %esp
            movl %esi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
.L11:
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        # Emitting if ((bt || bf)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting (bt || bf)
            # Emitting bf
            movl -20(%ebp), %esi
            # Emitting bt
            movl -16(%ebp), %edi
          orl %esi, %edi
          cmpl $0, %edi
        je .L12
          # Emitting (...)
            # Emitting write(1)
              # Emitting 1
              movl $1, %edi
            sub $16, %esp
            movl %edi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
        jmp .L13
.L12:
          # Emitting (...)
            # Emitting write(0)
              # Emitting 0
              movl $0, %edi
            sub $16, %esp
            movl %edi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
.L13:
        # Emitting write((3 * 4))
          # Emitting (3 * 4)
            # Emitting 4
            movl $4, %edi
            # Emitting 3
            movl $3, %esi
          imul %edi, %esi
        sub $16, %esp
        movl %esi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        # Emitting write((3 + 4))
          # Emitting (3 + 4)
            # Emitting 4
            movl $4, %esi
            # Emitting 3
            movl $3, %edi
          add %esi, %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        # Emitting write((3 - 4))
          # Emitting (3 - 4)
            # Emitting 4
            movl $4, %edi
            # Emitting 3
            movl $3, %esi
          sub %edi, %esi
        sub $16, %esp
        movl %esi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        # Emitting write((13 % 7))
          # Emitting (13 % 7)
            # Emitting 7
            movl $7, %esi
            # Emitting 13
            movl $13, %edi
          pushl %esi
          pushl %edi
          popl %eax
          popl %ebx
          cltd
          idivl %ebx
          movl %edx, %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        # Emitting write((17 / 7))
          # Emitting (17 / 7)
            # Emitting 7
            movl $7, %edi
            # Emitting 17
            movl $17, %esi
          pushl %edi
          pushl %esi
          popl %eax
          popl %ebx
          cltd
          idivl %ebx
          movl %eax, %esi
        sub $16, %esp
        movl %esi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting bt = (3 < 4)
          # Emitting (3 < 4)
            # Emitting 4
            movl $4, %esi
            # Emitting 3
            movl $3, %edi
          cmpl %esi, %edi
          setl %al
          movzbl %al, %edi
        movl %edi, -16(%ebp)
        # Emitting bt = (4 < 3)
          # Emitting (4 < 3)
            # Emitting 3
            movl $3, %edi
            # Emitting 4
            movl $4, %esi
          cmpl %edi, %esi
          setl %al
          movzbl %al, %esi
        movl %esi, -16(%ebp)
        # Emitting bt = (4 < 4)
          # Emitting (4 < 4)
            # Emitting 4
            movl $4, %esi
            # Emitting 4
            movl $4, %edi
          cmpl %esi, %edi
          setl %al
          movzbl %al, %edi
        movl %edi, -16(%ebp)
        # Emitting bt = (3 <= 4)
          # Emitting (3 <= 4)
            # Emitting 4
            movl $4, %edi
            # Emitting 3
            movl $3, %esi
          cmpl %edi, %esi
          setle %al
          movzbl %al, %esi
        movl %esi, -16(%ebp)
        # Emitting bt = (4 <= 3)
          # Emitting (4 <= 3)
            # Emitting 3
            movl $3, %esi
            # Emitting 4
            movl $4, %edi
          cmpl %esi, %edi
          setle %al
          movzbl %al, %edi
        movl %edi, -16(%ebp)
        # Emitting bt = (4 <= 4)
          # Emitting (4 <= 4)
            # Emitting 4
            movl $4, %edi
            # Emitting 4
            movl $4, %esi
          cmpl %edi, %esi
          setle %al
          movzbl %al, %esi
        movl %esi, -16(%ebp)
        # Emitting bt = (3 > 4)
          # Emitting (3 > 4)
            # Emitting 4
            movl $4, %esi
            # Emitting 3
            movl $3, %edi
          cmpl %esi, %edi
          setg %al
          movzbl %al, %edi
        movl %edi, -16(%ebp)
        # Emitting bt = (4 > 3)
          # Emitting (4 > 3)
            # Emitting 3
            movl $3, %edi
            # Emitting 4
            movl $4, %esi
          cmpl %edi, %esi
          setg %al
          movzbl %al, %esi
        movl %esi, -16(%ebp)
        # Emitting bt = (4 > 4)
          # Emitting (4 > 4)
            # Emitting 4
            movl $4, %esi
            # Emitting 4
            movl $4, %edi
          cmpl %esi, %edi
          setg %al
          movzbl %al, %edi
        movl %edi, -16(%ebp)
        # Emitting bt = (3 >= 4)
          # Emitting (3 >= 4)
            # Emitting 4
            movl $4, %edi
            # Emitting 3
            movl $3, %esi
          cmpl %edi, %esi
          setge %al
          movzbl %al, %esi
        movl %esi, -16(%ebp)
        # Emitting bt = (4 >= 3)
          # Emitting (4 >= 3)
            # Emitting 3
            movl $3, %esi
            # Emitting 4
            movl $4, %edi
          cmpl %esi, %edi
          setge %al
          movzbl %al, %edi
        movl %edi, -16(%ebp)
        # Emitting bt = (4 >= 4)
          # Emitting (4 >= 4)
            # Emitting 4
            movl $4, %edi
            # Emitting 4
            movl $4, %esi
          cmpl %edi, %esi
          setge %al
          movzbl %al, %esi
        movl %esi, -16(%ebp)
        # Emitting bt = (true && true)
          # Emitting (true && true)
            # Emitting true
            movl $1, %esi
            # Emitting true
            movl $1, %edi
          andl %esi, %edi
          cmpl $0, %edi
        movl %edi, -16(%ebp)
        # Emitting bt = (true && false)
          # Emitting (true && false)
            # Emitting false
            movl $0, %edi
            # Emitting true
            movl $1, %esi
          andl %edi, %esi
          cmpl $0, %esi
        movl %esi, -16(%ebp)
        # Emitting bt = (false && false)
          # Emitting (false && false)
            # Emitting false
            movl $0, %esi
            # Emitting false
            movl $0, %edi
          andl %esi, %edi
          cmpl $0, %edi
        movl %edi, -16(%ebp)
        # Emitting bt = (true || true)
          # Emitting (true || true)
            # Emitting true
            movl $1, %edi
            # Emitting true
            movl $1, %esi
          orl %edi, %esi
          cmpl $0, %esi
        movl %esi, -16(%ebp)
        # Emitting bt = (true || false)
          # Emitting (true || false)
            # Emitting false
            movl $0, %esi
            # Emitting true
            movl $1, %edi
          orl %esi, %edi
          cmpl $0, %edi
        movl %edi, -16(%ebp)
        # Emitting bt = (false || false)
          # Emitting (false || false)
            # Emitting false
            movl $0, %edi
            # Emitting false
            movl $0, %esi
          orl %edi, %esi
          cmpl $0, %esi
        movl %esi, -16(%ebp)
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        # Emitting if (bt) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting bt
          movl -16(%ebp), %esi
        cmpl $0, %esi
        je .L14
          # Emitting (...)
            # Emitting write(1)
              # Emitting 1
              movl $1, %esi
            sub $16, %esp
            movl %esi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
        jmp .L15
.L14:
          # Emitting (...)
            # Emitting write(0)
              # Emitting 0
              movl $0, %esi
            sub $16, %esp
            movl %esi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
.L15:
    # method suffix
    movl $0, %eax
    leave
    ret
