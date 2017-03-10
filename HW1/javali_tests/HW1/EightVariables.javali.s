  # Emitting class Main {...}
    # Emitting void main(...) {...}
    .section .data
STR_D:
    .string "%d"
      # Emitting int r1
var_r1:
      	.int 0
      # Emitting int r2
var_r2:
      	.int 0
      # Emitting int r3
var_r3:
      	.int 0
      # Emitting int i0
var_i0:
      	.int 0
      # Emitting int i1
var_i1:
      	.int 0
      # Emitting int i2
var_i2:
      	.int 0
      # Emitting int i3
var_i3:
      	.int 0
      # Emitting int i4
var_i4:
      	.int 0
      # Emitting int i5
var_i5:
      	.int 0
      # Emitting int i6
var_i6:
      	.int 0
      # Emitting int i7
var_i7:
      	.int 0
    	.section .text
    	.globl main
    main:
      # Emitting i0 = 0
        # Emitting 0
        movl $0, %edi
      movl %edi, var_i0
      # Emitting i1 = 1
        # Emitting 1
        movl $1, %edi
      movl %edi, var_i1
      # Emitting i2 = 2
        # Emitting 2
        movl $2, %edi
      movl %edi, var_i2
      # Emitting i3 = 3
        # Emitting 3
        movl $3, %edi
      movl %edi, var_i3
      # Emitting i4 = 4
        # Emitting 4
        movl $4, %edi
      movl %edi, var_i4
      # Emitting i5 = 5
        # Emitting 5
        movl $5, %edi
      movl %edi, var_i5
      # Emitting i6 = 6
        # Emitting 6
        movl $6, %edi
      movl %edi, var_i6
      # Emitting i7 = 7
        # Emitting 7
        movl $7, %edi
      movl %edi, var_i7
      # Emitting r1 = (i0 + (i1 + (i2 + (i3 + (i4 + (i5 + (i6 + i7)))))))
        # Emitting (i0 + (i1 + (i2 + (i3 + (i4 + (i5 + (i6 + i7)))))))
