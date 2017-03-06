  # Emitting class Main {...}
    # Emitting void main(...) {...}
      # Emitting (...)
        # Emitting int r1
        # Emitting int r2
        # Emitting int i0
        # Emitting int i1
        # Emitting int i2
      # Emitting (...)
        # Emitting i0 = 5
        # Emitting i1 = read()
        # Emitting r1 = (i0 + i1)
          # Emitting i0
          # Emitting i1
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
        # Emitting write((r1 - 3))
          # Emitting (r1 - 3)
