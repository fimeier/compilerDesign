  # Emitting class A {...}
    # Emitting void override(...) {...}
    .section .data
STR_NL:
    .string "\n"
STR_D:
    .string "%d"
    .section .data
    .section .text
    .globl main
main:
    enter $8, $0
    and $-16, %esp
      # Emitting (...)
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
    movl $0, %eax
    leave
    ret
    # Emitting void base(...) {...}
    .section .data
STR_NL:
    .string "\n"
STR_D:
    .string "%d"
    .section .data
    .section .text
    .globl main
main:
    enter $8, $0
    and $-16, %esp
      # Emitting (...)
        # Emitting write(1)
          # Emitting 1
          movl $1, %edi
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
    movl $0, %eax
    leave
    ret
  # Emitting class B {...}
    # Emitting void override(...) {...}
    .section .data
STR_NL:
    .string "\n"
STR_D:
    .string "%d"
    .section .data
    .section .text
    .globl main
main:
    enter $8, $0
    and $-16, %esp
      # Emitting (...)
        # Emitting write(2)
          # Emitting 2
          movl $2, %edi
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
    movl $0, %eax
    leave
    ret
    # Emitting void sub(...) {...}
    .section .data
STR_NL:
    .string "\n"
STR_D:
    .string "%d"
    .section .data
    .section .text
    .globl main
main:
    enter $8, $0
    and $-16, %esp
      # Emitting (...)
        # Emitting write(3)
          # Emitting 3
          movl $3, %edi
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
    movl $0, %eax
    leave
    ret
  # Emitting class Main {...}
    # Emitting void main(...) {...}
    .section .data
STR_NL:
    .string "\n"
STR_D:
    .string "%d"
    .section .data
