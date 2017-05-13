  # Emitting class Main {...}
    # Emitting void main(...) {...}
    .section .data
STR_NL:
    .string "\n"
STR_D:
    .string "%d"
    .section .data
var_a:
    .int 0
    .section .text
    .globl main
main:
    enter $8, $0
    and $-16, %esp
      # Emitting (...)
        # Emitting a = this.fib(...)
          # Emitting this.fib(...)
