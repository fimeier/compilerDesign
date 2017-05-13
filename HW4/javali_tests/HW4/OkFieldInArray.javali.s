  # Emitting class A {...}
    # Emitting int field
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
        # Emitting write(1)
          # Emitting 1
          movl $1, %edi
        sub $16, %esp
        movl %edi, 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting write(field)
          # Emitting field
          movl var_field, %edi
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
    # Emitting A[] x
    # Emitting void main(...) {...}
    .section .data
STR_NL:
    .string "\n"
STR_D:
    .string "%d"
    .section .data
var_i:
    .int 0
    .section .text
    .globl main
main:
    enter $8, $0
    and $-16, %esp
      # Emitting (...)
        # Emitting x = new A[][2]
          # Emitting new A[][2]
