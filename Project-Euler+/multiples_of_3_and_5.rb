#!/bin/ruby

################################################################################
# Can use arithmetic progression for an O(1) solution
# According to arithmetic progression, for any multiple d:
#
#   s = n(2a + (n-1)d)/2, where
#       n : number of multiples of d less than or equal to n
#       a : the first multiple in the sequence
#
# Since d is the first multiple in the sequence (a=d), we have that:
#
#   s = d * n * (n-1) / 2
#
# Also, we have to be sure not to double count multiples of 5*3
################################################################################

t = gets.strip.to_i
(1..t).each do
    n = gets.strip.to_i
    s = 0
    if 3 < n
        k = (n-1)/3             # multiples must be less than n
        s += 3 * k * (k+1) / 2  # sum of multiples of 3 (using AP)
    end
    if 5 < n
        k = (n-1)/5             # multiples must be less than n
        s += 5 * k * (k+1) / 2  # sum of multiples of 5 (using AP)
    end
    if 15 < n
        k = (n-1)/15            # multiples must be less than n
        s -= 15 * k * (k+1) / 2 # sum of multiples of 15 (using AP)
    end
    puts s
end
