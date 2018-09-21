#!/bin/ruby

################################################################################
# The O(N) computation is to iterate over the string, multiplying by each
# new element and dividing by the (i-K)th element. The only catch is that
# there are 0s in the string. Therefore, when the (i-K)th element is a 0,
# a new accumulated product of K consecutive digits needs to be computed. The
# solution is computed by taking the best product at each step.
################################################################################

t = gets.strip.to_i
(1..t).each do
    n, k = gets.strip.split.map(&:to_i)
    d = gets.strip.each_char.map(&:to_i)
    s = p = d[0...k].reduce(&:*)
    (k...n).each do |i|
        if d[i-k] == 0
            p = d[(i-k+1)..i].reduce(&:*)   # recompute acc product
        else
            p = p * d[i] / d[i-k]           # accumulate one digit and reduce by another
        end
        s = [ s, p ].max
    end
    puts s
end
