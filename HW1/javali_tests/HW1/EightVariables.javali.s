  # Emitting class Main {...}
    # Emitting void main(...) {...}
      # Emitting (...)
        # Emitting int r1
        # Emitting int r2
        # Emitting int r3
        # Emitting int i0
        # Emitting int i1
        # Emitting int i2
        # Emitting int i3
        # Emitting int i4
        # Emitting int i5
        # Emitting int i6
        # Emitting int i7
      # Emitting (...)
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
          movl r1, %edi
        sub $16, %esp
        movl EDI 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting writeln()
        sub $16, %esp
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting write(r2)
          # Emitting r2
          movl r2, %edx
        sub $16, %esp
        movl EDX 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting writeln()
        sub $16, %esp
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting write(r3)
          # Emitting r3
          movl r3, %ebx
        sub $16, %esp
        movl EBX 4(%esp)
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
        # Emitting writeln()
        sub $16, %esp
        movl $STR_D, 0(%esp)
        call printf
        add $16, %esp
