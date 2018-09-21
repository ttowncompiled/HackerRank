#!/bin/ruby

################################################################################
# This problem requires dynamic programming, caching, and memoization to
# solve. Each solution should be cached. Since each solution requires the
# longest chain length of any integer less than N, we must check every
# integer i <= N, memo the computation, and cache the solution. There is no
# reason to cache eagerly and it could fail some test cases so we can just
# cache lazily by checking if N is cached and doing a lookup with memo and
# caching if it is not. The solution is the largest i with the largest chain
# length which is also <= N. Rather than implement a base case, we can just
# store the base cases in both the memo and cache prior to computation. The
# other catch to this problem is that it is impossible to memo intermediate
# results. Some chain lengths are so long that any implementation which
# attempts to use a stack or recursion (uses a stack implicitly) will
# create so many records that the machine will run out of memory. Therefore,
# we can only memo the computations that we use for each cache solution.
# However, this alone will not be fast enough. To increase performance,
# we can extend the base case to include all powers of 2 since the solution
# for any power of 2**x is just x. This can be done in O(1) time,
# technically. This is a great problem for balancing both time and memory.
################################################################################

def chain_length(memo, n)
    chain_length, d = 0, n                  # record chain length
    while ! memo.has_key?(d)                # don't redo computations
        chain_length += 1
        if d % 2 == 0
            d = d / 2
        else
            d = 3*d + 1
        end
    end
    chain_length += memo[d]
    return chain_length
end

def lookup!(cache, memo, n)
    ((cache.length+1)..n).each do |i|
        memo[i] = chain_length(memo, i)     # memo all computations of chain_length
        if memo[i] >= memo[cache[i-2]]      # cache largest chain_length and largest i
            cache.push(i)
        else
            cache.push(cache[i-2])          # best solution was prior solution
        end
    end
    return cache[n-1]
end

memo, cache = { 1 => 0 }, [ 1 ]             # must memo and cache, provide initial solutions

i, k = 1, 2
while k < 5000000                           # provides baseline, easy to compute, efficient
    memo[k] = i                             # memo all powers of 2 prior
    i += 1
    k *= 2
end

t = gets.strip.to_i
(1..t).each do
    n = gets.strip.to_i
    if n < cache.length                     # all solutions of n up to n = cache.length are known
        puts cache[n-1]                     # the solution that was cached prior
    else
        puts lookup!(cache, memo, n)        # solution is unknown, lookup, memo, and cache
    end
end
