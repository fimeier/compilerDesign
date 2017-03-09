  # Emitting class Main {...}
    # Emitting void main(...) {...}
    .section .data
    STR_D:
    	.string "%d"
    	.section .data
    var_a:
    	.int 0
    	.section .text
    	.globl main
    main:
      # Emitting int a
      # Emitting a = 10
      # Emitting write(a)
        # Emitting a
      sub $16, %esp
