  # Emitting class Main {...}
    # Emitting void main(...) {...}
      # Emitting (...)
        # Emitting int i0
      # Emitting (...)
        # Emitting i0 = 0
        # Emitting i0 = (5 + i0)
          # Emitting 5
          # Emitting i0
        # Emitting write(i0)
          # Emitting i0
          movl i0, %edi
        sub $16, %esp
        # Emitting writeln()
        # Emitting i0 = (i0 + 5)
          # Emitting i0
          # Emitting 5
        # Emitting write(i0)
          # Emitting i0
          movl i0, %edx
        sub $16, %esp
        # Emitting writeln()
        # Emitting i0 = ((i0 + 5) + 3)
          # Emitting (i0 + 5)
            # Emitting i0
            # Emitting 5
          # Emitting 3
        # Emitting write(i0)
          # Emitting i0
          movl i0, %ebx
        sub $16, %esp
        # Emitting writeln()
