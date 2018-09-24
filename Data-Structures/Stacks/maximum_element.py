#!/bin/python3

'''
The solution to this problem is fairly straightforward. To handle queries
1 and 2, we must implement a stack that can push x onto the stack and
pop x off of the stack. However, to satisfy query 3, we must have a second
stack which records the largest elements of the stack in the order that
they appear so that if the largest element gets popped from the stack,
the second stack will know what the next largest element is.
'''

stack, max_stack = [], []  # type: List[int], type: List[int]

n = int(input())  # type: int
for _ in range(n):
    query = tuple(map(int, input().split()))  # type: Tuple[int]
    qtype, x = None, None  # type: int, type: int
    if len(query) == 1:
        qtype = query[0]
    else:
        qtype, x = query
    if qtype == 1:
        stack.append(x)  # push x onto the stack (query 1)
        if not max_stack or x >= max_stack[-1]:  # check if x is the new best
            max_stack.append(x)  # record that x is the largest element
    elif qtype == 2:
        x = stack.pop()  # pop x from the stack (query 2)
        if max_stack and x == max_stack[-1]:
            max_stack.pop()  # pop x from max_stack if its the largest
    else:
        print(max_stack[-1])  # print the top of max_stack (query 3)
