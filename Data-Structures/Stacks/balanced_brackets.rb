#!/bin/ruby

################################################################################
# The solution for this can be performed in O(n) time with O(n) memory. The
# opening brackets can be listed in any order, but, to be properly matched,
# the closing brackets must appear in reverse order. To check this, we
# can implement a stack and then pop from the top as we match opening
# brackets to closing brackets. This can also match pairs of brackets which
# are siblings as well.
################################################################################

n = gets.strip.to_i
(1..n).each do
    s = gets.strip
    stack = []                                      # the stack of opening brackets
    s.each_char do |s_i|
        if s_i == '(' || s_i == '[' || s_i == '{'
            stack.push(s_i)                         # push all opening brackets onto the stack
        elsif stack.empty?                          # check for strings that begin with closing
            stack.push(nil)                         # push nil so that stack isn't empty
            break
        elsif stack.last == '(' && s_i == ')'
            stack.pop()                             # only pop if they match
        elsif stack.last == '[' && s_i == ']'
            stack.pop()                             # only pop if they match
        elsif stack.last == '{' && s_i == '}'
            stack.pop()                             # only pop if they match
        else
            break                                   # no solution if they don't match
        end
    end
    if stack.empty?
        puts "YES"                                  # all brackets matched so stack is empty
    else
        puts "NO"                                   # some bracket wasn't matched
    end
end
