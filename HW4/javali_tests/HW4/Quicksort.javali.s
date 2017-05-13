  # Emitting class Record {...}
    # Emitting int a
    # Emitting void print(...) {...}
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
        # Emitting write(a)
          # Emitting a
          movl var_a, %edi
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
    # Emitting Record[] a
    # Emitting int i
    # Emitting void swap(...) {...}
    .section .data
STR_NL:
    .string "\n"
STR_D:
    .string "%d"
    .section .data
var_temp:
    .int 0
    .section .text
    .globl main
main:
    enter $8, $0
    and $-16, %esp
      # Emitting (...)
        # Emitting temp = r1.a
          # Emitting r1.a
