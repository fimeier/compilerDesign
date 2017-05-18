.section .data
	vtable_Main_array:
		.int vtable_Object
	vtable_int_array:
		.int vtable_Object
	vtable_Object:
		.int 0
	vtable_Main:
		.int vtable_Object
		.int Main_main
	vtable_boolean_array:
		.int vtable_Object
	STR_NL:
		.string "\n"
	STR_D:
		.string "%d"
	BASE_PT:
	.int 0
	STACK_PT:
	.int 0
.section .text
# start: Main-Class___________________________________________________
.global main

main:
# start: prolog
movl %esp, STACK_PT
movl %ebp, BASE_PT
pushl %ebp
movl %esp, %ebp
# end: prolog
# Create Main object and safe its address to %eax
pushl $4
pushl $2
call calloc
addl $8, %esp
# copy the pinter to the vtable to the Main Object
movl $vtable_Main, (%eax)
pushl %eax
call Main_main
addl $4, %esp
movl %ebp, %esp
popl %ebp
movl $0, %eax
ret
# end: Main-Class_____________________________________________________
.ERROR_EXIT:
movl STACK_PT, %esp
movl BASE_PT, %ebp
ret
  # Emitting class Main {...}
    # Emitting int b
    # Emitting void main(...) {...}
Main_main:
    # store old ebp, set uf new ebp
    pushl %ebp
    movl %esp, %ebp
    # set local variables:
    # variable bt
    pushl $0
    # variable bf
    pushl $0
    # variable a
    pushl $0
      # Emitting (...)
        # Emitting b = 300
# ________assign______________________________________________________
          # Emitting 300
          movl $300, %edi
        movl 8(%ebp), %esi
        movl %edi, 4(%esi)
        # Emitting a = 200
# ________assign______________________________________________________
          # Emitting 200
          movl $200, %edi
        movl %edi, -12(%ebp)
        # Emitting bt = true
# ________assign______________________________________________________
          # Emitting true
          movl $1, %edi
        movl %edi, -4(%ebp)
        # Emitting bf = false
# ________assign______________________________________________________
          # Emitting false
          movl $0, %edi
        movl %edi, -8(%ebp)
        # Emitting if ((a < b)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting (a < b)
            # Emitting b
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 4(%edi), %edi
            # Emitting a
# ____________var_____________________________________________________
            movl -12(%ebp), %esi
          cmpl %edi, %esi
          setl %al
          movzbl %al, %esi
        jge .L3
          # Emitting (...)
            # Emitting write(a)
              # Emitting a
# ______________var___________________________________________________
              movl -12(%ebp), %esi
            sub $16, %esp
            movl %esi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
        jmp .L4
.L3:
          # Emitting (...)
            # Emitting write(666)
              # Emitting 666
              movl $666, %esi
            sub $16, %esp
            movl %esi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
.L4:
        # Emitting if ((a <= b)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting (a <= b)
            # Emitting b
# ____________var_____________________________________________________
            movl 8(%ebp), %esi
            movl 4(%esi), %esi
            # Emitting a
# ____________var_____________________________________________________
            movl -12(%ebp), %edi
          cmpl %esi, %edi
          setle %al
          movzbl %al, %edi
        jg .L6
          # Emitting (...)
            # Emitting write(a)
              # Emitting a
# ______________var___________________________________________________
              movl -12(%ebp), %edi
            sub $16, %esp
            movl %edi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
        jmp .L7
.L6:
          # Emitting (...)
            # Emitting write(666)
              # Emitting 666
              movl $666, %edi
            sub $16, %esp
            movl %edi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
.L7:
        # Emitting if ((a > b)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting (a > b)
            # Emitting b
# ____________var_____________________________________________________
            movl 8(%ebp), %edi
            movl 4(%edi), %edi
            # Emitting a
# ____________var_____________________________________________________
            movl -12(%ebp), %esi
          cmpl %edi, %esi
          setg %al
          movzbl %al, %esi
        jle .L9
          # Emitting (...)
            # Emitting write(a)
              # Emitting a
# ______________var___________________________________________________
              movl -12(%ebp), %esi
            sub $16, %esp
            movl %esi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
        jmp .L10
