  # Emitting class Main {...}
    # Emitting void main(...) {...}
      # Emitting (...)
        # Emitting int A
        # Emitting int B
        # Emitting int a
        # Emitting int b
        # Emitting int c
        # Emitting int d
      # Emitting (...)
        # Emitting A = 1
        # Emitting B = 1
        # Emitting a = (A * -(B))
          # Emitting A
          # Emitting -(B)
            # Emitting B
        # Emitting b = (-(A) * B)
          # Emitting -(A)
            # Emitting A
          # Emitting B
        # Emitting c = -((A + B))
          # Emitting (A + B)
            # Emitting A
            # Emitting B
        # Emitting d = -((A * B))
          # Emitting (A * B)
            # Emitting A
            # Emitting B
        # Emitting write(a)
          # Emitting a
          movl a, %edi
        sub $16, %esp
        # Emitting writeln()
        # Emitting write(b)
          # Emitting b
          movl b, %edx
        sub $16, %esp
        # Emitting writeln()
        # Emitting write(c)
          # Emitting c
          movl c, %ebx
        sub $16, %esp
        # Emitting writeln()
        # Emitting write(d)
          # Emitting d