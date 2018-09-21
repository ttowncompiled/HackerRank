#!/bin/ruby

################################################################################
# To solve this problem efficiently, we first divide n by 2 until n is odd.
# By doing so, we only have to check odd divisors of n. If n = 1, then
# N is a power of 2. If not, if we can reduce n to a prime factor,
# then n will be the largest prime factor. Therefore, we only check divisors
# of n <= sqrt(n) which are also odd. If there is a duplicity of the largest
# prime factor of n, then n will be reduced to 1, leaving d as the largest
# prime factor of n.
################################################################################

t = gets.strip.to_i
(1..t).each do
    n = gets.strip.to_i
    while n % 2 == 0                # divide n by 2 until n is odd
        n = n / 2
    end
    if n == 1
        puts 2                      # N is a power of 2
    else
        d = 3
        while d <= Math.sqrt(n)     # reduce n to a prime
            if n % d == 0
                n = n/d             # divide n by d until n % d > 0, removes duplicate factors
            else
                d += 2              # n is odd, check only odd divisors
            end
        end
        if n == 1                   # n = 1, there is no factor of N greater than d
            puts d
        else
            puts n                  # n > 1, n is a prime factor of N
        end
    end
end
