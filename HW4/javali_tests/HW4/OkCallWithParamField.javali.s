  # Emitting class A {...}
    # Emitting int i
    # Emitting void foo(...) {...}
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
        # Emitting write(p)
          # Emitting p
          movl var_p, %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting write(i)
          # Emitting i
          movl var_i, %edi
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
