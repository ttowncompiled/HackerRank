#!/bin/ruby

################################################################################
# There is an O(N) solution to this problem. First, we must fill a solution
# array with all of the solutions for the first 1000 terms. To do this, we
# iterate over the possible trianglular numbers. Each triangular number
# can be calculated using arithmetic progression. Then, we compute the number
# of unique prime factors of each triangular number and the duplicity of
# each factor. If we have that a triangular number can be written as:
#
#   d = a**x * b**y * c**z * ..., then the number of divisors is
#   sigma(d) = (x+1)*(y+1)*(z+1)*...
#
#   This can be shown using a table where the number of factors is the
#   number of dimensions, the number of rows is determined by the
#   duplicity+1 of a factor, and the number of columns is determined
#   by the duplicity+1 of the factor in the next dimension. Each cell
#   in the table represents using the factor and the duplicity of
#   each factor selected by the cross-section of factors through that
#   cell. We must use duplicity+1 in case a factor isn't chosen,
#   i.e. the extra cell is the 0th duplicity of that factor.
#
# We can efficiently compute the divisors and their exponents by first
# calculating the number of the 2 factor. Then, we iterate over potential
# factors up to sqrt(d). Each time we locate a factor, we determine
# the exponent of the factor by iteratively dividing d by it.
# Once we've hit the sqrt of d, d will either be 1 or it will a prime.
# If it is a prime, then d is a factor of n so the number of divisors
# should be multiplied by 2 for d**1 | n. Once we have computed
# the number of divisors, we push the triangular number into s for each i
# in s such that i < sigma(d). This can all be done before the test cases
# so it is technically done in O(1) time while each test case can be looked
# up in O(1) time.
################################################################################

s, i = [], 1                    # the solution set and first i for triangular number
while s.length < 1000
    n = d = i * (i+1) / 2       # use arithmetic progression to compute triangular number
    divs = 1
    while d % 2 == 0            # check all even divisors of d
        d = d / 2
        divs += 1
    end
    j = 3
    while j <= Math.sqrt(d)     # only need to compute divisors of d until d is prime
        k = 0                   # number of instances of each divisor
        while d % j == 0
            d = d / j           # remove divisor from d
            k += 1              # count number of instances of divisor in d
        end
        divs *= (k+1)           # compute new number of divisors, if j not divisor, then k = 0
        j += 2                  # d is odd, only check odd divisors
    end
    if d > 1
        divs *= 2               # d is prime and is therefore a divisor, but only one instance of
    end
    while s.length < divs-1     # subtract by 1 so that number of divisors exceeds idx (1-indexed)
        s.push(n)               # push n so long as s.length = idx < sigma(n)
    end
    i += 1
end

t = gets.strip.to_i
(1..t).each do
    n = gets.strip.to_i
    puts s[n-1]                 # the solution that was computed prior
end
