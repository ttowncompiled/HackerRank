#!/bin/python3

'''
The solution for this can be performed in O(n) time with O(n) memory. The
opening brackets can be listed in any order, but, to be properly matched,
the closing brackets must appear in reverse order. To check this, we
can implement a stack and then pop from the top as we match opening
brackets to closing brackets. This can also match pairs of brackets which
are siblings as well.
'''

n = int(input()) # type: int
for _ in range(n):
    s = input() # type: str
    stack = [] # type: List[str]
    # s_i: type str
    for s_i in s:
        if s_i == '(' or s_i == '[' or s_i == '{':
            stack.append(s_i)                       # push all opening brackets onto the stack
        elif not stack:                             # check for strings that begin with closing
            stack.append(None)                      # push nil so that stack isn't empty
            break
        elif stack[-1] == '(' and s_i == ')':
            stack.pop()                             # only pop if they match
        elif stack[-1] == '[' and s_i == ']':
            stack.pop()                             # only pop if they match
        elif stack[-1] == '{' and s_i == '}':
            stack.pop()                             # only pop if they match
        else:
            break                                   # no solution if they don't match
    if not stack:
        print("YES")                                # all brackets matched so stack is empty
    else:
        print("NO")                                 # some bracket wasn't matched
