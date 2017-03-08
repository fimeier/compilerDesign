  # Emitting class Main {...}
    # Emitting void main(...) {...}
      # Emitting (...)
        # Emitting int r1
        # Emitting int i0
        # Emitting int i1
      # Emitting (...)
        # Emitting i0 = 5
        # Emitting i1 = 2
        # Emitting r1 = (i1 * 3)
          # Emitting i1
          # Emitting 3
        # Emitting write(r1)
          # Emitting r1
          movl r1, %edi
        sub $16, %esp
        # Emitting writeln()
        # Emitting r1 = (i0 * i1)
          # Emitting i0
          # Emitting i1
        # Emitting write(r1)
          # Emitting r1
          movl r1, %edx
        sub $16, %esp
        # Emitting writeln()
        # Emitting r1 = (((r1 * i0) * i1) * 3)
          # Emitting ((r1 * i0) * i1)
            # Emitting (r1 * i0)
              # Emitting r1
              # Emitting i0
            # Emitting i1
          # Emitting 3
        # Emitting write(r1)
          # Emitting r1
          movl r1, %ebx
        sub $16, %esp
        # Emitting writeln()