.L9:
          # Emitting (...)
            # Emitting write(666)
              # Emitting 666
              movl $666, %esi
            sub $16, %esp
            movl %esi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
.L10:
        # Emitting if ((a > b)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting (a > b)
            # Emitting b
# ____________var_____________________________________________________
            movl 8(%ebp), %esi
            movl 4(%esi), %esi
            # Emitting a
# ____________var_____________________________________________________
            movl -12(%ebp), %edi
          cmpl %esi, %edi
          setg %al
          movzbl %al, %edi
        jle .L12
          # Emitting (...)
            # Emitting write(a)
              # Emitting a
# ______________var___________________________________________________
              movl -12(%ebp), %edi
            sub $16, %esp
            movl %edi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
        jmp .L13
.L12:
          # Emitting (...)
            # Emitting write(666)
              # Emitting 666
              movl $666, %edi
            sub $16, %esp
            movl %edi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
.L13:
        # Emitting if (!(true)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting !(true)
            # Emitting true
            movl $1, %edi
          negl %edi
          incl %edi
          cmpl $0, %edi
        je .L15
          # Emitting (...)
            # Emitting write(a)
              # Emitting a
# ______________var___________________________________________________
              movl -12(%ebp), %edi
            sub $16, %esp
            movl %edi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
        jmp .L16
.L15:
          # Emitting (...)
            # Emitting write(666)
              # Emitting 666
              movl $666, %edi
            sub $16, %esp
            movl %edi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
.L16:
        # Emitting if (!(false)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting !(false)
            # Emitting false
            movl $0, %edi
          negl %edi
          incl %edi
          cmpl $0, %edi
        je .L18
          # Emitting (...)
            # Emitting write(a)
              # Emitting a
# ______________var___________________________________________________
              movl -12(%ebp), %edi
            sub $16, %esp
            movl %edi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
        jmp .L19
.L18:
          # Emitting (...)
            # Emitting write(666)
              # Emitting 666
              movl $666, %edi
            sub $16, %esp
            movl %edi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
.L19:
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
        je .L21
          # Emitting (...)
            # Emitting write(a)
              # Emitting a
# ______________var___________________________________________________
              movl -12(%ebp), %esi
            sub $16, %esp
            movl %esi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
        jmp .L22
.L21:
          # Emitting (...)
            # Emitting write(666)
              # Emitting 666
              movl $666, %esi
            sub $16, %esp
            movl %esi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
.L22:
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        # Emitting if ((bt || bf)) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting (bt || bf)
            # Emitting bf
# ____________var_____________________________________________________
            movl -8(%ebp), %esi
            # Emitting bt
# ____________var_____________________________________________________
            movl -4(%ebp), %edi
          orl %esi, %edi
          cmpl $0, %edi
        je .L24
          # Emitting (...)
            # Emitting write(1)
              # Emitting 1
              movl $1, %edi
            sub $16, %esp
            movl %edi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
        jmp .L25
.L24:
          # Emitting (...)
            # Emitting write(0)
              # Emitting 0
              movl $0, %edi
            sub $16, %esp
            movl %edi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
.L25:
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
          cmpl $0, %esi
          jne .L26
          movl $7, %eax
          jmp .ERROR_EXIT
.L26:
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
          cmpl $0, %edi
          jne .L27
          movl $7, %eax
          jmp .ERROR_EXIT
.L27:
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
# ________assign______________________________________________________
          # Emitting (3 < 4)
            # Emitting 4
            movl $4, %esi
            # Emitting 3
            movl $3, %edi
          cmpl %esi, %edi
          setl %al
          movzbl %al, %edi
        movl %edi, -4(%ebp)
        # Emitting bt = (4 < 3)
# ________assign______________________________________________________
          # Emitting (4 < 3)
            # Emitting 3
            movl $3, %edi
            # Emitting 4
            movl $4, %esi
          cmpl %edi, %esi
          setl %al
          movzbl %al, %esi
        movl %esi, -4(%ebp)
        # Emitting bt = (4 < 4)
# ________assign______________________________________________________
          # Emitting (4 < 4)
            # Emitting 4
            movl $4, %esi
            # Emitting 4
            movl $4, %edi
          cmpl %esi, %edi
          setl %al
          movzbl %al, %edi
        movl %edi, -4(%ebp)
        # Emitting bt = (3 <= 4)
