#!/bin/ruby

################################################################################
# This is a rather simple problem in most modern languages. Languages
# such as Ruby or Python will autobox integers to BigInt once the number
# becomes too large. However, most system languages such as C/C++, Java, etc.
# will require the explicit use of BigInt. The important point to know is
# that the solution requires the efficient use of an array of numbers.
################################################################################

s = 0
n = gets.strip.to_i
(1..n).each do
    s += gets.strip.to_i    # Ruby will autobox to BigInt
end

puts s.to_s[0...10]         # only print out the first 10 digits (highest-ordered)
