#!/bin/ruby

################################################################################
# The solution is the lcm or least common multiple of the numbers from 1 to N.
# This can be computed by computing the product of all terms divided by
# the product of the gcd, or greatest common divisor, of all pairs of terms.
# A simple way to compute the gcd of all pairs of terms is to iteratively
# compute the solution by computing the product : s * gcd(s, next_term).
################################################################################

t = gets.strip.to_i
(1..t).each do
    n = gets.strip.to_i
    s = (1..n).reduce{ |acc, i| acc * (i / acc.gcd(i)) } # love the reduce method
    puts s
end