# ________assign______________________________________________________
          # Emitting (3 <= 4)
            # Emitting 4
            movl $4, %edi
            # Emitting 3
            movl $3, %esi
          cmpl %edi, %esi
          setle %al
          movzbl %al, %esi
        movl %esi, -4(%ebp)
        # Emitting bt = (4 <= 3)
# ________assign______________________________________________________
          # Emitting (4 <= 3)
            # Emitting 3
            movl $3, %esi
            # Emitting 4
            movl $4, %edi
          cmpl %esi, %edi
          setle %al
          movzbl %al, %edi
        movl %edi, -4(%ebp)
        # Emitting bt = (4 <= 4)
# ________assign______________________________________________________
          # Emitting (4 <= 4)
            # Emitting 4
            movl $4, %edi
            # Emitting 4
            movl $4, %esi
          cmpl %edi, %esi
          setle %al
          movzbl %al, %esi
        movl %esi, -4(%ebp)
        # Emitting bt = (3 > 4)
# ________assign______________________________________________________
          # Emitting (3 > 4)
            # Emitting 4
            movl $4, %esi
            # Emitting 3
            movl $3, %edi
          cmpl %esi, %edi
          setg %al
          movzbl %al, %edi
        movl %edi, -4(%ebp)
        # Emitting bt = (4 > 3)
# ________assign______________________________________________________
          # Emitting (4 > 3)
            # Emitting 3
            movl $3, %edi
            # Emitting 4
            movl $4, %esi
          cmpl %edi, %esi
          setg %al
          movzbl %al, %esi
        movl %esi, -4(%ebp)
        # Emitting bt = (4 > 4)
# ________assign______________________________________________________
          # Emitting (4 > 4)
            # Emitting 4
            movl $4, %esi
            # Emitting 4
            movl $4, %edi
          cmpl %esi, %edi
          setg %al
          movzbl %al, %edi
        movl %edi, -4(%ebp)
        # Emitting bt = (3 >= 4)
# ________assign______________________________________________________
          # Emitting (3 >= 4)
            # Emitting 4
            movl $4, %edi
            # Emitting 3
            movl $3, %esi
          cmpl %edi, %esi
          setge %al
          movzbl %al, %esi
        movl %esi, -4(%ebp)
        # Emitting bt = (4 >= 3)
# ________assign______________________________________________________
          # Emitting (4 >= 3)
            # Emitting 3
            movl $3, %esi
            # Emitting 4
            movl $4, %edi
          cmpl %esi, %edi
          setge %al
          movzbl %al, %edi
        movl %edi, -4(%ebp)
        # Emitting bt = (4 >= 4)
# ________assign______________________________________________________
          # Emitting (4 >= 4)
            # Emitting 4
            movl $4, %edi
            # Emitting 4
            movl $4, %esi
          cmpl %edi, %esi
          setge %al
          movzbl %al, %esi
        movl %esi, -4(%ebp)
        # Emitting bt = (true && true)
# ________assign______________________________________________________
          # Emitting (true && true)
            # Emitting true
            movl $1, %esi
            # Emitting true
            movl $1, %edi
          andl %esi, %edi
          cmpl $0, %edi
        movl %edi, -4(%ebp)
        # Emitting bt = (true && false)
# ________assign______________________________________________________
          # Emitting (true && false)
            # Emitting false
            movl $0, %edi
            # Emitting true
            movl $1, %esi
          andl %edi, %esi
          cmpl $0, %esi
        movl %esi, -4(%ebp)
        # Emitting bt = (false && false)
# ________assign______________________________________________________
          # Emitting (false && false)
            # Emitting false
            movl $0, %esi
            # Emitting false
            movl $0, %edi
          andl %esi, %edi
          cmpl $0, %edi
        movl %edi, -4(%ebp)
        # Emitting bt = (true || true)
# ________assign______________________________________________________
          # Emitting (true || true)
            # Emitting true
            movl $1, %edi
            # Emitting true
            movl $1, %esi
          orl %edi, %esi
          cmpl $0, %esi
        movl %esi, -4(%ebp)
        # Emitting bt = (true || false)
