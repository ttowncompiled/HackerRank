#!/bin/ruby

################################################################################
# We can define the solution to this problem using recursion:
#
#   def choose(a, b, i, j, x)
#       if x < a.next and x < b.next
#           return 0
#       else if a.next <= x < b.next
#           return 1 + choose(a, b, i+1, j, x-a[i])
#       else if b.next <= x < a.next
#           return 1 + choose(a, b, i, j+1, x-b[j])
#       else
#           return 1 + max{ choose(a, b, i+1, j, x-a[i]),
#                           choose(a, b, i, j+1, x-b[j]) }
#       end
#   end
#
# However, this solution will lead to a stack overflow. To prevent the
# stack overflow, we must rewrite the recursive definition above to use
# an explicit stack. The question is what should be pushed to the stack?
# There are two stacks of cups: a and b. We can use our explicit stack
# to store the cups we take from a, but not from b. After we've taken
# as many cups from a and then b that we can, we put cups back on a, and
# then take as many more b cups that we can. Each time we do so, we
# record the maximum number of cups that we've been able to set aside.
# The crux of this problem is recognize that taking cups a, b, a is the
# same as taking cups a, a, b or b, a, a. The order doesn't matter.
# This is also why we don't store b cups on our explicit stack.
# Because the order doesn't matter, we can just focus on how many more b cups
# we can get for one a cup.
################################################################################

g = gets.strip.to_i
(1..g).each do
    n, m, x = gets.strip.split.map(&:to_i)
    a = gets.strip.split.map(&:to_i)
    b = gets.strip.split.map(&:to_i)
    i = j = 0                               # rather than unshifting, we can use idxes
    stack = []
    while i < a.length && a[i] <= x         # take as many cups from a as we can
        x -= a[i]
        stack.push(a[i])                    # push each cup we take from a to the stack
        i += 1
    end
    while j < b.length && b[j] <= x         # if we've taken all of a, take some from b
        x -= b[j]
        j += 1
    end
    max_cups = cups = i + j                 # record the number of cups taken from a and b
    while j < b.length && ! stack.empty?    # once we've taken all cups from b, we're done
        a_i = stack.pop()                   # replace the cups of a, one at a time
        x += a_i
        cups -= 1
        while j < b.length && b[j] <= x     # take more cups from b
            x -= b[j]
            cups += 1
            j += 1
        end
        if cups > max_cups
            max_cups = cups                 # update max_cups, if we were able to take more
        end
    end
    puts max_cups
end
