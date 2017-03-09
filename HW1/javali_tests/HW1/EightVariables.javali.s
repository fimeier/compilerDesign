  # Emitting class Main {...}
    # Emitting void main(...) {...}
    .section .data
      # EmittingVardecl int r1

var_r1:
      	.int 0
      # EmittingVardecl int r2

var_r2:
      	.int 0
      # EmittingVardecl int r3

var_r3:
      	.int 0
      # EmittingVardecl int i0

var_i0:
      	.int 0
      # EmittingVardecl int i1

var_i1:
      	.int 0
      # EmittingVardecl int i2

var_i2:
      	.int 0
      # EmittingVardecl int i3

var_i3:
      	.int 0
      # EmittingVardecl int i4

var_i4:
      	.int 0
      # EmittingVardecl int i5

var_i5:
      	.int 0
      # EmittingVardecl int i6

var_i6:
      	.int 0
      # EmittingVardecl int i7

var_i7:
      	.int 0
    	.section .text
    	.globl main
    main:
      # Emitting i0 = 0
      # Emitting i1 = 1
      # Emitting i2 = 2
      # Emitting i3 = 3
      # Emitting i4 = 4
      # Emitting i5 = 5
      # Emitting i6 = 6
      # Emitting i7 = 7
      # Emitting r1 = (i0 + (i1 + (i2 + (i3 + (i4 + (i5 + (i6 + i7)))))))
        # Emitting i0
        # Emitting (i1 + (i2 + (i3 + (i4 + (i5 + (i6 + i7))))))
          # Emitting i1
          # Emitting (i2 + (i3 + (i4 + (i5 + (i6 + i7)))))
            # Emitting i2
            # Emitting (i3 + (i4 + (i5 + (i6 + i7))))
              # Emitting i3
              # Emitting (i4 + (i5 + (i6 + i7)))
                # Emitting i4
                # Emitting (i5 + (i6 + i7))
                  # Emitting i5
                  # Emitting (i6 + i7)
                    # Emitting i6
                    # Emitting i7
      # Emitting r2 = (((((((i0 + i1) + i2) + i3) + i4) + i5) + i6) + i7)
        # Emitting ((((((i0 + i1) + i2) + i3) + i4) + i5) + i6)
          # Emitting (((((i0 + i1) + i2) + i3) + i4) + i5)
            # Emitting ((((i0 + i1) + i2) + i3) + i4)
              # Emitting (((i0 + i1) + i2) + i3)
                # Emitting ((i0 + i1) + i2)
                  # Emitting (i0 + i1)
                    # Emitting i0
                    # Emitting i1
                  # Emitting i2
                # Emitting i3
              # Emitting i4
            # Emitting i5
          # Emitting i6
        # Emitting i7
      # Emitting r3 = (((i0 + i1) + (i2 + i3)) + ((i4 + i5) + (i6 + i7)))
        # Emitting ((i0 + i1) + (i2 + i3))
          # Emitting (i0 + i1)
            # Emitting i0
            # Emitting i1
          # Emitting (i2 + i3)
            # Emitting i2
            # Emitting i3
        # Emitting ((i4 + i5) + (i6 + i7))
          # Emitting (i4 + i5)
            # Emitting i4
            # Emitting i5
          # Emitting (i6 + i7)
            # Emitting i6
            # Emitting i7
      # Emitting write(r1)
        # Emitting r1
      sub $16, %esp
      # Emitting writeln()
      # Emitting write(r2)
        # Emitting r2
      sub $16, %esp
      # Emitting writeln()
      # Emitting write(r3)
        # Emitting r3
      sub $16, %esp
      # Emitting writeln()