# ________assign______________________________________________________
          # Emitting (true || false)
            # Emitting false
            movl $0, %esi
            # Emitting true
            movl $1, %edi
          orl %esi, %edi
          cmpl $0, %edi
        movl %edi, -4(%ebp)
        # Emitting bt = (false || false)
# ________assign______________________________________________________
          # Emitting (false || false)
            # Emitting false
            movl $0, %edi
            # Emitting false
            movl $0, %esi
          orl %edi, %esi
          cmpl $0, %esi
        movl %esi, -4(%ebp)
        # Emitting bt = !(bf)
# ________assign______________________________________________________
          # Emitting !(bf)
            # Emitting bf
# ____________var_____________________________________________________
            movl -8(%ebp), %esi
          negl %esi
          incl %esi
          cmpl $0, %esi
        movl %esi, -4(%ebp)
        # Emitting bt = !(true)
# ________assign______________________________________________________
          # Emitting !(true)
            # Emitting true
            movl $1, %esi
          negl %esi
          incl %esi
          cmpl $0, %esi
        movl %esi, -4(%ebp)
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        # Emitting if (bt) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting bt
# __________var_______________________________________________________
          movl -4(%ebp), %esi
        cmpl $0, %esi
        je .L29
          # Emitting (...)
            # Emitting write(1)
              # Emitting 1
              movl $1, %esi
            sub $16, %esp
            movl %esi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
        jmp .L30
.L29:
          # Emitting (...)
            # Emitting write(0)
              # Emitting 0
              movl $0, %esi
            sub $16, %esp
            movl %esi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
.L30:
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        # Emitting write(+(1))
          # Emitting +(1)
            # Emitting 1
            movl $1, %esi
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
        # Emitting write(-(0))
          # Emitting -(0)
            # Emitting 0
            movl $0, %esi
          negl %esi
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
        # Emitting bt = true
# ________assign______________________________________________________
          # Emitting true
          movl $1, %esi
        movl %esi, -4(%ebp)
        # Emitting while ((!(false) && bt)) {...}
# ________whileLoop___________________________________________________
.L31:
          # Emitting (!(false) && bt)
            # Emitting bt
# ____________var_____________________________________________________
            movl -4(%ebp), %esi
            # Emitting !(false)
              # Emitting false
              movl $0, %edi
            negl %edi
            incl %edi
            cmpl $0, %edi
          andl %esi, %edi
          cmpl $0, %edi
        je .L32
          # Emitting (...)
            # Emitting write(1)
              # Emitting 1
              movl $1, %edi
            sub $16, %esp
            movl %edi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
            # Emitting bt = !(bt)
# ____________assign__________________________________________________
              # Emitting !(bt)
                # Emitting bt
# ________________var_________________________________________________
                movl -4(%ebp), %edi
              negl %edi
              incl %edi
              cmpl $0, %edi
            movl %edi, -4(%ebp)
        jmp .L31
.L32:
.L33:
        # Emitting write(0)
          # Emitting 0
          movl $0, %edi
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
        # Emitting bt = (true == true)
# ________assign______________________________________________________
          # Emitting (true == true)
            # Emitting true
            movl $1, %edi
            # Emitting true
            movl $1, %esi
          cmpl %edi, %esi
          je .L34
          movl $0, %esi
          jmp .L35
.L34:
          movl $1, %esi
.L35:
        movl %esi, -4(%ebp)
        # Emitting writeln()
        sub $16, %esp
        movl $STR_NL, 0(%esp)
        call printf
        add $16, %esp
        # Emitting if (bt) {...} else {...}
# ________ifElse______________________________________________________
          # Emitting bt
# __________var_______________________________________________________
          movl -4(%ebp), %esi
        cmpl $0, %esi
        je .L37
          # Emitting (...)
            # Emitting write(1)
              # Emitting 1
              movl $1, %esi
            sub $16, %esp
            movl %esi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
        jmp .L38
.L37:
          # Emitting (...)
            # Emitting write(0)
              # Emitting 0
              movl $0, %esi
            sub $16, %esp
            movl %esi, 4(%esp)
            movl $STR_D, 0(%esp)
            call printf
            add $16, %esp
.L38:
    addl $12, %esp
    # restore old ebp
    movl %ebp, %esp
    popl %ebp
    ret
