#!/bin/ruby

################################################################################
# There is an O(M**2) algorithm for generating M primes called the Sieve
# of Eratosthenes. This algorithm can be executed prior to the test cases.
# By using the Sieve, the solution to each test case can be looked up in O(1)
# time. Also, since the algorithm is prior to the test cases, it can
# technically be considered an O(1) algorithm. The only challenge with the
# Sieve is that it requires an integer parameter to use as the upper bound
# for the largest prime that the Sieve will generate, i.e. the Sieve of
# Eratosthenes generates all primes <= X. Therefore, we must determine what
# value of X has ~ 10,000 primes underneath it. We can use the Prime Number
# Theorem to determine that the number of primes <= X ~ X/log(X). For
# simplicity, we can choose x=120000. With X=120000, the number of primes
# is ~ 10260. Note: log(X) is the natural logarithm.
################################################################################

x = 120000                                      # Sieve of Eratosthenes
d, primes = (1..x).to_a, []                     # requires a mutable array of length X
(1..x).each do |i|
    if d[i-1] > 1                               # non-primes = 1
        primes.push(i)                          # d[i-1] > 1, i is prime (i = d[i-1])
        (i..x).step(i).each{ |j| d[j-1] = 1}    # each d[j-1] is a mult of i, d[j-1] is Non-prime
    end
end

t = gets.strip.to_i
(1..t).each do
    n = gets.strip.to_i
    puts primes[n-1]                            # the solution that was computed prior
end
