#!/bin/ruby

################################################################################
# Compute the largest palindrome that is the product of two 3-digit numbers.
# We can start with 999*999 and work down to reduce the number of computations.
# If a*b < current_largest_palindrome, then we can stop. The next product of
# a*b will be smaller. A palindrome can be defined as any string that matches
# its reverse. If we find a palindrome for some value a*b, if b <= a, then
# that is the largest palindrome for a.
################################################################################

t = gets.strip.to_i
(1..t).each do
    n = gets.strip.to_i
    a, best_palindrome = 999, 101101
    while 100 <= a && best_palindrome <= a**2                   # if a*a < palindrome, stop
        b = a
        while 100 <= b && best_palindrome <= a*b                # if a*b < palindrome, stop
            d = a*b
            if d < n && d.to_s == d.to_s.reverse                # match string to its reverse
                best_palindrome = [ best_palindrome, d ].max    # take largest palindrome
                break                                           # largest palindrome for a
            end
            b -= 1                                              # work down from 999*999
        end
        a -= 1                                                  # work down from 999*999
    end
    puts best_palindrome
end
