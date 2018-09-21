#!/bin/ruby

################################################################################
# We can use the Sieve of Eratosthenes to compute our solution. The Sieve
# of Eratosthenes requires an integer argument X and it generates all primes
# that are less than or equal to X. In this case, we only want primes
# smaller than 10^6, so we use X = 10^6. We can use the Sieve to fill
# an array of prime sums where each index of the array i is the sum of all
# primes <= i. For each test case, we can check this array in O(1) time
# for the solution. The Sieve is O(X) and filling the array is O(X). However,
# as these are computed before executing the test cases, they can be
# considered to be O(1).
################################################################################

x = 1000000                                     # Sieve of Eratosthenes
d = (1..x).to_a                                 # requires a mutable array of length X
s = [ 0 ]                                       # solution array, no primes <= 1
(2..x).each do |i|
    if d[i-1] > 1                               # non-primes = 1
        s[i-1] = s[i-2] + i                     # d[i-1] > 1, i is prime, increase the sum
        (i..x).step(i).each{ |j| d[j-1] = 1}    # each d[j-1] is a mult of i, d[j-1] is Non-prime
    elsif
        s[i-1] = s[i-2]                         # no new primes, sum is the same as before
    end
end

t = gets.strip.to_i
(1..t).each do
    n = gets.strip.to_i
    puts s[n-1]                                 # the solution that was computed prior
end
