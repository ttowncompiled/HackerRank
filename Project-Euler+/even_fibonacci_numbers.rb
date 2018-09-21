#!/bin/ruby

################################################################################
# Let a, b, c be the first three terms of the Fibonacci sequence
# which are a=1, b=1, c=2. Every third term of the Fibonacci sequence is even
# and all other terms of the sequence are odd. Therefore, we can compute
# our solution by computing three terms of the sequence each iteration
# and summing the third term (c).
################################################################################

t = gets.strip.to_i
(1..t).each do
    n = gets.strip.to_i
    a, b, c, s = 1, 1, 2, 0
    while c <= n                    # cannot exceed n
        s += c                      # must add at top of loop to ensure : c <= n
        a, b = 2*b + a, 3*b + 2*a
        c = a + b
    end
    puts s
end
